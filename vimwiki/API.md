
* #### [Create Rails API](https://www.sitepoint.com/getting-started-with-doorkeeper-and-oauth-2-0/)
* #### [Different status codes (scroll down)](https://guides.rubyonrails.org/layouts_and_rendering.html#using-render)

### Useful status codes

| Symbol        | Code           |
| ------------- |:-------------:|
| :ok     				| 200 	|
| :no_content     				| 204 	|
| :not_found      		| 404      |
| :unprocessable_entity | 422     |
| :internal_server_error | 500     |


# Module API
```ruby
module Api
  class  ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session
    before_action :authenticate

    def authenticate
      authenticate_or_request_with_http_basic do |user,password|
        user == "phil" && password == "catspaw"
      end
    end

  end
end

```


# AS_JSON method
* [Documentation](https://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html)


## Sample Controller

```ruby
class Api::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Item.all
  end


  def show
    render json: Item.find(params[:id])
  end
  
  def create
    list = Item.new(item_params)
    if list.save
      render status: 200, json: {message: 'successfully created item', item: list }.to_json
    else
      render status: :unprocessable_entity, json: {status: 200, message: list.errors.to_s}.to_json
    end
  end

  def destroy
   item = Item.find_by_id(params[:id]) 
   if item
     item.destroy
     render status: 200, json: {
       message: "Item successfully deleted",
       item: item
     }
   else 
     render status: :unprocessable_entity, json: {message: "Could not find item #{params[:id]}"}.to_json
   end
  end

  private

  def item_params
    params.require(:item).permit(:title, :content, :due_date)
  end
end

```


# Respond_to
```ruby
def render_404
    respond_to  do |f|
      f.html do
        render status: :not_found, layout: false
      end
      f.json do
        render status: 404, json: {message: "Not fonud"}
      end
    end
  end
  ```

# Routes
Use the namespace variable which will need to be scoped in the routes.
```ruby
Rails.application.routes.draw do

  namespace :api do
    resources :items
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

```


