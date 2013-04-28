odd = (num) ->
  if typeof num is 'number'
    if num is Math.round num
      if num > 0
        num % 2 is 1
      else
        throw "#{num} is not positive"
    else
      throw "#{num} is not an integer"
  else
    throw "#{num} is not a number"

console.log odd 3
console.log odd 2
console.log odd -4
console.log odd 3.1
# console.log odd 