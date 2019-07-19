[#](#) Rails Migration Data types

* :binary
* :boolean
* :date
* :datetime
* :decimal
* :float
* :integer
* :bigint
* :primary_key
* :references
* :string
* :text
* :time
* :timestamp


# Sample Migration
## Use rails instead of rake
``` ruby

rails generate model user pseudo:string:uniq
rails generate model user pseudo:string:index
rails generate model product 'price:decimal{10,2}'
rails generate model user auth_token:token

rails db:rollback
```

``` ruby
class UserToPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :email
      t.boolean :subscribed, default: false
      t.integer :likes, default: 0
      t.integer :user_id
      t.timestamps
    end
  end
end

```

You can also add Indexes

```ruby
  add_index :items, :list_id
```
