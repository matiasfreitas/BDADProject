.mode column
.headers on
.nullvalue NULL


DROP VIEW IF EXISTS SunSpearOwner;
CREATE VIEW SunSpearOwner(owner) AS
    SELECT owner
    FROM Object, Item
    WHERE Object.name == 'The Sun Spear';

SELECT Name, min(Object.currentLife)
FROM Object, SunSpearOwner
WHERE SunSpearOwner.owner == Object.OBJID;


