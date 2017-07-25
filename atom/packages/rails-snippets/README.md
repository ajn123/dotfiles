# rails-snippets package
An [atom](https://atom.io) package to add snippets for Ruby on Rails projects.

Developed with Ruby 1.9 syntax (`key: 'value'`) and rails 5 onwards in mind, but most snippets work on older versions too.

Contributions are greatly appreciated, if your favorite snippets are missing [open an issue](https://github.com/joseramonc/rails-snippets/issues) or send a pull request, I would :heart: to merge your favorite snippets.

Please fork this repository and open a pull request to add / improve snippets.

## Features
* Support .html.erb and .html.haml templates

* [Toggle between erb blocks](https://github.com/eddorre/SublimeERB):

  ![demo](http://cl.ly/image/1P2E1x0h210l/toggle_erb.gif)

Toggle with:  <kbd>cmd</kbd> + <kbd>></kbd>

(In american keyboard: <kbd>shift</kbd> + <kbd>cmd</kbd> + <kbd>.</kbd>)

#### [OPTIONAL] Customize ERB Blocks
In your atom configuration file (`config.cson`). Insert each erb block you'd like as an array with the first element as the opening erb and the 2nd element as the closing erb into rails-snippets's erbBlocks configuration array.

As an example of how'd look like:
```
# config.cson
"*":
  # all your other configs...
  "rails-snippets":
      erbBlocks: [
        ['<%=', '%>']
        ['<%', '%>']
        ['<%#', '%>']
      ]
```
If you can stick to the default (above) you don't have to do anything. Otherwise add or remove erb blocks in the order you'd like.

## Conventions
The conventions for the snippets are usually the initials for the method.

Examples:
* For `validates_presence_of` is `vpo`
* For `has_and_belongs_to_many` is `habtm`
* For `<%= link_to 'hi', path %>` is `lt` and so on.

Also if the method has an optional block like `content_tag` (snippet is `ct`), its block it's going to be adding `block` to the shortcut, in this case `ctblock`

## Snippets list

Here are some of my favorites snippets, a complete list of snippets can be seen [directly at the code](https://github.com/joseramonc/rails-snippets/tree/master/snippets) or once the package is installed at Settings > Packages > Rails Snippets
### `=loop`

![=loop_demo](http://cl.ly/image/2z0j2j043W22/=loop.gif)

### `form_for` and `fsf`

![=form_for fsf](http://cl.ly/image/0s3z1t040k16/form_for.gif)

### `scope` + (`p` `l` `bd` `j` `jp`)
![=form_for fsf](http://cl.ly/image/2U011O3j343r/scopes.gif)
* `p`roc
* `l`ambda
* `bd` Between dates
* `j`oins
* `jp`joins & proc
