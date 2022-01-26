.mode column
.headers on
.nullvalue NULL


SELECT name, TPName,
CASE
WHEN (maxLife - currentLife = 0) THEN 'No'
ELSE 'Yes'
END as 'Damaged'
From Object
INNER JOIN PlayChar PC on Object.OBJID = PC.PLAYID
UNION
SELECT name, TPName,
CASE
WHEN (maxLife - currentLife = 0) THEN 'No'
ELSE 'Yes'
END as 'Damaged'
From Object
INNER JOIN NonPlayChar NPC on Object.OBJID = NPC.NPLAYID

-- Show me all characters and whether they are damaged or not