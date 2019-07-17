
* What is a closure ?
 A closure is a function plus a connection to the variable that exist at it's 
 birth place
 
 ```javascript
 
 
functionn createInce(startValue) {
	return (step) => {
  	 
    startValue += step;
    return startValue;
  };
}

const inc = createInce(5);
console.log( inc(1));
console.log(inc(2));
console.log(inc(3));

 ```
