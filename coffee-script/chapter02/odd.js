// Generated by CoffeeScript 1.6.2
var odd;

odd = function(num) {
  if (typeof num === 'number') {
    if (num === Math.round(num)) {
      if (num > 0) {
        return num % 2 === 1;
      } else {
        throw "" + num + " is not positive";
      }
    } else {
      throw "" + num + " is not an integer";
    }
  } else {
    throw "" + num + " is not a number";
  }
};

console.log(odd(3));

console.log(odd(2));

console.log(odd(-4));

console.log(odd(3.1));
