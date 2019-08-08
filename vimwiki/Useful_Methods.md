


# blank?
Checks if the string is empty? or nil?.  This is good for either string check

# dig
Extracts the nested parameter from the given keys by calling dig at each 
step. Returns nil if any intermediate step is nil.

# tap

Yields self to the block, and then returns self. The primary purpose of this
method is to “tap into” a method chain, in order to perform operations on
intermediate results within the chain.

```ruby
(1..10)                  .tap {|x| puts "original: #{x}" }
  .to_a                  .tap {|x| puts "array:    #{x}" }
  .select {|x| x.even? } .tap {|x| puts "evens:    #{x}" }
  .map {|x| x*x }        .tap {|x| puts "squares:  #{x}" }
```
