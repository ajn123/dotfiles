[##](##) Additional Resources

* [Rails Guide on Routing][rails-routing]

[rails-routing]: http://guides.rubyonrails.org/routing.html

```ruby
# config/routes.rb
FlickrClone::Application.routes.draw do
  resources :photos
end
```

This single line in `config/routes.rb` will generate a map of the
following requests for URLs to a set of controller actions in the
`PhotosController`.

| HTTP Verb          | Path             | action  | used for                                     |
| ------------------ | ---------------- | ------- | -------------------------------------------- |
| GET                | /photos          | index   | display a list of all photos                 |
| GET                | /photos/new      | new     | return an HTML form for creating a new photo |
| POST               | /photos          | create  | upload and create a new photo                |
| GET                | /photos/:id      | show    | display a specific photo                     |
| GET                | /photos/:id/edit | edit    | return an HTML form for editing a photo      |
| PATCH or PUT       | /photos/:id      | update  | update a specific photo                      |
| DELETE             | /photos/:id      | destroy | delete a specific photo                      |



-----




To get a complete list of the available routes in your application,
execute the `rails routes` command in your terminal. This will list all
of your routes, in the same order that they appear in `routes.rb`. For
each route, you'll see:

* The route name; you can tack `_url` after this to get the routing
  helper,
* The HTTP verb used,
* The URL pattern to match,
* The `controller#action` to route to

For example, here's a small section of the `rails routes` output for a
RESTful route:

```
    users GET    /users(.:format)          users#index
          POST   /users(.:format)          users#create
 new_user GET    /users/new(.:format)      users#new
edit_user GET    /users/:id/edit(.:format) users#edit
```

Notice that the create route does not repeat the URL name
`users`. Rails does this to reduce redundancy, since the create route
has the same URL structure as the index action.


-----



## Using `root`

You can specify the controller action that Rails should run for `GET /` by
using the `root` method:

```ruby
root to: 'posts#index'
```

This invokes the `PostsController`'s `index` method when the root URL
is requested.
# DELETE LINK
```ruby
 link_to "log out", session_path, :method => :delete, data: {confirm: "Are you sure?"}
```

# Examples
```ruby
resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]

# Custom link
get '/patients/:id', to: 'patients#show', as: 'patient'

```
