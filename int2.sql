.mode column
.headers on
.nullvalue NULL


SELECT Object.Name
FROM Object
WHERE Object.OBJID>50
EXCEPT
SELECT Object.name
FROM Object, Effect, EffectsAffectsObjects
WHERE Object.OBJID = EffectsAffectsObjects.OBJID AND Effect.EFID = EffectsAffectsObjects.EFID AND Effect.name = 'Bleed';
