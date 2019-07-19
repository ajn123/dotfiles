


# Rails Guides
* [Rails guides: Action Cable](https://guides.rubyonrails.org/action_cable_overview.html)
* [Learn Enough to be dangerous](https://www.learnenough.com/action-cable-tutorial)





# Broadcast
```ruby
    ActionCable.server.broadcast 'list_channel',
                                  title: list.title
                                  
    ActionCable.server.broadcast 'list_channel',
                                 title: list.title,
                                 list: list.as_json(include: [:items])
```



# Action Cable 
```ruby
  class ListChannel < ApplicationCable::Channel
    def subscribed
      stream_from 'list_channel'
      # stream_from "some_channel"
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  end
```
