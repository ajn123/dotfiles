* [RSpec Guidelines](http://www.betterspecs.org/)
* [Rspec Thoughtbot Guide](https://thoughtbot.com/blog/how-we-test-rails-applications)

### Testing Rails
* [Rspec Models](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec)
* [Rspec Controllers](https://relishapp.com/rspec/rspec-rails/docs/controller-specs) && [Controllers 2](https://everydayrails.com/2016/08/29/replace-rspec-controller-tests.html)
* [Rspec Thoughtbot](https://thoughtbot.com/blog/how-we-test-rails-applications)

## Gemfile
```ruby
require 'rspec-rails'
require 'capybara'
```



# Example Sec
```ruby

require 'rails_helper'

describe "Vistiting Page do
  it "shows the event" do
    
    end
end
```



### Equivalence

```ruby
expect(actual).to eq(expected)  # passes if actual == expected
expect(actual).to eql(expected) # passes if actual.eql?(expected)
expect(actual).not_to eql(not_expected) # passes if not(actual.eql?(expected))
```

Note: The new `expect` syntax no longer supports the `==` matcher.

### Identity

```ruby
expect(actual).to be(expected)    # passes if actual.equal?(expected)
expect(actual).to equal(expected) # passes if actual.equal?(expected)
```

### Comparisons

```ruby
expect(actual).to be >  expected
expect(actual).to be >= expected
expect(actual).to be <= expected
expect(actual).to be <  expected
expect(actual).to be_within(delta).of(expected)
```

### Regular expressions

```ruby
expect(actual).to match(/expression/)
```

Note: The new `expect` syntax no longer supports the `=~` matcher.

### Types/classes

```ruby
expect(actual).to be_an_instance_of(expected) # passes if actual.class == expected
expect(actual).to be_a(expected)              # passes if actual.kind_of?(expected)
expect(actual).to be_an(expected)             # an alias for be_a
expect(actual).to be_a_kind_of(expected)      # another alias
```

### Truthiness

```ruby
expect(actual).to be_truthy   # passes if actual is truthy (not nil or false)
expect(actual).to be true     # passes if actual == true
expect(actual).to be_falsy    # passes if actual is falsy (nil or false)
expect(actual).to be false    # passes if actual == false
expect(actual).to be_nil      # passes if actual is nil
expect(actual).to_not be_nil  # passes if actual is not nil
```

### Expecting errors

```ruby
expect { ... }.to raise_error
expect { ... }.to raise_error(ErrorClass)
expect { ... }.to raise_error("message")
expect { ... }.to raise_error(ErrorClass, "message")
```

### Expecting throws

```ruby
expect { ... }.to throw_symbol
expect { ... }.to throw_symbol(:symbol)
expect { ... }.to throw_symbol(:symbol, 'value')
```

### Yielding

```ruby
expect { |b| 5.tap(&b) }.to yield_control # passes regardless of yielded args

expect { |b| yield_if_true(true, &b) }.to yield_with_no_args # passes only if no args are yielded

expect { |b| 5.tap(&b) }.to yield_with_args(5)
expect { |b| 5.tap(&b) }.to yield_with_args(Integer)
expect { |b| "a string".tap(&b) }.to yield_with_args(/str/)

expect { |b| [1, 2, 3].each(&b) }.to yield_successive_args(1, 2, 3)
expect { |b| { :a => 1, :b => 2 }.each(&b) }.to yield_successive_args([:a, 1], [:b, 2])
```

### Predicate matchers

```ruby
expect(actual).to be_xxx         # passes if actual.xxx?
expect(actual).to have_xxx(:arg) # passes if actual.has_xxx?(:arg)
```

### Ranges (Ruby >= 1.9 only)

```ruby
expect(1..10).to cover(3)
```

### Collection membership

```ruby
# exact order, entire collection
expect(actual).to eq(expected)

# exact order, partial collection (based on an exact position)
expect(actual).to start_with(expected)
expect(actual).to end_with(expected)

# any order, entire collection
expect(actual).to match_array(expected)

# You can also express this by passing the expected elements
# as individual arguments
expect(actual).to contain_exactly(expected_element1, expected_element2)

 # any order, partial collection
expect(actual).to include(expected)
```

#### Examples

```ruby
expect([1, 2, 3]).to eq([1, 2, 3])            # Order dependent equality check
expect([1, 2, 3]).to include(1)               # Exact ordering, partial collection matches
expect([1, 2, 3]).to include(2, 3)            #
expect([1, 2, 3]).to start_with(1)            # As above, but from the start of the collection
expect([1, 2, 3]).to start_with(1, 2)         #
expect([1, 2, 3]).to end_with(3)              # As above but from the end of the collection
expect([1, 2, 3]).to end_with(2, 3)           #
expect({:a => 'b'}).to include(:a => 'b')     # Matching within hashes
expect("this string").to include("is str")    # Matching within strings
expect("this string").to start_with("this")   #
expect("this string").to end_with("ring")     #
expect([1, 2, 3]).to contain_exactly(2, 3, 1) # Order independent matches
expect([1, 2, 3]).to match_array([3, 2, 1])   #

# Order dependent compound matchers
expect(
  [{:a => 'hash'},{:a => 'another'}]
).to match([a_hash_including(:a => 'hash'), a_hash_including(:a => 'another')])
```

## `should` syntax

In addition to the `expect` syntax, rspec-expectations continues to support the
`should` syntax:

```ruby
actual.should eq expected
actual.should be > 3
[1, 2, 3].should_not include 4
```
# Controller Test example

```ruby
require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do
  describe "GET index" do
    it "is successful" do
      get :index
      expect(response).to have_http_status(:ok)
    end

  end


  describe "POST index" do
    it "is successful" do
      post :index, params: { list: {title: "Christmas list" } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE list" do

    let!(:list) { FactoryBot.create(:list_one)}

    it "is succussful" do
      id = list.id
      delete :destroy, params: { id: id}
      expect(response).to have_http_status(:ok)
      expect(List.count).to be(0)
    end
  end
end
```


# Expect Change
```ruby
class Counter
  class << self
    def increment
      @count ||= 0
      @count += 1
    end
    
    def count
      @count ||= 0
    end
  end
end

# NOTE: you have to use a block for a change method

describe Counter, "#increment" do
  it "should not increment the count by 2" do
    expect{Counter.increment}.to_not change{Counter.count}.from(0).to(2)
  end

  # deliberate failure
  it "should not increment the count by 1" do
    expect{Counter.increment}.to_not change{Counter.count}.by(1)
  end
end
```


