import Hash "mo:base/Hash";

module {

  // Shortcuts
  public func Description() : Type<Text> { TextType(200) };
  public func EntityName()  : Type<Text> { TextType(20) };
  public func Username()    : Type<Text> { TextType(20) };
  public func UUID()        : Type<Text> { TextType(32) };
  public func ChunkCoord()  : Type<Nat>  { NatType() };
  public func Interval()    : Type<Nat>  { NatType() };
  public func SortOrder()   : Type<Nat>  { NatType() };
  public func Weighting()   : Type<Nat>  { NatType() };
  public func Time()        : Type<Time> { TimeType() };

  //
  // Game Design Concepts
  //
  public func GameYear()    : Type<Int> { IntType() };
  public func Level()       : Type<Int> { IntRange(0, 10) };
  public func Rank()        : Type<Nat> { NatRange(0, 8) };

  //
  // Motoko Wrapped Types
  // update these as the base classes change
  //


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

};

