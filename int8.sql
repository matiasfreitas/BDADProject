.mode column
.headers on
.nullvalue NULL


SELECT weight, O2.name as Item, O.name as Owner
FROM (Item JOIN Object O on O.OBJID = Item.owner)
    JOIN Object O2 on O2.OBJID = Item.ITEMID
WHERE O.name = 'Guts, the Relentless'
ORDER BY weight ASC

-- Show me all items the character named Guts, the Relentless is carrying ordered from the lightest to heaviest.