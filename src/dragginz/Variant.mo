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

  // SoundChannel
  // @todo identifiers with numbers?
  public type SoundChannel = {
    #twodotone; 
    #fivedotone;
  };

  // TextureType
  // These correspond with the types of Texture found within Unity
  public type TextureType = {
    #albedo;
    #normal;
    #specular;
  };
  
}