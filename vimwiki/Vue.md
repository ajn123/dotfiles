

# Vue.js Guide
* https://vuejs.org/v2/guide/list.html

# Don't forget to intsall webpacker if you need it!!!
bundle exec rails webpacker:install


# Shortcuts

```javascript
 // You can use the @ symbol to replace v-on
 <p v-on:click="doSomething()"></p>
 <p @click="doSomething()"></p>
 
 
```


```javascript
import Vue from 'vue/dist/vue.esm'

var webstore = new Vue({
  el: '#app',
  data: {sitename: "Vue.js Pet Depot",
    beforeCreate: function() {
      if(APP_LOG_LIFECYCLE_EVENTS) {
        console.log("beforeCreate"); 
      }
    }
  }

});

```

# V-For example
```javascript
var example1 = new Vue({
  el: '#example-1',
  data: {
    items: [
      { message: 'Foo' },
      { message: 'Bar' }
    ]
  }
})
``` 

```html
<ul id="example-1">
  <li v-for="item in items">
    {{ item.message }}
  </li>
</ul>
```
========
