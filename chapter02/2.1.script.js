var cube, greetings, hi, odd, shipNameFull1, shipNameFull2, shipNameString;

(function() {
  return 'Hello, functions!';
});

console.log((function() {
  return 'Hello, functions!';
})());

console.log((function() {
  return 'Hello, functions! in parantheses';
})());

hi = function() {
  return 'Hello, functions! with hi';
};

console.log(hi());

greetings = function(name) {
  return "Hello, " + name + "!";
};

console.log(greetings('Minh'));

console.log(greetings('Katze'));

shipNameString = 'Babylon';

shipNameFull1 = shipNameString + " " + 5;

shipNameFull2 = "" + shipNameString + " 5";

console.log(shipNameFull1);

console.log(shipNameFull2);

console.log(Math.round(3.1, Math.round(5.2)));

console.log(Math.round(3.1, Math.round(5.2)));

console.log(Math.round(3.1), Math.round(5.2));

cube = function(x) {
  return Math.pow(x, 3);
};

console.log(cube(3));

odd = function(x) {
  return x % 2 === 1;
};

console.log(odd(3));
