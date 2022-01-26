.mode column
.headers on
.nullvalue NULL


DROP VIEW IF EXISTS SunSpearOwner;
CREATE VIEW SunSpearOwner AS
    SELECT Drops.OBJID
    FROM Object, Drops
    WHERE Object.OBJID = Drops.ITEMID and Object.name = 'The Sun Spear';

SELECT name, maxLife
FROM SunSpearOwner, Object
WHERE SunSpearOwner.OBJID = Object.OBJID and maxLife<1000
ORDER BY maxLife


