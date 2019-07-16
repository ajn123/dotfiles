[Layout Guide](https://guides.rubyonrails.org/layouts_and_rendering.html#using-render)

## Rendering Collections
Partials are very useful in rendering collections. When you pass a collection to a partial via the :collection option, the partial will be inserted once for each member in the collection:

index.html.erb

```ruby
<h1>Products</h1>
<%= render partial: "product", collection: @products %>
_product.html.erb
```


```ruby
<p>Product Name: <%= product.name %></p>
```

When a partial is called with a pluralized collection, then the individual instances of the partial have access to the member of the collection being rendered via a variable named after the partial. In this case, the partial is _product, and within the _product partial, you can refer to product to get the instance that is being rendered.

There is also a shorthand for this. Assuming @products is a collection of product instances, you can simply write this in the index.html.erb to produce 

```ruby
<%= render @products %>

 # Renders the same partial with a local variable.
  render :partial => "person", :locals => { :name => "david" }

  # Renders the partial, making @new_person available through
  # the local variable 'person'
  render :partial => "person", :object => @new_person

```


## Spacer Templates

```ruby
<%= render partial: @products, spacer_template: "product_ruler" %>
```

Rails will render the _product_ruler partial (with no data passed in to it) between each pair of _product partials.












