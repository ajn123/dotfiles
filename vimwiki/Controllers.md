# Naming Convention
The naming convention of controllers in Rails favors pluralization of the last word in the controller's name, although it is not strictly required (e.g. ApplicationController). For example, ClientsController is preferable to ClientController, SiteAdminsController is preferable to SiteAdminController or SitesAdminsController, and so on.


-----


* #### [Rails Controller GUIDE](https://guides.rubyonrails.org/action_controller_overview.html)
# Strong Parameters
```ruby
class PeopleController < ActionController::Base
  # This will pass with flying colors as long as there's a person key
  # in the parameters, otherwise it'll raise a
  # ActionController::ParameterMissing exception, which will get
  # caught by ActionController::Base and turned into a 400 Bad
  # Request error.
  def update
    person = current_account.people.find(params[:id])
    person.update!(person_params)
    redirect_to person
  end
 
  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def person_params
      params.require(:person).permit(:name, :age)
    end
end
```

# FILTERS
Filters are methods that are run "before", "after" or "around" a controller action.

#### Note: if you want to skip the CSFR validation, use


```ruby
skip_before_action :verify_authenticity_token


class ApplicationController < ActionController::Base
  before_action :require_login
 
  private
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end
end
```


# REDIRECT VS RENDER
### Render
Calling render will create a full response that is sent back to the browser.

* If you don’t include a call to render in your controller action then it is assumed you are trying to render the view of the same name as your controller action inside a folder of the same name as your controller. This means that the following code will look for app/views/foos/my_action.html.erb;

* You should not make the browser need to make a fresh call unless you really have to, so always question when you are using redirect_to and if it is the right thing, or perhaps a render would be better.

* A render doesn’t change the URL of the page you are visiting, which can lead to a confusing user experience if they visit /foo but because of some render magic start seeing a layout associated with /bar.

* If you call render :new from a different controller only the view will be rendered not any of the other logic within the method i.e. instance variables (@var). However if you use redirect_to you can use instance variables within the view as redirect_to hits the controller (thanks Sami B & Shane!).

* If you use render instead of redirect_to when setting error messages you should use flash.now[:error] and not flash[:error]. This is because the flash message may not show up on the page that is rendered but will show up on the next page that is visited leading to a confusing user experience (thanks Ed!).








