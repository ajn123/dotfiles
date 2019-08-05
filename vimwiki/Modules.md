Modules are a way of grouping together methods, classes, and constants. 
Modules give you two major benefits: 

```ruby
  module Trig
    PI = 3.141592654
    def Trig.sin(x)
    # ..
    end
    def Trig.cos(x)
    # ..
    end
  end

```


# Mixin
Modules have another, wonderful use. At a stroke, they pretty much eliminate the 
need for multiple inheritance, providing a facility called a mixin.

In the previous section's examples, we defined module methods, methods whose names were prefixed by the module name. 
If this made you think of class methods, your next thought might well be ``what happens if I define instance methods 
within a module?'' Good question. A module can't have instances, because a module isn't a class. However, 
you can include a module within a class definition. When this happens, all the module's instance methods are 
suddenly available as methods in the class as well. They get mixed in. 
In fact, mixed-in modules effectively behave as superclasses. 

```ruby
  Module Debug
    def whoAmI?
      "#{self.type.name} (\##{self.id}): #{self.to_s}"
    end
  end
  class Phonograph
    include Debug
    # ...
  end
  class EightTrack
    include Debug
    # ...
  end
ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")
ph.whoAmI? 	» 	"Phonograph (#537766170): West End Blues"
et.whoAmI? 	» 	"EightTrack (#537765860): Surrealistic Pillow"

```

By including Debug the two classes gain access tothe whoAmI method?

# Include
Ruby include statement simply makes a reference to a named module. If that module is in a separate file, you must use require 
to drag that file in before using include. Second, a Ruby include does not simply copy the module's instance methods into the 
class. Instead, it makes a reference from the class to the included module. If multiple classes include that module, they'll 
all point to the same thing. If you change the definition of a method within a module, even while your program is running, 
all classes that include that module will exhibit the new behavior.[Of course, we're speaking only of methods here. 
Instance variables are always per-object, for example.]
