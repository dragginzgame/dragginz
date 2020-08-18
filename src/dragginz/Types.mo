import Hash "mo:base/Hash";

module {

  public type ID = Word32;
  
  //
  // Extensions
  //

  // Aliases
  public type TODO        = Nat;

  // Not yet supported in motoko
  public type Interval    = Nat;
  public type Time        = Int;
  public type UUID        = Text;

  // Game Concepts
  public type ChunkCoord  = Int;
  public type GameYear    = Int;
  public type Level       = Nat;
  public type Rank        = Nat;
  public type Series      = Nat;
  public type SortOrder   = Int;
  public type Weighting   = Float;

  // Maths
  public type PercentNat  = Nat;

  // Physics
  public type Area        = Float;
  public type Density     = Float;
  public type Distance    = Float;
  public type Friction    = Nat;
  public type Hardness    = Nat;
  public type Mass        = Float;
  public type Opacity     = Nat;
  public type Resonance   = Nat;
  public type Temperature = Int;
  public type Velocity    = Float;
  public type Volume      = Float;

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

