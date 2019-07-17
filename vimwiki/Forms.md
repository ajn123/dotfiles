
[requirs](requirs) "#{Rails.root}/app/helpers/application_helper"


# Form Helpers

## REMEMBER: to but the '=' on the form_for
```rails
# Do not forget the '=' in form_for .erb injection

<%= form_for(@comment) do |f| %>
            <div>
              <%= f.label 'User Name:' %>
              <%= f.text_field :user_name %>

              <%= f.label 'text:'  %>
              <%= f.text_field :text %>
            </div>

            <%= f.hidden_field :subject_id, value: subject.id %>

            <%= f.submit('Create comment') %>
<% end %>

<%= form_for(comment, method: :patch) do |f| %>
                    <%= f.hidden_field :vote_count, value: comment.vote_count - 1 %>
                    <%= f.submit('down vote') %>
<% end %>

```


```ruby
<%= text_area_tag(:message, "Hi, nice site", size: "24x6") %>
<%= password_field_tag(:password) %>
<%= hidden_field_tag(:parent_id, "5") %>
<%= search_field(:user, :name) %>
<%= telephone_field(:user, :phone) %>
<%= date_field(:user, :born_on) %>
<%= datetime_local_field(:user, :graduation_day) %>
<%= month_field(:user, :birthday_month) %>
<%= week_field(:user, :birthday_week) %>
<%= url_field(:user, :homepage) %>
<%= email_field(:user, :address) %>
<%= color_field(:user, :favorite_color) %>
<%= time_field(:task, :started_at) %>
<%= number_field(:product, :price, in: 1.0..20.0, step: 0.5) %>
<%= range_field(:product, :discount, in: 1..100) %>
```
