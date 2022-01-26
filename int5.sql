.mode column
.headers on
.nullvalue NULL


SELECT sum(currentLife), Object.name
FROM Object, Item
WHERE OBJID = Item.owner
GROUP BY  OBJID
