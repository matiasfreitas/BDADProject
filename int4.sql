.mode column
.headers on
.nullvalue NULL




SELECT max(Object.currentLife), Object.*
FROM Object, Item
WHERE Object.OBJID = Item.ITEMID and (Item.owner is null or Object.maxLife>100)
GROUP BY Object.TPName
HAVING Object.currentLife == Object.maxLife
