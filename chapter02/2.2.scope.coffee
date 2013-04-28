# SCOPE --
age1 = 99
reincarnate1 = -> age1 = 0
reincarnate1()
console.log "reincarnate1: I'm #{age1} y.o"

reincarnate2 = -> age2 = 0
age2 = 99
reincarnate2()
console.log "reincarnate2: I'm #{age2} y.o"

reincarnate3 = -> age3 = 0
reincarnate3()
console.log "reincarnate3: I'm #{age3} y.o"