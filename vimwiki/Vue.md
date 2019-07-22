

# Vue.js Guide
* https://vuejs.org/v2/guide/list.html
* https://github.com/flaviocopes/vue-developer-roadmap

# Don't forget to intsall webpacker if you need it!!!
bundle exec rails webpacker:install

# Action Cable Vue
```javascript
  Vue.use(ActionCableVue, {
    debug: true,
    debugLevel: 'error',
    connectionUrl: 'http://localhost:3000/cable'
  });
```

# Shortcuts

```javascript
 // You can use the @ symbol to replace v-on
 <p v-on:click="doSomething()"></p>
 <p @click="doSomething()"></p>
 
 
 <img v-bind:src="product.image" alt="">
 <img :src="product.image" alt="">
 
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


# V-Model example
```javascript
  <input v-model="items[0].message"></input>
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


# Vue Show


```javascript
<div v­show="showMe">
  <p>Some text</p>
  <p>Some more text</p> 
  <p>Even more text</p>
</div> 
```


# Vue Lifecyle methods
```javascript


var APP_LOG_LIFECYCLE_EVENTS = true; 1
var webstore = new Vue({ el: "#app",
data: {
sitename: "Vue.js Pet Depot", },
beforeCreate: function() { 
 if (APP_LOG_LIFECYCLE_EVENTS) { 
  console.log("beforeCreate"); 
   }
    }, 
    created: function() { 
     if (APP_LOG_LIFECYCLE_EVENTS) { 
      console.log("created"); 
       }
       },
       beforeMount: function() { 
       if (APP_LOG_LIFECYCLE_EVENTS) { 
       console.log("beforeMount"); 
       }
       }, 
       mounted: function() { 
      if (APP_LOG_LIFECYCLE_EVENTS) { 
       console.log("mounted"); 
        }
        }, 
        beforeUpdate: function() { 
        if (APP_LOG_LIFECYCLE_EVENTS) { 
        console.log("beforeUpdate"); 
        }
        }, 
        updated: function() { 
          if (APP_LOG_LIFECYCLE_EVENTS) { 
          console.log("updated"); 
          }
        }, 
        beforeDestroy: function() { 
          if (APP_LOG_LIFECYCLE_EVENTS) { 
          console.log("beforeDestroy "); 
          }
        },
        destroyed: function() { 
          if (APP_LOG_LIFECYCLE_EVENTS) { 
            console.log("destroyed"); 
          }
        }
        
});


```


# V-if and V-Show
The only real difference is that the v­show directive will 
always be rendered in the DOM.

