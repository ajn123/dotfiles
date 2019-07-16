
# Add gem
```ruby
group :development, :test do
  gem 'factory_bot_rails'
end

```


```ruby

FactoryBot.define do
  
  factory :list_one, class: List do
    title { Faker::Lorem.sentence}
  end
end
```


