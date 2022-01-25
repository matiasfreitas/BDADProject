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
    maxLife     INTEGER     NOT NULL CHECK (MaxLife >= 0),
    currentLife INTEGER     NOT NULL CHECK (CurrentLife >= 0 and CurrentLife <= MaxLife),
    x           INTEGER     NOT NULL CHECK (x >= 0),
    y           INTEGER     NOT NULL CHECK (y >= 0),
    TPName      VARCHAR(30) REFERENCES Type (name) ON DELETE SET NULL NOT NULL
);

-- Table: Item
DROP TABLE IF EXISTS Item;
CREATE TABLE Item
(
    ITEMID      INTEGER PRIMARY KEY,
    weight      INTEGER                                                 NOT NULL CHECK (Weight >= 0 and Weight <= 2048),
    description VARCHAR(150),
    owner       VARCHAR(30) REFERENCES Object (OBJID),
    OBJID       VARCHAR(30) REFERENCES Object (OBJID) ON DELETE CASCADE NOT NULL
);

-- Table: NonPlayChar
DROP TABLE IF EXISTS NonPlayChar;
CREATE TABLE NonPlayChar
(
    NPLAYID           INTEGER PRIMARY KEY,
    speed             INTEGER                                                 NOT NULL CHECK (Speed >= 0),
    baseDamage        INTEGER                                                 NOT NULL CHECK (BaseDamage >= 0),
    magicalBaseDamage INTEGER                                                 NOT NULL CHECK (MagicalBaseDamage >= 0),
    level             INTEGER                                                 NOT NULL CHECK (Level >= 0 and Level <= 20),
    hitBox            INTEGER                                                 NOT NULL CHECK (HitBox >= 0),
    killable          INTEGER                                                 NOT NULL CHECK (Killable = 0 or Killable = 1),
    OBJID             VARCHAR(30) REFERENCES Object (OBJID) ON DELETE CASCADE NOT NULL,
    CONSTRAINT damageCheck CHECK (baseDamage != 0 or magicalBaseDamage != 0)
);

-- Table: PlayChar
DROP TABLE IF EXISTS PlayChar;
CREATE TABLE PlayChar
(
    PLAYID            VARCHAR(30) PRIMARY KEY,
    speed             INTEGER                                                 NOT NULL CHECK (Speed >= 0),
    baseDamage        INTEGER                                                 NOT NULL CHECK (BaseDamage >= 0),
    magicalBaseDamage INTEGER                                                 NOT NULL CHECK (MagicalBaseDamage >= 0),
    level             INTEGER                                                 NOT NULL CHECK (Level >= 0 and Level <= 20),
    hitBox            INTEGER                                                 NOT NULL CHECK (HitBox >= 0),
    strength          INTEGER                                                 NOT NULL CHECK (Strength >= 0 and Strength <= 20),
    intelligence      INTEGER                                                 NOT NULL CHECK (Intelligence >= 0 and Intelligence <= 20),
    dextery           INTEGER                                                 NOT NULL CHECK (Dextery >= 0 and Dextery <= 20),
    maxEnergy         INTEGER                                                 NOT NULL CHECK (MaxEnergy >= 0),
    currentEnergy     INTEGER                                                 NOT NULL CHECK (CurrentEnergy >= 0 and CurrentEnergy <= MaxEnergy),
    carryWeight       INTEGER                                                 NOT NULL CHECK (CarryWeight >= 0),
    OBJID             VARCHAR(30) REFERENCES Object (OBJID) ON DELETE CASCADE NOT NULL,
    CONSTRAINT damageCheck CHECK (baseDamage != 0 or magicalBaseDamage != 0)
);

-- Table: Action
DROP TABLE IF EXISTS Action;
CREATE TABLE Action
(
    ACTID            INTEGER PRIMARY KEY,
    name             VARCHAR(30)                                            NOT NULL,
    executionTime    INTEGER                                                NOT NULL,
    currentUse       INTEGER                                                NOT NULL,
    maxUse           INTEGER                                                NOT NULL,
    activeTimeWindow INTEGER                                                NOT NULL,
    hitbox           INTEGER,
    TPName           VARCHAR(30)                                            REFERENCES Type (name) ON DELETE SET NULL NOT NULL,
    EFID             VARCHAR(30) REFERENCES Effect (EFID) ON DELETE CASCADE NOT NULL,
    CONSTRAINT validadteUse CHECK ((currentUse <= maxUse and currentUse >= 0) or (maxUse == 0 and currentUse == NULL))
);

-- Table: Effect
DROP TABLE IF EXISTS Effect;
CREATE TABLE Effect
(
    EFID     INTEGER PRIMARY KEY,
    name     VARCHAR(30) NOT NULL UNIQUE,
    duration INTEGER,
    damage   INTEGER
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
    background                                                NOT NULL,
    STGName INTEGER REFERENCES Stage (name) ON DELETE CASCADE NOT NULL

);

-- Table: Stage
DROP TABLE IF EXISTS Stage;
CREATE TABLE Stage
(
    name   VARCHAR(50) PRIMARY KEY NOT NULL UNIQUE,
    symbol VarChar                 NOT NULL UNIQUE
);


-- Table: ObjectDo
DROP TABLE IF EXISTS ObjectDo;
CREATE TABLE ObjectDo
(
    image VARCHAR(30)                                          NOT NULL UNIQUE,
    OBJID INTEGER REFERENCES Object (OBJID) ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
    ACTID INTEGER REFERENCES ActionP (ACTID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    PRIMARY KEY (OBJID, ACTID)
);


-- Table: InteractWith
DROP TABLE IF EXISTS InteractWith;
CREATE TABLE InteractWith
(
    fromTPName INTEGER REFERENCES Type (name) ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
    toTPName   INTEGER REFERENCES Type (name) ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
    Multiple   FLOAT                          NOT NULL CHECK ( Multiple >= 0 and Multiple <= 4 ),
    PRIMARY KEY (fromTPName, toTPName)
);


-- Table: EffectsAffectsObjects
DROP TABLE IF EXISTS EffectsAffectsObjects;
CREATE TABLE EffectsAffectsObjects
(
    EFID  INTEGER REFERENCES Effect (EFID) ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
    OBJID INTEGER REFERENCES Object (OBJID) ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
    PRIMARY KEY (EFID, OBJID)
);


DROP TABLE IF EXISTS Drops;
CREATE TABLE Drops
(
    ITEMID  INTEGER REFERENCES Item (ITEMID)         NOT NULL,
    OBJID INTEGER REFERENCES NonPlayChar (NPLAYID) NOT NULL,
    PRIMARY KEY (ITEMID, OBJID)
);



COMMIT TRANSACTION;
PRAGMA foreign_keys = on;