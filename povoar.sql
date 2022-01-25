INSERT INTO Stage (Name, Symbol)
VALUES ('SubmerseTemple', 'ROCK'),
       ('Generic Water Sceneario', 'SEA');

INSERT INTO Type (Name)
VALUES ('water'),
       ('rock'),
       ('air'),
       ('earth');

INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, x, y, TPName)
VALUES (001, 'Diamond Rock', 100, 100,1,1,'earth'),
       (002, 'Gold Rock', 10, 10,001,001,'earth'),
       (003, 'Statue', 1000, 500,001,001,'earth'),
       (004, 'Greek Column', 1000, 1000,001,001,'earth'),
       (005, 'Boat', 100, 100,002,002,'water'),
       (006, 'Acqua Generic Plant', 5, 5,002,001,'water'),
       (007, 'Magic Water', 1000, 1000,002,002,'water'),
       (008, 'Tree', 10, 10,002,002,'water'),
       (009, 'Aqua Tree', 20, 20,002,002,'water'),
       (010, 'Rock Fish', 1000, 1000,002,002,'water');



INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, x, y, TPName)
VALUES (011, 'Generic fish', 100, 100,1,1,'water'),
       (012, 'Some Strange Fish Talking With Me', 10, 10,001,001,'water'),
       (013, 'Crazy Mermaid', 1000, 500,001,001,'water'),
       (014, 'Something Kooks Like Fish But Is Not a Fish', 1000, 1000,001,001,'earth');

INSERT INTO NonPlayChar (NPLAYID, speed, baseDamage, magicalBaseDamage, level, hitBox, killable)
VALUES (011, 10, 10, 10, 2, 2,1),
       (012, 20, 100, 100, 8, 2,1),
       (013, 20, 10, 50, 5, 2,1),
       (014, 5, 200, 200, 10, 2,1);
