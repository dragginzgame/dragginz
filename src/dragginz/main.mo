import TrieMap "mo:base/TrieMap";
import Hash "mo:base/Hash";
import Debug "mo:base/Debug";
import Entity "Entity";
import Types "Types";
  
// Database
actor Database {

    public type ID = Word32;

    // Data store
    // Eventually will be a BigMap
    var dataStore : TrieMap.TrieMap<ID, Entity.Entity> = TrieMap.TrieMap<ID, Entity.Entity>(
        func(x, y) { x == y },
        func(id : ID) { id },    
    );
    private stable var nextID : ID = 0;

    public func test() : () {
    };

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