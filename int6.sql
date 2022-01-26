.mode column
.headers on
.nullvalue NULL

SELECT Object.name, description,
CASE
WHEN (owner is null) THEN 'Item has no owner'
ELSE O.name
END as 'owner'
FROM (Item JOIN Object O on O.OBJID = Item.owner), Object
WHERE Item.ITEMID = Object.OBJID