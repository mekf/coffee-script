# Anonymous function
-> 'Hello, functions!'

# 2 types of calling
console.log do -> 'Hello, functions!'
console.log ( -> 'Hello, functions! in parantheses')()

# function with a name "hi"
hi = -> 'Hello, functions! with hi'
console.log hi()

# function with name "greetings", take "name" as arg
greetings = (name) -> "Hello, #{name}!"

console.log greetings('Minh') 
console.log greetings 'Katze'

cube = (x) -> Math.pow(x, 3)
console.log cube 3

# String concatenation
shipNameString = 'Babylon'

shipNameFull1 = shipNameString + " " + 5
shipNameFull2 = "#{shipNameString} 5"
# shipNameFull3 = shipNameString +5   # will not work (TypeError)

console.log shipNameFull1
console.log shipNameFull2

# Implicit parantheses
console.log Math.round 3.1, Math.round 5.2      # will fail, as explain below
console.log (Math.round(3.1, Math.round(5.2)))
console.log Math.round(3.1), Math.round(5.2)      # proper use of parantheses