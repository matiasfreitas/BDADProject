INSERT INTO Stage (Name, Symbol)
VALUES ('Water Adventure', 'SEA'),
       ('Fire Adventure', 'VOLCAN');


INSERT INTO Scenario(name, width, height, background, STGName)
VALUES ('Submerse Temple', 100, 100, 'a beatifull temple praising water, ' ||
                                    'fishes and that kind of things who smell bad',
        'Water Adventure'),
       ('Generic Water Sceneario', 100, 300, 'a dark sea in the oceans.' ||
                                             'The thing appears soo deep. I dont like that. ',
        'Water Adventure'),
       ('Generic Fire Sceneario', 100, 300, 'Everything burn close to a volcan' ||
                                             'Everything is so hot and dead here. I dont like that. ',
        'Fire Adventure');

INSERT INTO Type (Name)
VALUES ('water'),
       ('fire'),
       ('air'),
       ('earth');

INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, x, y, TPName, SCName)
VALUES (001, 'Diamond Rock', 100, 100, 1, 1, 'earth', 'Submerse Temple'),
       (002, 'Gold Rock', 10, 10, 001, 001, 'earth', 'Submerse Temple'),
       (003, 'Statue', 1000, 500, 001, 001, 'earth', 'Submerse Temple'),
       (004, 'Greek Column', 1000, 1000, 001, 001, 'earth', 'Submerse Temple'),
       (005, 'Boat', 100, 100, 002, 002, 'water', 'Generic Water Sceneario'),
       (006, 'Acqua Generic Plant', 5, 5, 002, 001, 'water', 'Generic Water Sceneario'),
       (007, 'Magic Water', 1000, 1000, 002, 002, 'water', 'Generic Water Sceneario'),
       (008, 'Tree', 10, 10, 002, 002, 'water', 'Generic Water Sceneario'),
       (009, 'Aqua Tree', 20, 20, 002, 002, 'water', 'Generic Water Sceneario'),
       (010, 'Rock Fish', 1000, 1000, 002, 002, 'water', 'Generic Water Sceneario');



INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, x, y, TPName, SCName)
VALUES (011, 'Generic fish', 100, 100, 1, 1,'water', 'Generic Water Sceneario'),
       (012, 'Some Strange Fish Talking With Me', 10, 10, 001, 001, 'water', 'Generic Water Sceneario'),
       (013, 'Crazy Mermaid', 1000, 500, 001, 001, 'water', 'Generic Water Sceneario'),
       (014, 'Something Kooks Like Fish But Is Not a Fish', 1000, 1000, 001, 001, 'earth', 'Generic Water Sceneario'),
       (015, 'Bob, the shrimp', 1000, 1000, 001, 001, 'water','Generic Water Sceneario');

INSERT INTO NonPlayChar (NPLAYID, speed, baseDamage, magicalBaseDamage, level, hitBox, killable)
VALUES (011, 10, 10, 10, 2, 2, 1),
       (012, 20, 100, 100, 8, 2, 1),
       (013, 20, 10, 50, 5, 2, 1),
       (014, 5, 200, 200, 10, 2, 1),
       (015, 1000, 10, 10, 2, 2, 1);


INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, x, y, TPName, SCName)
VALUES (016, 'Link, the blonde guy', 100, 100, 1, 1, 'fire', 'Generic Water Sceneario'),
       (017, 'Diana, half dead princess', 10, 10, 001, 001, 'air', 'Submerse Temple'),
       (018, 'Kratos, god of beard', 1000, 500, 001, 001, 'earth', 'Generic Fire Sceneario'),
       (019, 'Sonic, the hedgehog', 1000, 500, 001, 001, 'water', 'Generic Fire Sceneario'),
       (020, 'Luke, the father', 1000, 1000, 001, 001, 'air', 'Generic Fire Sceneario');


INSERT INTO PlayChar (PLAYID, speed, baseDamage, magicalBaseDamage, level, hitBox,
                      strength, intelligence, dextery, maxEnergy, currentEnergy, carryWeight)
VALUES (016, 50, 20, 20, 5, 3,
        10, 10, 10, 30, 30, 20),
       (017, 20, 10, 70, 15, 1,
        05, 20, 20, 50, 45, 10),
       (018, 10, 100, 1, 8, 5,
        20, 5, 2, 100, 100, 100),
       (019, 100, 20, 5, 5, 2,
        5, 20, 20, 150, 150, 10),
       (020, 50, 50, 50, 12, 2,
        15, 20, 20, 20, 20, 20);


INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, x, y, TPName, SCName)
VALUES (021, 'Mastersword', 100, 100, 1, 1, 'fire', 'Generic Water Sceneario'),
       (022, 'A crown', 1000, 1000, 001, 001, 'air', 'Submerse Temple'),
       (023, 'Make up', 10, 10, 001, 001, 'earth', 'Generic Fire Sceneario'),
       (024, 'A ring', 10, 5, 001, 001, 'earth', 'Generic Fire Sceneario'),
       (025, 'The force', 10000, 10000, 001, 001, 'air','Generic Fire Sceneario');

INSERT INTO Item(ITEMID, weight, description, owner)
VALUES (021, 50, 'a magic sword for blonde guys', 016),
       (022, 10, 'a crown with a prophecy. Who desires that, dies.', NULL),
       (023, 5, 'Make u beatifull and brave for kill your enemies', 018),
       (024, 10, 'Money for fast guys', NULL),
       (025, 0, 'The living energy in the universe', 020);


-- Action, Effect, ObjectDo, InteractWith, EffectsAffectsObjects)