var singCountdown;

singCountdown = function(count) {
  var singBottleCount, singDecrement;

  singBottleCount = function(specifyLocation) {
    var bottleStr, locationStr;

    locationStr = specifyLocation ? 'on the wall' : '';
    bottleStr = count === 1 ? 'bottle' : 'bottles';
    return console.log("" + count + " " + bottleStr + " of beer " + locationStr);
  };
  singDecrement = function() {
    console.log("Take one down, pass it around");
    return count--;
  };
  singBottleCount(true);
  singBottleCount(false);
  singDecrement();
  singBottleCount(true);
  if (count !== 0) {
    return singCountdown(count);
  }
};

console.log(singCountdown(5));