module {

  //
  // Variant types
  //

  // Axis
  // A designator for a cartesian coordinate system, optimised for a four-dimensional manifold
  // with three spatial dimensions.  For the sake of simplicity, relativistic effects are ignored 
  public type Axis = {
    #x;
    #y;
    #z;
  };

  // BuildStatus
  // a list of status codes used by BuildStatus
  public type BuildStatus = {
    #approved;
  };

  // ShaderClass
  // the class name of a built in Unity shader
  public type ShaderClass = {
    #normal; 
  };

  // SoundChannel
  // @todo identifiers with numbers?
  public type SoundChannel = {
    #twodotone; 
    #fivedotone;
  };

  // SubstancePosition
  public type SubstancePosition = {
    #both;
    #core;
    #surface;
  };

  // TextureType
  // These correspond with the types of Texture found within Unity
  public type TextureType = {
    #albedo;
    #normal;
    #specular;
  };
  
}