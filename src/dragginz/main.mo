import TrieMap "mo:base/TrieMap";
import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Entity "./entity";
import Types "./types";
  
// Database
actor Database {

    public type ID = Word32;

    // Data store
    // Eventually will be a BigMap
    var dataStore : TrieMap.TrieMap<ID, Entity.Entity> = TrieMap.TrieMap<ID, Entity.Entity>(
        func(x, y) { x == y },
        func(id : ID) { id },    // don't think this actually hashes it
    );
    private stable var nextID : ID = 0;

    // create
    public func create(e : Entity.Entity) : async ID {
        nextID += 1; 
        dataStore.put(nextID, e);
        return nextID;
    };

    // read 
    public query func read(id : ID) : async ?Entity.Entity {
        return dataStore.get(id)
    };

    // update
    public func update(id : ID, r : Entity.Entity) : async ?Entity.Entity {
        return dataStore.replace(id, r)
    };

    // delete
    public func delete(id : ID) {
        dataStore.delete(id)
    }

} 