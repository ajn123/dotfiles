#SASS or SCSS GUIDE
* [Sass_Guide](https://sass-lang.com/guide)


The plus sign (+) is the adjacent sibling combinator, between two paragraph 
tag (element) selectors. What this means is "select any paragraph tag that 
is directly after another paragraph tag (with nothing in between)". Here's some examples of what it would select:



(>) It means "select elements that are direct descendants only". In this case:
"select list items that are direct descendants of an ordered list". To illustrate:



The Tilda (~) 
```css
.featured-image ~ p {
  font-size: 90%;
}
```
In that example, you would be selecting all paragraphs in an article that come after the featured image 


# Variable
Use a dollar sign
```css
$font-stack:    Helvetica, sans-serif;
$primary-color: #333;
$box-shadow-bottom-only: 0 2px 1px 0 rgba(0, 0, 0, 0.2);

body {
  font: 100% $font-stack;
  color: $primary-color;
}
```


#Mixin


```css
@mixin square($size, $color) {
  width: $size;
  height: $size;
  background-color: $color;
}

.small-blue-square {
  @include square(20px, rgb(0,0,255));
}

.big-red-square {
  @include square(300px, rgb(255,0,0));
}
```

# Nesting
```css
ul {
  list-style: none;

  li {
    padding: 15px;
    display: inline-block;

    a {
      text-decoration: none;
      font-size: 16px;
      color: #444;
    }

  }

}


.button {
  &:visited { }
  &:hover { }
  &:active { }
}
```


# Functions
* [SASS_Color_Function](https://sass-lang.com/documentation/functions/color)


```css
$awesome-blue: #2196F3;

a {
  padding: 10px 15px;
  background-color: $awesome-blue;
}

a:hover {
  background-color: darken($awesome-blue,10%);
}
```
