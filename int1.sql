.mode column
.headers on
.nullvalue NULL



SELECT Object.name, min(Object.maxLife)
FROM (Drops JOIN Object O on O.OBJID = Drops.ITEMID), Object
WHERE O.name = 'The Sun Spear' and Drops.OBJID = Object.OBJID
ORDER BY Object.maxLife

