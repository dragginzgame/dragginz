import Hash "mo:base/Hash";

module {

  public type ID = Word32;

  //
  // Base Types
  //

  public type Type<T> = {
    get : () -> T;
    set : T -> ();
    sanitise : () -> T;
    validate : () -> Bool;
  };

  public class FloatType() {
    public var value : Float = 0;
    public func get() : Float { value };
    public func set(v : Float) { value := v };
    public func sanitise() : Float { value };
    public func validate() : Bool { true };
  };

  public class IntType() {
    var value : Int = 0;
    public func get() : Int { value };
    public func set(v : Int) { value := v };
    public func sanitise() : Int { value };
    public func validate() : Bool { true };
  };

  public class NatType() {
    var value : Nat = 0;
    public func get() : Nat { value };
    public func set(v : Nat) { value := v };
    public func sanitise() : Nat { value };
    public func validate() : Bool { true };
  };

  public class TextType(len : Nat) {
    var value : Text = "";
    public func get() : Text { value };
    public func set(v : Text) { value := v };
    public func sanitise() : Text { value };
    public func validate() : Bool { value.size() <= len };
  };

  public class TimeType() {
    var value : Time = 0; 
    public func get() : Time { value };
    public func set(v : Time) { value := v };
    public func sanitise() : Time { value };
    public func validate() : Bool { true };
  };

  //
  // Extensions
  //

  public func FloatRange(min : Float, max : Float) : Type<Float> {

  };

  public func IntRange(min : Int, max : Int) : Type<Int> {

  };
  public func NatRange(min : Nat, max : Nat) : Type<Nat> {

  };

  // Shortcuts
  public func Relation(e : Text) : Type<Text> { UUID(); };

  public func Description() : Type<Text> { TextType(200) };
  public func EntityName()  : Type<Text> { TextType(20) };
  public func Username()    : Type<Text> { TextType(20) };
  public func UUID()        : Type<Text> { TextType(32) };

  public func ChunkCoord()  : Type<Nat>  { NatType() };
  public func Interval()    : Type<Nat>  { NatType() };
  public func Series()      : Type<Nat>  { NatType() };
  public func SortOrder()   : Type<Nat>  { NatType() };
  public func TODO()        : Type<Nat>  { NatType() };
  public func Weighting()   : Type<Nat>  { NatType() };

  public func Time()        : Type<Time> { TimeType() };

  //
  // Game Design Concepts
  //
  public func GameYear()    : Type<Int> { IntType() };
  public func Level()       : Type<Nat> { IntRange(0, 10) };
  public func Rank()        : Type<Nat> { NatRange(0, 8) };

  //
  // Motoko Wrapped Types
  // update these as the base classes change
  //
  public type Time = Int;

  //
  // Physics
  // Mostly like our world but with a little fantasy fudging thrown in
  // These will eventually have strict ranges and validation rules
  //
  public func Area()        : Type<Float> { FloatRange(0.001, 1e6) };  // m^2,  
  public func Density()     : Type<Float> { FloatRange(0.001, 1e6) };  // kg/m^3  
  public func Distance()    : Type<Float> { FloatRange(0.001, 500) };  // m
  public func Friction()    : Type<Nat>   { Percent() };               // % 
  public func Hardness()    : Type<Nat>   { NatRange(1, 15) };         // H (Mohs + 5 extra fantasy levels)
  public func Mass()        : Type<Float> { FloatRange(0.001, 1e6) };  // kg   
  public func Opacity()     : Type<Nat>   { Percent() };               // %  
  public func Resonance()   : Type<Nat>   { Percent() };               // % (fantasy world concept)
  public func Temperature() : Type<Nat>   { IntRange(-200, 10,000) };  // °C    
  public func Velocity()    : Type<Float> { FloatRange(0.01, 500) };   // m/s 
  public func Volume()      : Type<Float> { FloatRange(0.01, 1e6) };   // m^3  

  //
  // MATHS
  // Mathematical Anti-Telharsic Harfatum Septonin 
  //
  public func Percent() { NatRange(0, 100) };

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

