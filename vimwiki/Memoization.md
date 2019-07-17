In Ruby, it’s common to use memoization to make sure that instance variables in a method only 
get set once regardless of how many times the method is called. For example:


* https://thoughtbot.com/blog/ruby-memoization-and-alternatives

```ruby
class Dashboard
  def users
    @users ||= Users.all
  end
end

```
