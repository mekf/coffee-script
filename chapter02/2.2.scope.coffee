# SCOPE -- pg.18

# 1. Every function creates a scope, and the only way to create a scope is to define a function.
# 2. A variable lives in the outermost scope in which an assignment has been made to that variable.
# 3. Outside of its scope, a variable is invisible.

# AGE1 --
# age1 is global, val of 99
# in reincarnated1, age1 is not redefined, age1 is assigned val of 0
age1 = 99
reincarnate1 = -> age1 = 0
reincarnate1()
console.log "reincarnate1: I'm #{age1} y.o"
# AGE1 ++

# AGE2 --
# age2 within reincarnated2 is defined independently from age2 global
# age2 global is defined and assigned val of 99
reincarnate2 = -> age2 = 0
age2 = 99
reincarnate2()
console.log "reincarnate2: I'm #{age2} y.o"

# This is known as Shadowing, the practise of defining the same var in another scope
# NOT RECOMENDED
# AGE2 ++

# Other Shadowing Example --
# shadowing in function argument
x = 5
triple = (x) -> x *= 3
triple x        # 15
x               # 5
# Other Shadowing Example ++

# will NOT work
# ReferenceError age3 is not defined
# reincarnate3 = -> age3 = 0
# reincarnate3()
# console.log "reincarnate3: I'm #{age3} y.o"