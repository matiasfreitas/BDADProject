.mode column
.headers on
.nullvalue NULL


SELECT Object.*
FROM Object, Item, Scenario
WHERE Object.SCName = Scenario.name and Object.OBJID == Item.ITEMID and Item.owner is null and Scenario.STGName = 'Water Adventure'
EXCEPT
SELECT Object.*
FROM Object, Item
WHERE Object.OBJID == Item.ITEMID and Object.TPName = 'water';

