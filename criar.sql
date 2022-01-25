PRAGMA
    foreign_keys = on;
.mode column
.headers on
.nullvalue NULL
BEGIN TRANSACTION;



-- Table: Object
DROP TABLE IF EXISTS Object;
CREATE TABLE Object
(
    OBJID       INTEGER PRIMARY KEY,
    name        VARCHAR(25) NOT NULL,
    maxLife     INTEGER     NOT NULL CHECK (maxLife >= 0),
    currentLife INTEGER     NOT NULL CHECK (currentLife >= 0 and currentLife <= maxLife),
    x           INTEGER     CHECK (x is null or x >= 0),
    y           INTEGER     CHECK (y is null or y >= 0),
    TPName      VARCHAR(30) REFERENCES Type (name) ON DELETE SET NULL NOT NULL,
    SCName      VARCHAR(30) REFERENCES Scenario (name) ON DELETE SET NULL
);

-- Table: Item
DROP TABLE IF EXISTS Item;
CREATE TABLE Item
(
    ITEMID      INT REFERENCES Object (OBJID) ON DELETE CASCADE NOT NULL PRIMARY KEY,
    weight      INTEGER                                         NOT NULL CHECK (weight >= 0 and weight <= 2048),
    description VARCHAR(150),
    owner       int REFERENCES Object (OBJID)
);

-- Table: NonPlayChar
DROP TABLE IF EXISTS NonPlayChar;
CREATE TABLE NonPlayChar
(
    NPLAYID           INT REFERENCES Object (OBJID) ON DELETE CASCADE NOT NULL PRIMARY KEY,
    speed             INTEGER                                         NOT NULL CHECK (speed >= 0),
    baseDamage        INTEGER                                         CHECK (baseDamage > 0),
    magicalBaseDamage INTEGER                                         CHECK (magicalBaseDamage > 0),
    level             INTEGER                                         NOT NULL CHECK (level >= 0 and level <= 20),
    hitBox            INTEGER                                         NOT NULL CHECK (hitBox >= 0),
    killable          INTEGER                                         NOT NULL CHECK (killable = 0 or killable = 1),
    CONSTRAINT baseDamageCheck CHECK (baseDamage is not null or magicalBaseDamage is not null)
);

-- Table: PlayChar
DROP TABLE IF EXISTS PlayChar;
CREATE TABLE PlayChar
(
    PLAYID            INT REFERENCES Object (OBJID) ON DELETE CASCADE NOT NULL PRIMARY KEY,
    speed             INTEGER                                         NOT NULL CHECK (speed >= 0),
    baseDamage        INTEGER                                         CHECK (baseDamage >= 0),
    magicalBaseDamage INTEGER                                         CHECK (magicalBaseDamage >= 0),
    level             INTEGER                                         NOT NULL CHECK (level >= 0 and level <= 20),
    hitBox            INTEGER                                         NOT NULL CHECK (hitBox >= 0),
    strength          INTEGER                                         NOT NULL CHECK (strength >= 0 and strength <= 20),
    intelligence      INTEGER                                         NOT NULL CHECK (intelligence >= 0 and intelligence <= 20),
    dextery           INTEGER                                         NOT NULL CHECK (dextery >= 0 and dextery <= 20),
    maxEnergy         INTEGER                                         NOT NULL CHECK (maxEnergy >= 0),
    currentEnergy     INTEGER                                         NOT NULL CHECK (currentEnergy >= 0 and currentEnergy <= maxEnergy),
    carryWeight       INTEGER                                         NOT NULL CHECK (carryWeight >= 0),
    CONSTRAINT baseDamageCheck CHECK (baseDamage is not null or magicalBaseDamage is not null)
);

-- Table: Action
DROP TABLE IF EXISTS Action;
CREATE TABLE Action
(
    ACTID            INTEGER PRIMARY KEY,
    name             VARCHAR(30)                                            NOT NULL,
    executionTime    INTEGER                                                NOT NULL,
    currentUse       INTEGER,
    maxUse           INTEGER,
    activeTimeWindow INTEGER,
    hitbox           INTEGER,
    TPName           VARCHAR(30) REFERENCES Type (name) ON DELETE SET NULL NOT NULL,
    EFID             VARCHAR(30) REFERENCES Effect (EFID) ON DELETE CASCADE NOT NULL,
    CONSTRAINT validateUse CHECK (maxUse is null and currentUse is null or (
        (maxUse is not null and currentUse is not null) and (maxUse > 0 and (currentUse >= 0 and currentUse <= maxUse))))
);

-- Table: Effect
DROP TABLE IF EXISTS Effect;
CREATE TABLE Effect
(
    EFID     INTEGER PRIMARY KEY,
    name     VARCHAR(30) NOT NULL UNIQUE,
    duration INTEGER,
    damage   INTEGER
    -- nonDamageEffect VARCHAR(150),
    -- CONSTRAINT validateEffect CHECK (damage is not null or nonDamageEffect is not null)
);


-- Table: Type
DROP TABLE IF EXISTS Type;
CREATE TABLE Type
(
    name VARCHAR(30) NOT NULL UNIQUE PRIMARY KEY
);

-- Table: Scenario
DROP TABLE IF EXISTS Scenario;
CREATE TABLE Scenario
(
    name    VARCHAR(30) PRIMARY KEY                           NOT NULL UNIQUE,
    width   INTEGER                                           NOT NULL CHECK (width > 0),
    height  INTEGER                                           NOT NULL CHECK (height > 0),
    background VARCHAR(150)                                   NOT NULL,
    STGName INTEGER REFERENCES Stage (name) ON DELETE CASCADE NOT NULL

);

-- Table: Stage
DROP TABLE IF EXISTS Stage;
CREATE TABLE Stage
(
    name   VARCHAR(50) PRIMARY KEY NOT NULL UNIQUE,
    symbol VARCHAR(50)                 NOT NULL UNIQUE
);


-- Table: ObjectDo
DROP TABLE IF EXISTS ObjectDo;
CREATE TABLE ObjectDo
(
    image VARCHAR(30)                                                           NOT NULL UNIQUE,
    OBJID INTEGER REFERENCES Object (OBJID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    ACTID INTEGER REFERENCES Action (ACTID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    PRIMARY KEY (OBJID, ACTID)
);


-- Table: InteractWith
DROP TABLE IF EXISTS InteractWith;
CREATE TABLE InteractWith
(
    fromTPName INTEGER REFERENCES Type (name) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    toTPName   INTEGER REFERENCES Type (name) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    multiple   FLOAT                                                              NOT NULL CHECK ( multiple >= 0 and multiple <= 4 ),
    PRIMARY KEY (fromTPName, toTPName)
);


-- Table: EffectsAffectsObjects
DROP TABLE IF EXISTS EffectsAffectsObjects;
CREATE TABLE EffectsAffectsObjects
(
    EFID  INTEGER REFERENCES Effect (EFID) ON DELETE CASCADE ON UPDATE CASCADE  NOT NULL,
    OBJID INTEGER REFERENCES Object (OBJID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    PRIMARY KEY (EFID, OBJID)
);

-- Table: Drops
DROP TABLE IF EXISTS Drops;
CREATE TABLE Drops
(
    ITEMID INTEGER REFERENCES Item (ITEMID)         NOT NULL,
    OBJID  INTEGER REFERENCES NonPlayChar (NPLAYID) NOT NULL,
    PRIMARY KEY (ITEMID, OBJID)
);



COMMIT TRANSACTION;
PRAGMA foreign_keys = on;