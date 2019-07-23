




# When calling a mutation you have to 'commit' a mutation 
# Mutations also must be passed in the state, since it is synchronous
this.$store.commit('incrementBy', 25);
```javascript
  const store = new Vuex.Store({
  state: {
      lists: [],
      initialList: {title: "", items: 0, itemsArray: []},
      user: { token: null }
    },
    mutations: {
      pushList(state, elem) {
        state.lists.push(elem);
      }
      
    },
    actions: {
      
    },

  });
```


# Actions
Actions are functions that don’t change the state themselves.
Instead, they commit mutations after performing some logic 
(which is often asynchronous). Here’s a simple example of an action:

# You call an action like this:
store.dispatch('incrementAsync')
store.dispatch('incrementBy', { amount: 25})
