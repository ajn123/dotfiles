[Faker Github Link](https://github.com/stympy/faker)


```ruby
# In your gemfiles
gem 'faker'

```


```ruby
require 'faker'

50.times do
  Country.create!(name: Faker::Company.bs , continent: continents.sample,
    area: Faker::Number.number(10),
    gdp: Faker::Number.between(20000,10000000),
    population: Faker::Number.between(500000,2000000000))
  end
  
  
  Faker::Name.unique.name # This will return a unique name every time it is called

```
