import Types "./Types"

module {

  //
  // Fixtures
  // need a better name, basically entities with a small number of rows that
  // the data rarely changes, but they don't need to be part of the relational db system
  //

  // DensityGuide
  public type DensityGuide = {
    name:        Types.Name;
    description: Types.Description;
    density:     Types.Density;
  };

  // FrictionGuide
  public type FrictionGuide = {
    name:        Types.Name;
    description: Types.Description;
    friction:    Types.Friction;
  };
  
  // HardnessGuide
  public type HardnessGuide = {
    name:        Types.Name;
    description: Types.Description;
    hardness:    Types.Hardness;
  };
  
  // HeightGuide
  public type HeightGuide = {
    name:        Types.Name;
    description: Types.Description;
    height:      Types.Distance;
  };

  // LengthGuide
  public type LengthGuide = {
    name:        Types.Name;
    description: Types.Description;
    length:      Types.Distance;
  };

  // MassGuide
  public type MassGuide = {
    name:        Types.Name;
    description: Types.Description;
    mass:        Types.Mass;
  };
  
  // OpacityGuide
  public type OpacityGuide = {
    name:        Types.Name;
    description: Types.Description;
    opacity:     Types.Opacity;
  };
  
  // ResonanceGuide
  public type ResonanceGuide = {
    name:        Types.Name;
    description: Types.Description;
    resonance:   Types.Resonance;
  };

  // TemperatureGuide
  public type TemperatureGuide = {
    name:        Types.Name;
    description: Types.Description;
    temperature: Types.Temperature;
  };

  // VelocityGuide
  public type VelocityGuide = {
    name:        Types.Name;
    description: Types.Description;
    velocity:    Types.Velocity;
  };

  // VolumeGuide
  public type VolumeGuide = {
    name:        Types.Name;
    description: Types.Description;
    volume:      Types.Volume;
  };

}