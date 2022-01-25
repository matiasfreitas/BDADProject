# BDADProject
Projeto de Base de dados

CRIAR changes:

- Objects can have null scenario (means they’re not placed anywhere)
- Chars (NonPlay and Play) baseDamage and magicalBaseDamage attributes can be null but not both
- Action’s max use and current use check constraint changed. Now max uses and current uses can be null, but eiter are both null or both not null. If both are not null, max uses has to be bigger than zero and current uses has to be between 0 and max uses inclusively.
- Added field nonDamageEffect to Effect table, and checks if eithter damager or nonDamageEffect is not null (would be a text) NOT IMPLEMENTED, COMMENTED (many changes to general work, lets see to it later)

TRIGGER IDEAS:

- Whenever you update the “Carries” table (PlayChar, Item), update PlayChar’s CarryWeight
- When a new object is added, if it’s in a scenario, check if the object fits in it (x and y lower than width and height), if not, abort.
