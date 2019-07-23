


```ruby
  def try
    if block_given?
      yield
    else
      "no block"
    end
  end
```
