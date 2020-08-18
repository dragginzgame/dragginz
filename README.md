# What is Dragginz?

Dragginz is a virtual fantasy world.  It's built by the users, but adheres to a strict style guide set by the Dragginz Team (currently 6 of us working on the project.)  It's a non profit venture that's owned by the community.
All revenue made from the game will go directly back into maintenance and development costs.

Our stack is currently Unity, SpatialOS/Improbable, and we're looking to replace everything else with DFinity.

Currently we are attempting to assemble a giant data model (500+ entities) with validation and filtering/sanitisation rules.  It's imperative that all the data that builds this world is carefully curated and error checked.  Previously we
used CockroachDB as our storage layer.

The best explanation I can give for the project is an unholy cross between Minecraft, Neopets, WoW and Dwarf Fortressset in a very vertical, 3D Labyrinth/Dark Crystal type world.

---

# Notes

Don't worry about code formatting right now, it may not be "idiomatic" because VSCode doesn't seem to have any nice
auto-formatting tools for Motoko.

---

# ~~ TODO ~~

## A class or module for ID?

Just like in https://github.com/matthewhammer/motoko-crud/blob/master/src/Database.mo it should probably do a lot more, like actually hashing the ID.

## Pseudorandom UUIDv4 generation

Some entities require a UUID that the users have to respond with to "claim" the entity in the database.  This will eventually be
encrypted somehow, but in the meantime how can I generate a random UUID?  Basically like uuid.NewV4() in Go.

---

# ??? Questions ???

## Fixtures

Need a good way to instantiate data that's static and unchanging, such as the different levels of Rarity.  Could potentially tables like Rarity, AreaGuide, LengthGuide be stored in a different format.

---

# WOULD BE NICE ...

## Multiple Files per Namespace

Would be easier if you could include a whole directory of files into one namespace, like Go.

