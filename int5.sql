.mode column
.headers on
.nullvalue NULL


SELECT Object.name, sum(currentLife)
FROM Object, Item
WHERE OBJID = Item.owner
GROUP BY  OBJID
ORDER BY sum(currentLife) desc
