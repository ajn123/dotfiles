
```javascript

export default {
  name: 'app',
  data: function(){
    return {counter: 0,
      good: { color: "red"},
      errror: { color: "blue"},
    list: ["A", "B", "C", "D", "E"],
    itemName: ""
    };
  },
  methods: {
    addCounter() {
      this.counter += 2;
    }
  
  },
  watch: {
    counter: function(old,newVal) {
      console.log("Counter changed", old, newVal);
    },
  },
  computed: {
    filteredNames() {
      let filter = RegExp(this.itemName,'i');
      return this.list.filter((el) => el.match(filter));
    },

    lastName() {
      return this.counter + 20;
    }
  }

}
```
