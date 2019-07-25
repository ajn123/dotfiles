

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

You can also loop through objects with v-for

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
// Object example

<div v-for="(value, name) in object">
  {{ name}} : {{ value }}
</div>


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


# Watchers
You can the new and old parameters to the watched values,
by 'watching' a variable in the watch Group

```javascript
var watchExampleVM = new Vue({
  el: '#watch-example',
  data: {
    question: '',
    answer: 'I cannot give you an answer until you ask a question!'
  },
  watch: {
    // whenever question changes, this function will run
    question: function (newQuestion, oldQuestion) {
      this.answer = 'Waiting for you to stop typing...'
      this.debouncedGetAnswer()
    }
  },
  created: function () {
    // _.debounce is a function provided by lodash to limit how
    // often a particularly expensive operation can be run.
    // In this case, we want to limit how often we access
    // yesno.wtf/api, waiting until the user has completely
    // finished typing before making the ajax request. To learn
    // more about the _.debounce function (and its cousin
    // _.throttle), visit: https://lodash.com/docs#debounce
    this.debouncedGetAnswer = _.debounce(this.getAnswer, 500)
  },
  methods: {
    getAnswer: function () {
      if (this.question.indexOf('?') === -1) {
        this.answer = 'Questions usually contain a question mark. ;-)'
        return
      }
      this.answer = 'Thinking...'
      var vm = this
      axios.get('https://yesno.wtf/api')
        .then(function (response) {
          vm.answer = _.capitalize(response.data.answer)
        })
        .catch(function (error) {
          vm.answer = 'Error! Could not reach the API. ' + error
        })
    }
  }
})

```


# V-bind (:)
You can use v-bind to dynamically update html through your javascript

```javascript
<div v-bind:class="classObject"></div>
data: {
  isActive: true,
  error: null
},
computed: {
  classObject: function () {
    return {
      active: this.isActive && !this.error,
      'text-danger': this.error && this.error.type === 'fatal'
    }
  }
}
// This is the object syntax
<div v-bind:class="{ active: isActive }"></div>
// This is the array syntax
<div v-bind:class="[activeClass, errorClass]"></div>
data: {
  activeClass: 'active',
  errorClass: 'text-danger'
}
// This will always do errorClass but may do active class
<div v-bind:class="[isActive ? activeClass : '', errorClass]"></div>
```









