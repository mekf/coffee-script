console.log "Hello CoffeeScript"

square = (x) -> x * x

mathObject =
  sqrt: Math.sqrt
  square: square
  cube: (x) -> x * square x