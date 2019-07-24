




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
    // These are the same functions with the save syntax
      increment (context) {
        context.commit('increment')
      },
      increment ({ commit }) {
        commit('increment')
      }
      
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
Action handlers receive a context object which exposes the same set 
of methods/properties on the store instance, so you can call context.  
commit to commit a mutation, or access the state and getters via 
context.state and context.getters. We can even call other actions with context.dispatch
