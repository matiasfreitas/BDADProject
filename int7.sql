.mode column
.headers on
.nullvalue NULL


SELECT Object.name, description,
CASE
WHEN (owner is null) THEN 'Item has no owner'
ELSE O.name
END as 'owner'
FROM (Item LEFT OUTER JOIN Object O on O.OBJID = Item.owner), Object
WHERE Item.ITEMID = Object.OBJID

-- Show me all items names, descriptions and whether they have an owner or not, and if they do, show it's name
