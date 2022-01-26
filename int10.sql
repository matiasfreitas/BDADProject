.mode column
.headers on
.nullvalue NULL


SELECT name, baseDamage*InteractWith.multiple, magicalBaseDamage*InteractWith.multiple, level, maxLife, TPName
FROM (Object JOIN NonPlayChar Nplay on Nplay.NPLAYID == Object.OBJID),InteractWith
where InteractWith.toTPName = 'water' and Object.TPName = InteractWith.fromTPName
UNION
SELECT name, magicalBaseDamage*InteractWith.multiple, baseDamage*InteractWith.multiple, level, maxLife, TPName
FROM (Object JOIN PlayChar play on play.PLAYID == Object.OBJID), InteractWith
where InteractWith.toTPName = 'water' and Object.TPName = InteractWith.fromTPName
ORDER BY magicalBaseDamage*InteractWith.multiple desc



