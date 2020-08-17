import Hash "mo:base/Hash";

module {

  public type ID = Word32;
  
  //
  // Extensions
  //

  // Aliases
  public type TODO     = Nat;

  public type GameYear = Int;
  public type Series   = ?Nat;
  public type Time     = Int;


  //
  // Compound Types
  //

  // Colour
  public type Colour = {
    r: Float;
    g: Float;
    b: Float;
    a: Float;  
  };

  // GameDate
  public type GameDate = {
    year: Nat;
    day:  Nat;
  };

  // GameInterval
  public type GameInterval = {
    year: Nat;
    day:  Nat;
  };

  // Quaternion
  // A data structure used by Unity measure the rotation of an object in three dimensions
  public type Quaternion = {
    w: Float;
    x: Float;
    y: Float;
    z: Float;
  };

  // Vector
  public type Vector = {
    x: Float;
    y: Float;
    z: Float;
  };

};

