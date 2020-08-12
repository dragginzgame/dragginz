import Hash "mo:base/Hash";
import Result "mo:base/Result";

module {

  // Template Types
  // here we want to define Name as a Text string, but it
  // also has special rules on validation and sanitisation
  public type Name = Text;

  // List of Entities
  public type Entity = {
    #character: Character;
    #concept:   Concept;
    #player:    Player;
    #prop:      Prop;
    #quality:   Quality;
    #rarity:    Rarity;
    #resource:  Resource;
    //.. and about 150 other ones I need to add
  };

  //
  // Entities
  //

  // Character
  public type Character = {
    name:   Name;
    player: Player;
  };

  // Concept
  public type Concept = {
    name: Text;
  };

  // Player
  public type Player = {
    name: Text;
  };

  // Prop
  public type Prop = {
    name:     Text;
    resource: Resource;
  };

  // Quality
  public type Quality = {
    name:     Text;
    resource: Resource;
  };

  // Rarity
  public type Rarity = {
    name:      Text;
    weighting: Float;
    resource:  Resource;
  };

  // Resource
  public type Resource = {
    secret: Text;
  };

};
