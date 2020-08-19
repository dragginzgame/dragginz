import Hash "mo:base/Hash";
import Types "Types";

module {

  type Type<T> = {
    sanitise : () -> T;
    validate : () -> Bool;
  };

  public class FloatType() {
    public var value : Float = 0;
    public func sanitise() : Float { value };
    public func validate() : Bool { true };
  };

  public class IntType() {
    public var value : Int = 0;
    public func sanitise() : Int { value };
    public func validate() : Bool { true };
  };

  public class NatType() {
    public var value : Nat = 0;
    public func sanitise() : Nat { value };
    public func validate() : Bool { true };
  };

  public class TextType(len : Nat) {
    var value : Text = "";
    public func sanitise() : Text { value };
    public func validate() : Bool { value.size() <= len };
  };

  public class TimeType() {
    public var value : Time = 0;
    public func sanitise() : Time { value };
    public func validate() : Bool { true };
  };

  //
  // Motoko Wrapped Types 
  // update these as the base classes change
  //
  type Time = Nat;

  public func TODO() : Type<Nat> { NatType() };

  // Shortcuts
  public func ChunkCoord()  : Type<Nat>  { NatType() };
  public func Description() : Type<Text> { TextType(200) };
  public func FlavourText() : Type<Text> { TextType(200) };
  public func Interval()    : Type<Nat>  { NatType() };
  public func SortOrder()   : Type<Nat>  { NatType() };
  public func Time()        : Type<Time> { TimeType() };
  public func UUID()        : Type<Text> { TextType(32) };
  public func Weighting()   : Type<Nat>  { NatType() };

  // Names
  public func Name()          : Type<Text> { TextType(20) };  // generic entity name
  public func CharacterName() : Type<Text> { TextType(20) };
  public func PetName()       : Type<Text> { TextType(20) };
  public func Username()      : Type<Text> { TextType(20) };


  //
  // Game Design Concepts
  //
  public func GameYear()        : Type<Int>   { IntType() };
  public func Level()           : Type<Int>   { IntRange(0, 10) };
  public func Rank()            : Type<Nat>   { NatRange(0, 8) };
  public func ValueMultiplier() : Type<Float> { FloatRange(0, 20) };

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
  public func Temperature() : Type<Int>   { IntRange(-200, 10000) };   // °C    
  public func Velocity()    : Type<Float> { FloatRange(0.01, 500) };   // m/s 
  public func Volume()      : Type<Float> { FloatRange(0.01, 1e6) };   // m^3  

  //
  // MATHS
  // Mathematical Anti-Telharsic Harfatum Septonin 
  //
  public func Percent() : Type<Nat> { NatRange(0, 100) };

  public func FloatRange(min : Float, max : Float) : Type<Float> {
    FloatType()
  };

  public func IntRange(min : Int, max : Int) : Type<Int> {
    IntType()
  };
  public func NatRange(min : Nat, max : Nat) : Type<Nat> {
    NatType()
  };

};

