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
    name        VARCHAR(25)                         NOT NULL,
    maxLife     INTEGER                             NOT NULL CHECK (MaxLife >= 0),
    currentLife INTEGER                             NOT NULL CHECK (CurrentLife >= 0 and CurrentLife <= MaxLife),
    TPID        VARCHAR(30) REFERENCES Type (name)      NOT NULL
);

-- Table: Item
DROP TABLE IF EXISTS Item;
CREATE TABLE Item
(
    OBJID       INTEGER PRIMARY KEY,
    name        VARCHAR(25)                         NOT NULL,
    maxLife     INTEGER                             NOT NULL CHECK (MaxLife >= 0),
    currentLife INTEGER                             NOT NULL CHECK (CurrentLife >= 0 and CurrentLife <= MaxLife),
    weight      INTEGER                             NOT NULL CHECK (Weight >= 0 and Weight <= 2048),
    description VARCHAR(150),
    TPID        VARCHAR(30) REFERENCES Type (name)      NOT NULL
);

-- Table: NonPlayChar
DROP TABLE IF EXISTS NonPlayChar;
CREATE TABLE NonPlayChar
(
    OBJID             INTEGER PRIMARY KEY,
    name              VARCHAR(30)                         NOT NULL,
    maxLife           INTEGER                             NOT NULL CHECK (MaxLife >= 0),
    currentLife       INTEGER                             NOT NULL CHECK (CurrentLife >= 0 and CurrentLife <= MaxLife),
    speed             INTEGER                             NOT NULL CHECK (Speed >= 0),
    baseDamage        INTEGER                             NOT NULL CHECK (BaseDamage >= 0),
    magicalBaseDamage INTEGER                             NOT NULL CHECK (MagicalBaseDamage >= 0),
    level             INTEGER                             NOT NULL CHECK (Level >= 0 and Level <= 20),
    hitBox            INTEGER                             NOT NULL CHECK (HitBox >= 0),
    killable          INTEGER                             NOT NULL CHECK (Killable = 0 or Killable = 1),
    TPID              VARCHAR(30) REFERENCES Type (name)      NOT NULL
    CHECK (BaseDamage != 0 or MagicalBaseDamage != 0)
);

-- Table: PlayChar
DROP TABLE IF EXISTS PlayChar;
CREATE TABLE PlayChar
(
    OBJID             VARCHAR(30) PRIMARY KEY,
    name              VARCHAR(30)                         NOT NULL,
    maxLife           INTEGER                             NOT NULL CHECK (MaxLife >= 0),
    currentLife       INTEGER                             NOT NULL CHECK (CurrentLife >= 0 and CurrentLife <= MaxLife),
    speed             INTEGER                             NOT NULL CHECK (Speed >= 0),
    baseDamage        INTEGER                             NOT NULL CHECK (BaseDamage >= 0),
    magicalBaseDamage INTEGER                             NOT NULL CHECK (MagicalBaseDamage >= 0),
    level             INTEGER                             NOT NULL CHECK (Level >= 0 and Level <= 20),
    hitBox            INTEGER                             NOT NULL CHECK (HitBox >= 0),
    strength          INTEGER                             NOT NULL CHECK (Strength >= 0 and Strength <= 20),
    intelligence      INTEGER                             NOT NULL CHECK (Intelligence >= 0 and Intelligence <= 20),
    dextery           INTEGER                             NOT NULL CHECK (Dextery >= 0 and Dextery <= 20),
    maxEnergy         INTEGER                             NOT NULL CHECK (MaxEnergy >= 0),
    currentEnergy     INTEGER                             NOT NULL CHECK (CurrentEnergy >= 0 and CurrentEnergy <= MaxEnergy),
    carryWeight       INTEGER                             NOT NULL CHECK (CarryWeight >= 0),
    TPID              VARCHAR(30) REFERENCES Type (name)  NOT NULL,
    CHECK (BaseDamage != 0 or MagicalBaseDamage != 0)
);


-- Table: Position
DROP TABLE IF EXISTS Position;
CREATE TABLE Position
(
    POSID INTEGER PRIMARY KEY,
    x     INTEGER,
    y     INTEGER
);



-- Table: Effect
DROP TABLE IF EXISTS Effect;
CREATE TABLE Effect
(
    EFID     INTEGER PRIMARY KEY,
    name     VARCHAR(30)                    NOT NULL UNIQUE,
    duration INTEGER,
    damage   INTEGER,
    TPID     INTEGER REFERENCES Type (TPID) NOT NULL
);

-- Table: Sprite
DROP TABLE IF EXISTS SpritePlayChar;
CREATE TABLE SpritePlayChar
(
    SPRID INTEGER PRIMARY KEY,
    image                                     NOT NULL UNIQUE,
    OBJID INTEGER REFERENCES PlayChar (OBJID) NOT NULL,
    ACTID INTEGER REFERENCES ActionP (ACTID)  NOT NULL
);

DROP TABLE IF EXISTS SpriteNonPlayChar;
CREATE TABLE SpriteNonPlayChar
(
    SPRID INTEGER PRIMARY KEY,
    image                                        NOT NULL UNIQUE,
    OBJID INTEGER REFERENCES NonPlayChar (OBJID) NOT NULL,
    ACTID INTEGER REFERENCES ActionP (ACTID)     NOT NULL
);

DROP TABLE IF EXISTS SpriteItem;
CREATE TABLE SpriteItem
(
    SPRID INTEGER PRIMARY KEY,
    image                                    NOT NULL UNIQUE,
    OBJID INTEGER REFERENCES Item (OBJID)    NOT NULL,
    ACTID INTEGER REFERENCES ActionP (ACTID) NOT NULL
);

DROP TABLE IF EXISTS Sprite;
CREATE TABLE Sprite
(
    SPRID INTEGER PRIMARY KEY,
    Image VARCHAR(30)                        NOT NULL UNIQUE,
    OBJID INTEGER REFERENCES Object (OBJID)  NOT NULL,
    ACTID INTEGER REFERENCES ActionP (ACTID) NOT NULL
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
    SCNID  INTEGER PRIMARY KEY,
    Name   VARCHAR(30)                      NOT NULL UNIQUE,
    Width  INTEGER                          NOT NULL CHECK (Width > 0),
    Height INTEGER                          NOT NULL CHECK (Height > 0),
    Background                              NOT NULL,
    TPID   INTEGER REFERENCES Type (TPID)   NOT NULL,
    STGID  INTEGER REFERENCES Stage (STGID) NOT NULL

);

-- Table: Stage
DROP TABLE IF EXISTS Stage;
CREATE TABLE Stage
(
    STGID  INTEGER PRIMARY KEY,
    Name   VARCHAR(50) NOT NULL UNIQUE,
    Symbol VarChar     NOT NULL UNIQUE
);


-- Table: Action
DROP TABLE IF EXISTS ActionP;
CREATE TABLE ActionP
(
    ACTID            INTEGER PRIMARY KEY,
    Name             VARCHAR(30) NOT NULL,
    ExecutionTime    INTEGER     NOT NULL,
    CurrentUse       INTEGER     NOT NULL,
    MaxUse           INTEGER     NOT NULL,
    ActiveTimeWindow INTEGER     NOT NULL,
    Hitbox           INTEGER,
    CHECK ((CurrentUse <= MaxUse and CurrentUse >= 0) or (MaxUse == 0 and CurrentUse == NULL))
);

-- Table: MultipleModifier
DROP TABLE IF EXISTS MultipleModifier;
CREATE TABLE MultipleModifier
(
    MMDID    INTEGER PRIMARY KEY,
    TPID2    INTEGER REFERENCES Type (TPID) NOT NULL,
    TPID1    INTEGER REFERENCES Type (TPID) NOT NULL,
    Multiple FLOAT                          NOT NULL CHECK ( Multiple >= 0 and Multiple <= 4 )
);



COMMIT TRANSACTION;
PRAGMA foreign_keys = on;