.mode column
.headers on
.nullvalue NULL


SELECT Action.name as Action, E.damage
FROM Action Join Effect E on Action.EFID = E.EFID
WHERE E.damage >= 50
ORDER BY E.damage DESC

-- Which actions cause more than 49 damage with their effects, ordered by the most damaging to the least.