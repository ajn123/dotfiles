
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



