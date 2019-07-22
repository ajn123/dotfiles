
# N + 1 queries problem

Consider the following code, which finds 10 clients and prints their postcodes:

```ruby
clients = Client.limit(10)
 
clients.each do |client|
  puts client.address.postcode
end
```
This code looks fine at the first sight. But the problem lies within the total number of queries executed. The above code executes 1 (to find 10 clients) + 10 (one per each client to load the address) = 11 queries in total.

### Solution to N + 1 queries problem

Active Record lets you specify in advance all the associations that are going to be loaded. This is possible by specifying the includes method of the Model.find call. With includes, Active Record ensures that all of the specified associations are loaded using the minimum possible number of queries.

Revisiting the above case, we could rewrite Client.limit(10) to eager load addresses:

```ruby
clients = Client.includes(:address).limit(10)
 
clients.each do |client|
  puts client.address.postcode
end
```


-----


# WHERE

```ruby
User.where.not(name: 'Gabe')
User.where.not(name: nil)



```

----------

#### ActiveRecord stores the results of a query in memory, with very large tables and results that can become a performance issue. To address this, you can use the find_each method that splits up the query into batches with the default size of 1,000 (can be configured with the :batch_size option). The example Album table is too small to show the effect, but the method would be used like this:

```ruby
Album.where(release_year: 1960..1969).find_each do |album| 
  puts album.name.upcase
end
```

# Example Queries
```ruby
  Person.group(:last_name).having("min(age) > 17").minimum(:age)
  Person.average(:age) # SELECT AVG(age) FROM people
  Person.distinct.pluck(:role) # Returns an array of roles that are distinct
  Person.calculate(:count, :all) # The same as Person.count
```



# Callbacks
Callbacks are hooks into the life cycle of an Active Record object that allow 
you to trigger logic before or after an alteration of the object state. 

(-) save
(-) valid
(1) before_validation
(-) validate
(2) after_validation
(3) before_save
(4) before_create
(-) create
(5) after_create
(6) after_save
(7) after_commit


```ruby
  class CreditCard < ActiveRecord::Base
    # Strip everything but digits, so the user can specify "555 234 34" or
    # "5552-3434" and both will mean "55523434"
    before_validation(on: :create) do
      self.number = number.gsub(/[^0-9]/, "") if attribute_present?("number")
    end
  end

  class Subscription < ActiveRecord::Base
    before_create :record_signup

    private
      def record_signup
        self.signed_up_on = Date.today
      end
  end

  class Firm < ActiveRecord::Base
    # Disables access to the system, for associated clients and people when the firm is destroyed
    before_destroy { |record| Person.where(firm_id: record.id).update_all(access: 'disabled')   }
    before_destroy { |record| Client.where(client_of: record.id).update_all(access: 'disabled') }
  end
```
