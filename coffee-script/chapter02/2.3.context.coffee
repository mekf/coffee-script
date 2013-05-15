setName = (name) -> @name = name

# ---
# var setName = function(name) {
#   return this.name = name;
# };
# +++

cat = {}

cat.setName = setName
cat.setName "Salem"

console.log cat.name