INSERT INTO Stage (STGID, Name, Symbol)
VALUES (001, "SubmerseTemple", "AQUA"),
       (002, "Generic Water Sceneario", "AQUA");


INSERT INTO Type (TPID, Name)
VALUES (001, "Water"),
       (002, "Rock");

INSERT INTO Posit (POSID, x, y)
VALUES (001, 0, 0),
       (002, 1, 4),
       (003, 2, 3),
       (004, 3, 4),
       (005, 1, 0),
       (006, 2, 4),
       (007, 3, 3),
       (008, 4, 4),
       (009, 4, 4),
       (010, 4, 4),


INSERT INTO Object (OBJID, Name, MaxLife, CurrentLife, SCNID, TPID, POSID)
VALUES (001, "Diamond Rock", 100, 100,001,001,001),
       (002, "Gold Rock", 10, 10,001,001,002),
       (003, "Statue", 1000, 500,001,001,003),
       (004, "Greek Column", 1000, 1000,001,001,004),
       (005, "Boat", 100, 100,002,002,005),
       (006, "Acqua Generic Plant", 5, 5,002,001,006),
       (007, "Magic Water", 1000, 1000,002,002,007),
       (008, "Tree", 10, 10,002,002,008),
       (009, "Aqua Tree", 20, 20,002,002,009),
       (010, "Rock Fish", 1000, 1000,002,002,010);