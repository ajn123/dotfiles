* helper link:  http://ricostacruz.com/cheatsheets/devise.html
* https://launchschool.com/blog/how-to-use-devise-in-rails-for-authentication
* https://gorails.com/blog/rails-4-0-and-devise-with-strong-params-and-custom-fields

```ruby
First we will install Devise.
$ gem install devise
This will install devise. After that we need to add devise into your Gemfile. This can be done by typing
$ gem 'devise'
within your Gemfile. Your Gemfile is within your application’s root folder. Next run the generator by using the command
$ rails generate devise:install

rails g devise:views

rails generate devise MODEL (probably User)  


#In case you want to permit additional parameters (the lazy way™), you can do #so using a simple before filter in your ApplicationController:
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
```


#Devise NavBar:
```ruby

<nav>
  <div>
    
    <div>
      <a href="/">SubscriptionApp</a>
    </div>

    
    <div>
      <ul>
        <% if user_signed_in? %>
          <li>
            <a href="#">Signed in as <%= current_user.email %></a>
          </li>
          <li>
            <%= link_to "Sign out", destroy_user_session_path, method: :delete %>
          </li>
        <% else %>
          <li>
            <%= link_to "Sign in", new_user_session_path %>
          </li>
          <li>
            <%= link_to "Sign up", new_user_registration_path %>
          </li>
        <% end %>
      </ul>
    </div>
  </div>
</nav>
```


# Devise Model
to install devise User
```
rails g devise User
```
