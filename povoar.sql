INSERT INTO Stage (Name, Symbol)
VALUES ('Water Adventure', 'SEA'),
       ('Fire Adventure', 'VOLCAN'),
       ('Sunpeak Island', 'Island with mountain on center'),
       ('Everdust Desert', 'Sand Dune');


INSERT INTO Scenario(name, width, height, background, STGName)
VALUES ('Submerse Temple', 100, 100, 'a beatifull temple praising water, ' ||
                                    'fishes and that kind of things who smell bad',
        'Water Adventure'),
       ('Generic Water Sceneario', 100, 300, 'a dark sea in the oceans.' ||
                                             'The thing appears soo deep. I dont like that. ',
        'Water Adventure'),
       ('Generic Fire Sceneario', 100, 300, 'Everything burn close to a volcan' ||
                                             'Everything is so hot and dead here. I dont like that. ',
        'Fire Adventure'),
       ('Blazing Heat Temple', 300, 200, 'A beautiful greek-style temple with forges and fire-like sculptures around', 'Sunpeak Island'),
       ('Fishermen Docks', 500, 100, 'Peacefull old but well taken-care of docks. Smells bad though', 'Sunpeak Island'),
       ('Shadows Forest', 600, 200, 'Dark forests, creepy and full of shadows. Are they moving?', 'Sunpeak Island'),
       ('Time Fissure', 1000, 1000, 'This surrealist painting styled place is total chaos. It extends itself pretty far also.', 'Sunpeak Island'),
       ('Rangers Oasis', 300, 200, 'A outpost that rests in a calm, beautiful oasis. A lake in the middle tops it up perfecly', 'Everdust Desert'),
       ('Endless Sands', 100, 1200, 'Never ending sand dunes burning under the scorching sun. Not a single drop of water in kilometers', 'Everdust Desert'),
       ('Underground Piramids', 500, 1000, 'Sand covered piramids several hundred meters underground. ' ||
                                           'Can not see the top even with light magic...', 'Everdust Desert'),
       ('Aliotr Battle Scenario', 100, 50, 'A mythical temple made of hardened sand emerging from the endless' ||
                                           'sand dunes. Aliotr rises from the top, waiting for its challenger', 'Everdust Desert');

INSERT INTO Type (Name)
VALUES ('water'),
       ('fire'),
       ('air'),
       ('earth'),
       ('neutral'),
       ('light'),
       ('darkness'),
       ('chrono-type'),
       ('wood');

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
       (010, 'Rock Fish', 1000, 1000, 002, 002, 'water', 'Generic Water Sceneario'),
       (011, 'Generic Apple Tree', 100, 100, null, null, 'wood', null),
       (012, 'Hot Forge', 2000, 2000, 150, 50, 'earth', 'Blazing Heat Temple'),
       (013, 'Sucking sandpit', 1, 1, 150, 100, 'earth', 'Shadows Forest'),
       (014, 'Molten Wall-clock', 150, 150, 100, 100, 'neutral', 'Time Fissure'),
       (015, 'Silver Mirrors', 1, 1, 250, 100, 'neutral', 'Underground Piramids');



INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, x, y, TPName, SCName)
VALUES (016, 'Generic fish', 100, 100, 1, 1,'water', 'Generic Water Sceneario'),
       (017, 'Some Strange Fish Talking With Me', 10, 10, 001, 001, 'water', 'Generic Water Sceneario'),
       (018, 'Crazy Mermaid', 1000, 500, 001, 001, 'water', 'Generic Water Sceneario'),
       (019, 'Bob, the shrimp', 1000, 1000, 001, 001, 'water','Generic Water Sceneario'),
       (020, 'Something Kooks Like Fish But Is Not a Fish', 1000, 1000, 001, 001, 'earth', 'Generic Water Sceneario'),
       (021, 'Fire Spirit', 320, 320, 50, 50, 'fire', 'Blazing Heat Temple'),
       (022, 'Peixe Grandao', 20, 20, 20, 5, 'water', 'Fishermen Docks'),
       (023, 'Ol Man Jededaia', 50, 45, 45, 10, 'neutral', 'Fishermen Docks'),
       (024, 'Evil Shadow', 90, 90, 290, 45, 'darkness', 'Shadows Forest'),
       (025, 'Time Aberration', 300, 300, 200, 300, 'chrono-type', 'Time Fissure'),
       (026, 'Ancient Mummy', 200, 200, 100, 100, 'darkness', 'Underground Piramids'),
       (027, 'Ranger Marakov', 250, 250, 100, 10, 'neutral', 'Rangers Oasis'),
       (028, 'Captain Ahmad', 1400, 1400, 115, 10, 'neutral', 'Rangers Oasis'),
       (029, 'Sand Snake', 100, 100, 10, 400, 'earth', 'Endless Sands'),
       (030, 'Desert Harpy', 250, 250, 70, 450, 'air', 'Endless Sands'),
       (031, 'Aliotr, The Molten God', 800, 800, 50, 40, 'fire', 'Aliotr Battle Scenario');

INSERT INTO NonPlayChar (NPLAYID, speed, baseDamage, magicalBaseDamage, level, hitBox, killable)
VALUES (016, 10, 10, 10, 2, 2, 1),
       (017, 20, 100, 100, 8, 2, 1),
       (018, 20, 10, 50, 5, 2, 1),
       (019, 5, 200, 200, 10, 2, 1),
       (020, 1000, 10, 10, 2, 2, 1),
       (021, 20, null, 45, 5, 1, 1),
       (022, 5, 1, null, 1, 3, 1),
       (023, 5, 2, null, 2, 2, 0),
       (024, 25, 10, 35, 4, 1, 1),
       (025, 15, 50, 45, 6, 3, 1),
       (026, 7, 30, 5, 3, 2, 1),
       (027, 18, 30, null, 3, 2, 0),
       (028, 25, 200, 190, 20, 2, 0),
       (029, 30, 60, 10, 4, 1, 1),
       (030, 40, 70, null, 5, 1, 1),
       (031, 45, 190, 100, 12, 3, 1);


INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, x, y, TPName, SCName)
VALUES (032, 'Link, the blonde guy', 100, 98, 1, 1, 'fire', 'Generic Water Sceneario'),
       (033, 'Diana, half dead princess', 10, 10, 001, 001, 'air', 'Submerse Temple'),
       (034, 'Kratos, god of beard', 1000, 500, 001, 001, 'earth', 'Generic Fire Sceneario'),
       (035, 'Sonic, the hedgehog', 1000, 500, 001, 001, 'water', 'Generic Fire Sceneario'),
       (036, 'Luke, the father', 1000, 850, 001, 001, 'air', 'Generic Fire Sceneario'),
       (037, 'Guts, the Relentless', 1000, 900, 001, 001, 'neutral', null),
       (038, 'Griffith, the Absolute', 10000, 10000, 001, 001, 'darkness', null);


INSERT INTO PlayChar (PLAYID, speed, baseDamage, magicalBaseDamage, level, hitBox,
                      strength, intelligence, dextery, maxEnergy, currentEnergy, carryWeight)
VALUES (032, 50, 20, 20, 5, 3,
        10, 10, 10, 30, 30, 20),
       (033, 20, 10, 70, 15, 1,
        05, 20, 20, 50, 45, 10),
       (034, 10, 100, 1, 8, 5,
        20, 5, 2, 100, 100, 100),
       (035, 100, 20, 5, 5, 2,
        5, 20, 20, 150, 150, 10),
       (036, 50, 50, 50, 12, 2,
        15, 20, 20, 20, 20, 20),
       (037, 50, 200, null, 12, 2, 20, 13, 13, 40, 40, 200),
       (038, 50, 300, 550, 19, 2, 20, 20, 20, 50, 50, 200);


INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, x, y, TPName, SCName)
VALUES (039, 'Mastersword', 100, 100, 1, 1, 'fire', 'Generic Water Sceneario'),
       (040, 'A crown', 1000, 1000, 001, 001, 'air', 'Submerse Temple'),
       (041, 'Make up', 10, 10, 001, 001, 'earth', 'Generic Fire Sceneario'),
       (042, 'A ring', 10, 5, 001, 001, 'earth', 'Generic Fire Sceneario'),
       (043, 'The force', 10000, 10000, 001, 001, 'air','Generic Fire Sceneario'),
       (044, 'Enma God Sword', 999, 999, 280, 100, 'fire', 'Blazing Heat Temple'),
       (045, 'Fishing rod', 30, 30, 50, 10, 'wood', 'Fishermen Docks'),
       (046, 'Illusion Cloak', 999, 999, 300, 45, 'darkness', 'Shadows Forest'),
       (047, 'Chronos Pearl', 1, 1, 500, 500, 'chrono-type', 'Time Fissure'),
       (048, 'Hidden Tomb Key', 1, 1, 498, 998, 'neutral', 'Underground Piramids'),
       (049, 'Flashing Bow of Thunder', 999, 999, 120, 10, 'light', 'Rangers Oasis'),
       (050, 'Water Canteen', 10, 10, 10, 670, 'neutral', 'Endless Sands'),
       (051, 'The Sun Spear', 999, 999, null, null, 'light', null),
       (052, 'The Iron Slab', 999, 999, null, null, 'neutral', null),
       (053, 'Repeating Crossbow', 100, 100, null, null, 'wood', null),
       (054, 'Hawk Helm', 999, 999, null, null, 'darkness', null);

INSERT INTO Item(ITEMID, weight, description, owner)
VALUES (039, 50, 'a magic sword for blonde guys', 016),
       (040, 10, 'a crown with a prophecy. Who desires that, dies.', NULL),
       (041, 5, 'Make u beatifull and brave for kill your enemies', 018),
       (042, 10, 'Money for fast guys', NULL),
       (043, 0, 'The living energy in the universe', 020),
       (044, 30, 'A very well decorated crimson blade. Careful, it burns.', null),
       (045, 5, 'Pretty old but still working', null),
       (046, 2, 'A mystical cloak that maked the one wearing it invisible at will', null),
       (047, 1, 'Lot is said about it but it seems like a simple pearl. Maybe I will find out more later', null),
       (048, 1, 'Must be that large doors key!', null),
       (049, 10, 'This mystical bow is capable of firing light beams from itself! No arrows needed.', null),
       (050, 30, 'Aliotrs Spear. Big and flashy, just like him...', null),
       (051, 4, 'A simple water canteen. Might save someone in need.', null),
       (052, 80, 'Way too big to be a sword... Is it?', 049),
       (053, 10, 'Very well crafted repeating crossbow. A masterwork.', 049),
       (054, 20, 'A helm with a hawk-beak shaped visor. Emanates a strong, evil energy from it.', 050);


-- Action, Effect, ObjectDo, InteractWith, EffectsAffectsObjects)
