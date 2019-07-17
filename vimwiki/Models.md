* [Polymorphic Associations](https://launchschool.com/blog/understanding-polymorphic-associations-in-rails)
* [Model Call Backs](https://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html)


# SCOPE
```ruby
class Country < ApplicationRecord
	scope :important, -> { where(continent: 'Asia')}
  scope :cheap, -> { where(price: 0..1) }
end
```

# VALIDATIONS
```ruby
validates :first_name, :last_name, presence: true
validates :username, uniqueness: { case_sensitive: false }

validates :username, length: { maximum: 15 }
validates :first_name, length: { minimum: 1}
validates :password, length: { in:10..50 }

# Numbers
validates :population, numericality: {greater_than: 400}
validates :points, numericality: true
validates :games_played, numericality: { only_integer: true }

# not a real email regex
validates :email, format: { with: /\w_@\w_.\w*/ }

validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
message: 'is not a valid email address' }

```

# VALIDATION ERRORS
```ruby
p = Person.new
p.save  # false
p.errors.messages
# {:first_name=>["can't be blank"], :last_name=>["can't be blank"], :age=>["can't be blank", "is not a number"]}
# alternatively:
p.errors.full_messages
# ["First name can't be blank", "Last name can't be blank", "Age can't be blank", "Age is not a number"]

```

# RAW SQL
```sql
ActiveRecord::Base.connection.select_all(raw_sql)

ActiveRecord::Base.connection.select_all('SELECT username, COUNT(photos.likes) FROM users JOIN photos ON (users.id = photos.user_id) GROUP BY photos.user_id')

```

# HAS MANY ASSOCIATIONS

```ruby

class Student < ApplicationRecord
  has_many :klasses
  has_many :tutors, through: :klasses
end
class Tutor < ApplicationRecord
  has_many :klasses
  has_many :students, through: :klasses
end
class Klass < ApplicationRecord
  belongs_to :student
  belongs_to :tutor
end

```

# Join table 

```ruby 
class User < ApplicationRecord

  has_secure_password

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship", 
                                   foreign_key: "followed_id",
                                   dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :followers, through: :passive_relationships, source: :follower

end

class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end


```

# Self Referential Join table 

```ruby 
class User < ApplicationRecord

    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user
end 

  class Friendship < ApplicationRecord
  	belongs_to :user
    belongs_to :friend, :class_name => "User"
  end

```

# Model Overrides

```ruby
def to_param
	"#{id}-#{username.parameterize}"
end
 
 ```
 
 # Batches

##### ActiveRecord stores the results of a query in memory, with very large tables and results that can become a performance issue. To address this, you can use the find_each method that splits up the query into batches with the default size of 1,000 (can be configured with the :batch_size option). The example Album table is too small to show the effect, but the method would be used like this: 
```ruby

```

# Call Backs - How to fail
 * before_validation: Executed before the validation
* after_validation: Executed after the validation
* before_save: Executed before each save
* before_create: Executed before the first save
* after_save: Executed after every save
* after_create: Executed after the first save

```ruby
```


## HOW TO SCOPE VALIDATIONS

```ruby
 validates :name, uniqueness: { scope: :year,
    message: "should happen once per year" }
```
