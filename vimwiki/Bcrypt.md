### Adding the Bcrypt Gem gives you a password digest

``` ruby

class User < ApplicationRecord
  has_secure_password


  def self.authenticate_user(username,password)
    user = User.find_by_username(username)
    if user &&  user.authenticate(password)
      user
    else
      false
    end
  end
end
```
