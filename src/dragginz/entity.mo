import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Types "types"

module {

  // List of Entity Types
  public type Entity = {
    #Ability:             Ability;
    #AbilityGroup:        AbilityGroup;
    #Alignment:           Alignment;
    #AmbienceTemplate:    AmbienceTemplate;
    #Animation:           Animation;
    #AreaGuide:           AreaGuide;
    #AssetBundle:         AssetBundle;
    #Atmosphere:          Atmosphere;
    #Biome:               Biome;
    #BuildProject:        BuildProject;
    #BuildSubmission:     BuildSubmission;
    #BuildTask:           BuildTask;
    #BuildTemplate:       BuildTemplate;
    #Character:           Character;
    #CharacterClass:      CharacterClass;
    #CharacterTemplate:   CharacterTemplate;
    #Chunk:               Chunk;
    #Climate:             Climate;
    #Collider:            Collider;
    #Concept:             Concept;
    #CoverTemplate:       CoverTemplate;
    #Culture:             Culture;
    #DensityGuide:        DensityGuide;
    #Element:             Element;
    #Era:                 Era;
    #FrictionGuide:       FrictionGuide;
    #Gender:              Gender;
    #Geology:             Geology;
    #HardnessCategory:    HardnessCategory;
    #HardnessGuide:       HardnessGuide;
    #HeightGuide:         HeightGuide;
    #Icon:                Icon;
    #ItemTemplate:        ItemTemplate;
    #LengthGuide:         LengthGuide;
    #MassGuide:           MassGuide;
    #Material:            Material;
    #Mesh:                Mesh;
    #MobTemplate:         MobTemplate;
    #Model:               Model;
    #OpacityGuide:        OpacityGuide;
    #Pet:                 Pet;
    #PetStage:            PetStage;
    #PetTemplate:         PetTemplate;
    #Player:              Player;
    #Population:          Population;
    #PropTemplate:        PropTemplate;
    #Quality:             Quality;
    #Rarity:              Rarity;
    #Recipe:              Recipe;
    #Release:             Release;
    #ResonanceGuide:      ResonanceGuide;
    #Rig:                 Rig;
    #Role:                Role;
    #Shader:              Shader;
    #SizeCategory:        SizeCategory;
    #SkyboxTemplate:      SkyboxTemplate;
    #Sound:               Sound;
    #SoundComponent:      SoundComponent;
    #SoundFile:           SoundFile;
    #SoundLayer:          SoundLayer;
    #SoundLoop:           SoundLoop;
    #SoundVariant:        SoundVariant;
    #Species:             Species;
    #Substance:           Substance;
    #Tag:                 Tag;
    #Team:                Team;
    #TemperatureCategory: TemperatureCategory;
    #TemperatureGuide:    TemperatureGuide;
    #Terrain:             Terrain;
    #Texture:             Texture;
    #TextureAtlas:        TextureAtlas;
    #Theme:               Theme;
    #VelocityGuide:       VelocityGuide;
    #VolumeGuide:         VolumeGuide;
    #Weather:             Weather;
    #Zone:                Zone;
  };

  //
  // Entities
  // These work much the same as rows in a simple SQL table with a single PK
  //

  // Metadata
  // Each entity requires metadata that we can probably expand upon in the future
  // for instance we could have a change log instead of just storing the creator
  // and last player to update
  public type Metadata = {
    created:        Types.Time;
    lastModified:   Types.Time;
    createdBy:      ?PlayerID;
    lastModifiedBy: ?PlayerID;
  };

  // @todo, maybe wrap each entity so we can have metadata?
  //public class Ability {
  //  var data = AbilityData;
  //};

  // Ability
  public type AbilityID = Types.ID;
  public type Ability = {
    _metadata:    Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    // relations
    icon:        IconID;
  };


  // AbilityGroup
  // a predefined group of abilities
  public type AbilityGroupID = Types.ID;
  public type AbilityGroup = {
    _metadata:    Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    // relations
    abilities:   [AbilityID];
  };

  // Alignment
  public type AlignmentID = Types.ID;
  public type Alignment = {
    _metadata: Metadata;
    // fields
    name:      Text;
  };

  // AmbienceTemplate
  // The template for a particle effect or sound that can be placed within a Zone
  public type AmbienceTemplateID = Types.ID;
  public type AmbienceTemplate = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    description:  Types.Description;
    series:       ?Types.Series; 
    // relations
    icon:         IconID;
    concepts:     [ConceptID];
    tags:         [TagID];
    // structs
    resource:     Resource;
    status:       Status;
    contributors: [Contributor];
  };

  // Animation
  public type AnimationID = Types.ID;
  public type Animation = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    series:       ?Types.Series;
    // relations
    rig:          RigID;
    // structs
    status:       Status;
    contributors: [Contributor];
  };

  // AreaGuide
  public type AreaGuideID = Types.ID;
  public type AreaGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    area:        Types.Area;
  };

  // AssetBundle
  // A Unity AssetBundle generated by our bundler software
	// https://docs.unity3d.com/Manual/AssetBundlesIntro.html
  public type AssetBundleID = Types.ID;
  public type AssetBundle = {
    _metadata: Metadata;
    // fields
    asset:     Types.TODO;
    // relations
    models:    [ModelID];
    shaders:   [ShaderID];
    sounds:    [SoundID];
    textures:  [TextureID];
  };

  // Atmosphere
  public type AtmosphereID = Types.ID;
  public type Atmosphere = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    // relations
    icon:        IconID;
    substances:  [SubstanceID];
    tags:        [TagID];
    // structs
    resource:    Resource;
  };

  // Biome
  // A Biome forms the template for a Zone's Atmosphere, Climate and Geology
  public type BiomeID = Types.ID;
  public type Biome = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    // relations
    icon:        IconID;
    atmosphere:  [AtmosphereID];
    climate:     [ClimateID];
    concepts:    [ConceptID];
    geology:     [GeologyID];
    // structs
    resource:    Resource;
  };

  // BuildProject
  public type BuildProjectID = Types.ID;
  public type BuildProject = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    // enums
    status:      BuildStatus;
    // relations
    originChunk: ChunkID;
    team:        TeamID;
    // structs
    chunks:      [{
      offsetX:    Types.ChunkCoord;
      offsetY:    Types.ChunkCoord;
      offsetZ:    Types.ChunkCoord;
      data:       ChunkData;
    }];
  };

  // BuildSubmission
  // When a BuildProject is submitted to a BuildTask we create a BuildSubmission
  public type BuildSubmissionID = Types.ID;
  public type BuildSubmission = {
    _metadata: Metadata;
    // relations
    task:      BuildTaskID;
    project:   BuildProjectID;
  };

  // BuildTask
  // BuildTasks are created by the Dragginz Team to prioritise parts of the world that need
	// creating or upgrading
  public type BuildTaskID = Types.ID;
  public type BuildTask = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    // relations
    zone:        ?ZoneID;
    // structs
    chunks:      [Chunk];
  };

  // BuildTemplate
  // A BuildTemplate is a BuildProject that has been flagged as a reusable Template.
	// Care should be taken that the corresponding BuildProjects are not subsequently edited
	// by their Team, they have to be locked and moved to a new owner
  public type BuildTemplateID = Types.ID;
  public type BuildTemplate = {
    _metadata: Metadata;
    // relations
    project:   BuildProjectID;
  };

  // Character
  public type CharacterID = Types.ID;
  public type Character = {
    _metadata: Metadata;
    // fields
    name:      Types.EntityName;
    // relations
    player:    PlayerID;
    gender:    GenderID;
    species:   SpeciesID;
    roles:     [RoleID];
    // structs
    inventory: Inventory;
    pets:      [Pet];
  };

  // CharacterClass
  // @todo I wanted this to be called Class, maybe that name could
  // be within the metadata
  public type CharacterClassID = Types.ID;
  public type CharacterClass = {
    _metadata: Metadata;
    // fields
    name:     Types.EntityName;
    // relations
    icon:     IconID;
    concepts: [ConceptID]; 
    // structs
    resource: Resource;
  };

  // CharacterTemplate
  public type CharacterTemplateID = Types.ID;
  public type CharacterTemplate = {
    _metadata: Metadata;
    // fields
    name:      Types.EntityName;
    // relations
    gender:    GenderID;
    species:   SpeciesID;
    // structs
    inventory: Inventory;
  };

  // Chunk
  // A chunk is a 10 meter cubed volume of the game world
  public type ChunkID = Types.ID;
  public type Chunk = {
    _metadata: Metadata;
    // fields
    x:         Types.ChunkCoord;
    y:         Types.ChunkCoord;
    z:         Types.ChunkCoord;
    // structs
    contents:  ChunkData;
  };

  // Climate
  public type ClimateID = Types.ID;
  public type Climate = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    // relations
    icon:        IconID;
    tags:        [TagID];
    weather:     [WeatherID];
    // structs
    resource:    Resource;
  };

  // Collider
  // A representation of a Collider within Unity
  public type ColliderID = Types.ID;
  public type Collider = {
    _metadata:     Metadata;
    // fields
    isTrigger:     Bool;
    rotation:      Types.Quaternion;
    boxSize:       Types.Vector;
    capsuleLength: ?Types.Distance;
    capsuleRadius: ?Types.Distance; 
    sphereRadius:  ?Types.Distance;
    meshScale:     ?Float;
    // enums
    axis:          Axis;
    // relations
    mesh:          MeshID;
  };

  // Concept
  public type ConceptID = Types.ID;
  public type Concept = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    asset:        Types.TODO;
    // structs
    status:       Status;
    contributors: [Contributor];
  };

  // CoverTemplate
  // a template for an instance of ground cover that can be placed within a Zone
  public type CoverTemplateID = Types.ID;
  public type CoverTemplate = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    description:  Types.Description;
    series:       ?Types.Series;
    // relations
    icon:         IconID;
    concepts:     [ConceptID];
    tags:         [TagID];
    // structs
    resource:     Resource;
    contributors: [Contributor];
  };

  // Culture
  // Culture is a template for a Zone's Population and Themes
  public type CultureID = Types.ID;
  public type Culture = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    description:  Types.Description;
    // relations
    icon:         IconID;
    concepts:     [ConceptID];
    population:   [PopulationID];
    tags:         [TagID];
    themes:       [ThemeID];
    // structs
    resource:     Resource;
  };

  // DensityGuide
  public type DensityGuideID = Types.ID;
  public type DensityGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    density:     Types.Density;
  };

  // Element
  // You can't make a fantasy game without an arbitrary set of elemental powers
  // Earth, Wind, Fire, Air and probably Shadow
  public type ElementID = Types.ID;
  public type Element = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    sortOrder:   Types.SortOrder;
    // relations
    icon:        IconID;
  };
  
  // Era
  public type EraID = Types.ID;
  public type Era = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    startYear:   Types.GameYear;
    endYear:     Types.GameYear;
    // relations
    icon:        IconID;
    // structs
    resource:    Resource;
  };

  // FrictionGuide
  public type FrictionGuideID = Types.ID;
  public type FrictionGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    friction:    Types.Friction;
  };
     
  // Gender
  // An in-game gender, just Male or Female
  public type GenderID = Types.ID;
  public type Gender = {
    _metadata: Metadata;
    // fields
    name:      Types.EntityName;
    sortOrder: Types.SortOrder;
    // relations
    icon:      IconID;
    // structs
    resource:  Resource;
  };

  // Geology
  public type GeologyID = Types.ID;
  public type Geology = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    // relations
    icon:        IconID;
    tags:        [TagID];
    // structs
    resource:    Resource;
  };

  // HardnessCategory
  // A category of Hardness, used to group different materials together for game mechanics
  public type HardnessCategoryID = Types.ID;
  public type HardnessCategory = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    minHardness: Types.Hardness;
    maxHardness: Types.Hardness;
    // relations
    icon:        IconID;
    // structs
    resource:    Resource;
  };

  // HardnessGuide
  public type HardnessGuideID = Types.ID;
  public type HardnessGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    hardness:    Types.Hardness;
  };

  // HeightGuide
  public type HeightGuideID = Types.ID;
  public type HeightGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    height:      Types.Distance;
  };

  // Icon
  // A 240x240 PNG image used to represent basically anything in-game.  Will be used on the website,
  // client, and freely available to Players to use as memes.
  public type IconID = Types.ID;
  public type Icon = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    asset:        Types.TODO;
    series:       ?Types.Series;
    // structs
    status:       Status;
    contributors: [Contributor];
  };

  // ItemTemplate
  // The definition of an Item, not the in-game instance of that Item
  public type ItemTemplateID = Types.ID;
  public type ItemTemplate = {
    _metadata: Metadata;
    // fields
    name:      Types.EntityName;
    // relations
    icon:      IconID;
    quality:   QualityID;
    rarity:    RarityID;
    concepts:  [ConceptID];
    // structs
    resource:  Resource;
    eatAction: ?{
      foodBonus: Types.TODO;
    };
    wearAction: ?{
    };
    abilities: [{
      ability:  AbilityID;
      cooldown: Cooldown;
      charges:  [RNG];
    }];
  };

  // LengthGuide
  public type LengthGuideID = Types.ID;
  public type LengthGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    length:      Types.Distance;
  };

  // MassGuide
  public type MassGuideID = Types.ID;
  public type MassGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    mass:        Types.Mass;
  };

  // Material
  public type MaterialID = Types.ID;
  public type Material = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    colour:      Types.Colour;
    series:      ?Types.Series;
    // relations
    mesh:        ?MeshID;
    shader:      ?ShaderID;
    textures:    [TextureID];
    // structs
    status:      Status;
  };

  // Mesh
  // A representation of a Mesh as defined by Unity
  public type MeshID = Types.ID;
  public type Mesh = {
    _metadata: Metadata;
    // fields
    series:    ?Types.Series;
    // relations
    model:     ModelID;
    materials: [MaterialID];
    // structs
    status:    Status;
  };

  // MobImplementation
  // The implementation of a Mobile OBject (player, monster, or NPC)
  // including Models and Textures.
  // 
  // There can be many templates based on this Mob Implementation (MobT) with various
  // size, clothes, and levels/roles, and other game design parameters.
  //
  // Examples:
  //  Canopy Elf Male
  //  Mimic
  //  Black Cat
  //  Purple Cat
  //
  public type MobImplementationID = Types.ID;
  public type MobImplementation = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    series:      ?Types.Series;
    // relations
    concepts:    [ConceptID];
    // structs
    objectAttr:  ObjectAttr;
    status:      Status;
  };

  // MobTemplate
  // Mobile OBject Template which includes implementation information plus
  // game design parameters
  //
  // Examples:
	//	Mimic King
	//	Macavity the Purple Cat
	//	Bob the Builder
  //
  public type MobTemplateID = Types.ID;
  public type MobTemplate = {
    _metadata:      Metadata;
    // fields
    name:           Types.EntityName;
    description:    Types.Description;
    sizeModifier:   Types.Percent;
    // relations
    icon:           IconID;
    implementation: MobImplementationID;
    concepts:       [ConceptID];
    tags:           [TagID];
    // structs
    resource:       Resource;
    status:         Status;
  };

  // Model
  // The representation of a 3D Model as defined by Unity
  public type ModelID = Types.ID;
  public type Model = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    lodLevels:   Nat;   // 1 to 10
    volume:      ?Types.Volume;
    // relations
    meshes:      [MeshID];
    // structs
    contributor: Contributor;
    status:      Status;
  };

  // OpacityGuide
  public type OpacityGuideID = Types.ID;
  public type OpacityGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    opacity:     Types.Opacity;
  };

  // Pet
  // an actual instance of a Pet in the game
  public type PetID = Types.ID;
  public type Pet = {
    _metadata:   Metadata;
    // fields
    name:        Types.TODO;   // pet names are subject to extreme validation
    // relations
    gender:      GenderID;
    owner:       CharacterID;
    species:     SpeciesID;
  };

  // PetStage
  public type PetStageID = Types.ID;
  public type PetStage = {
    _metadata:      Metadata;
    // fields
    name:           Types.EntityName;
    description:    Types.Description;
    rank:           Types.Rank;
    baseLevel:      Types.Level;
    progressLevels: Nat;   // 1 to 20
    // structs
    resource:       Resource;
    costs:          [Cost];
    requirements:   [Requirement];
    restrictions:   [Restriction];
    rewards:        [Reward];
  };

  // PetTemplate
  // the list of the Pets that can be created by a Character
  public type PetTemplateID = Types.ID;
  public type PetTemplate = {
    _metadata:     Metadata;
    // fields
    name:          Types.EntityName;
    description:   Types.Description;
    // relations
    gender:        GenderID;
    species:       SpeciesID;
    // structs
    restrictions:  [Restriction];
  };

  // Player
  // A person who plays the game.  Preferably one Player account per person - we'll
  // try not to incentivise the creation of multiple accounts
  public type PlayerID = Types.ID;
  public type Player = {
    _metadata: Metadata;
    // fields
    name:      Types.EntityName;
    username:  Types.Username;
    tag:       Nat;    // 0 to 9999 like Discord
  };

  // Population
  // A Zone can have many Populations
  public type PopulationID = Types.ID;
  public type Population = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    description:  Types.Description;
    // relations
    icon:         IconID;
    tags:         [TagID];
    // structs
    resource:     Resource;
    demographics: [{
      weighting:    Types.Weighting;
      species:      SpeciesID;
      gender:       ?GenderID;
    }];
  };

  // PropTemplate
  public type PropTemplateID = Types.ID;
  public type PropTemplate = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    description:  Types.Description;
    series:       ?Types.Series;
    // relations
    quality:      QualityID;
    concepts:     [ConceptID];
    tags:         [TagID];
    // structs
    resource:     Resource;
    status:       Status;
    contributors: [Contributor];
  };
  
  // Quality
  // The level of craftsmanship that an Item or Prop possesses.  Higher qualities increase the
  // value of an Item when sold, and can affect the loot rolls when an Item or Prop is broken down.
  public type QualityID = Types.ID;
  public type Quality = {
    _metadata:       Metadata;
    // fields
    name:            Types.EntityName;
    valueMultiplier: Nat;
    // relations
    icon:            IconID; 
    // structs
    resource:        Resource;
  };

  // Rarity
  // There are seven levels of Rarity 
  public type RarityID = Types.ID;
  public type Rarity = {
    _metadata:       Metadata;
    // fields
    name:            Types.EntityName;
    valueMultiplier: Nat;
    weighting:       Types.Weighting;
    // relations
    icon:            IconID;
    // structs
    resource:        Resource;
  };

  // Recipe
  public type RecipeID = Types.ID;
  public type Recipe = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    description:  Types.Description;
    // structs
    resource:     Resource;
    costs:        [Cost];
    requirements: [Requirement];
    restrictions: [Restriction];
    rewards:      [Reward]
  };

  // Release
  // A scheduled content release
  public type ReleaseID = Types.ID;
  public type Release = {
    _metadata:    Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    startTime:   Types.Time;
    // relations
    icon:        IconID;
  };

  // ResonanceGuide
  public type ResonanceGuideID = Types.ID;
  public type ResonanceGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    resonance:   Types.Resonance;
  };

  // Rig
  // A Rig as specified by Unity
  public type RigID = Types.ID;
  public type Rig = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    series:       ?Types.Series;
    // relations
    animations:   [AnimationID];
    // structs
    status:       Status;
    contributors: [Contributor];
  };

  // Role
  public type RoleID = Types.ID;
  public type Role = {
    _metadata:      Metadata;
    // fields
    name:           Types.EntityName;
    description:    Types.Description;
    baseLevel:      Nat;
    progressLevels: Nat;  // 1 to 20
    // relations
    characterClass: CharacterClassID;
    icon:           IconID;
    abilityGroups:  [AbilityGroupID];
    concepts:       [ConceptID];
    // structs
    resource:       Resource;
    status:         Status;
    costs:          [Cost];
    requirements:   [Requirement];
    restrictions:   [Restriction];
    rewards:        [Reward];
  };

  // Shader
  public type ShaderID = Types.ID;
  public type Shader = {
    #unity: {
      _metadata:      Metadata;
      className: {
        #normal: Text;
      };
    };
    #asset: {
      _metadata:      Metadata;
      // fields
      asset:        Types.TODO;
      series:       ?Types.Series;
      // structs
      status:       Status;
      contributors: [Contributor];
    };
  };

  // SizeCategory
  // Grouping objects by their size, so for instance, a sword may have a bonus against large creatures
  public type SizeCategoryID = Types.ID;
  public type SizeCategory = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    minSize:     Types.Distance;     // size of longest dimension
    maxSize:     Types.Distance;     // size of longest dimension
    // relations
    icon:        IconID;
    // structs
    resource:    Resource;
  };

  // SkyboxTemplate
  // The template for the Skybox used in a Zone
  public type SkyboxTemplateID = Types.ID;
  public type SkyboxTemplate = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    asset:       Types.TODO;
    // structs
    status:      Status;
  };

  // Sound
  public type SoundID = Types.ID;
  public type Sound = {
    _metadata: Metadata;
    // fields
    name:      Types.EntityName;
    series:    ?Types.Series;
    // relations
    layers:    [SoundLayerID];
    // structs
    status:    Status;
  };

  // SoundComponent
  public type SoundComponentID = Types.ID;
  public type SoundComponent = {
    _metadata:  Metadata;
    // fields
    isRandom:   Bool;
    isRepeated: Bool;
    // relations
    variants:   [SoundVariantID];
  };

  // SoundFile
  public type SoundFileID = Types.ID;
  public type SoundFile = {
    _metadata:  Metadata;
    // fields
    name:       Types.EntityName;
    length:     Types.Interval;
    lufs:       Int;               // -99 to 99
    sampleRate: Int;               // readonly? @todo
    asset:      Types.TODO;
    // enums
    channel:    SoundChannel;
  };

  // SoundLayer
  // describes a complete single layer within a sound effect (layers also implement audio LOD)
  public type SoundLayerID = Types.ID;
  public type SoundLayer = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    delay:       Types.Interval;
    level:       Float;               // 0 to 1
    minDistance: Nat;                 // 0 to 10
    maxDistance: Nat;                 // 0 to 10
    // relations
    components:  [SoundComponentID];
  };

  // SoundLoop
  public type SoundLoopID = Types.ID;
  public type SoundLoop = {
    _metadata:     Metadata;
    // fields
    startPos:      Types.Interval;
    endPos:        Types.Interval;
    crossfadeTime: Types.Interval;
    restartDelay:  Types.Interval;
    repeatTime:    ?Types.Interval;
    bounce:        Bool;
    reverse:       Bool;
  };

  // SoundVariant
  public type SoundVariantID = Types.ID;
  public type SoundVariant = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    playbackRate: Nat;              // 0 to 5
    bypassReverb: Bool;
    // relations
    soundLoop:    ?SoundLoopID;
    file:         [SoundFileID];
  };

  // Species
  // TREE STRUCTURE @todo
  public type SpeciesID = Types.ID;
  public type Species = {
    _metadata: Metadata;
    // fields
    name:      Types.EntityName;
  };

  // Substance
  // The basic material that something is made from.  We'd mostly stick with things like Air, Water and
  // not break them down into elements, which in most cases would be overly complex
  // @todo Tree structure
  public type SubstanceID = Types.ID;
  public type Substance = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    density:     Types.Density;
    hardness:    Types.Hardness;
    friction:    Types.Friction;
    // structs
    resource:    Resource;
  };

  // Tag
  // a list of generic string tags that are used to describe zones in different ways
  public type TagID = Types.ID;
  public type Tag = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
  };

  // Team
  // A team is a group of players and a name, much the same as a Guild in WoW but can be
  // used in a more ephemeral way, such as grouping together people temporarily to work
  // on a Zone
  public type TeamID = Types.ID;
  public type Team = {
    _metadata: Metadata;
    // fields
    name:      Types.EntityName;
    // relations
    players:   [PlayerID];
  };

  // TemperatureCategory
  // grouping objects into temperature ranges
  public type TemperatureCategoryID = Types.ID;
  public type TemperatureCategory = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    minTemp:     Types.Temperature;
    maxTemp:     Types.Temperature;
    // relations
    icon:        IconID;
    // structs
    resource:    Resource;
  };

  // TemperatureGuide
  public type TemperatureGuideID = Types.ID;
  public type TemperatureGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    temperature: Types.Temperature;
  };

  // Terrain
  public type TerrainID = Types.ID;
  public type Terrain = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    resonance:   Types.Resonance;
    // relations
    icon:        IconID;
    material:    MaterialID;
    composition: [SubstanceID];
    // structs
    resource:    Resource;
  };

  // Texture
  public type TextureID = Types.ID;
  public type Texture = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    asset:        Types.TODO;
    series:       ?Types.Series;
    // enums
    textureType:  TextureType;
    // relations
    material:     ?MaterialID;
    // structs
    status:       Status;
    contributors: [Contributor];
  };

  // TextureAtlas
  // A single PNG image containing many other PNG images tiled together, as per Unity
  public type TextureAtlasID = Types.ID;
  public type TextureAtlas = { 
    _metadata: Metadata;
    // fields
    asset:     Types.TODO;
    // relations
    textures:  [TextureID]
  };

  // Theme
  public type ThemeID = Types.ID;
  public type Theme = {
    _metadata:    Metadata;
    // fields
    name:         Types.EntityName;
    description:  Types.Description;
    // relations
    icon:         IconID;
    tags:         [TagID];
    // structs
    resource:     Resource;
  };

  // VelocityGuide
  public type VelocityGuideID = Types.ID;
  public type VelocityGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    velocity:    Types.Velocity;
  };

  // VolumeGuide
  public type VolumeGuideID = Types.ID;
  public type VolumeGuide = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    volume:      Types.Volume;
  };

  // Weather
  public type WeatherID = Types.ID;
  public type Weather = {
    _metadata:   Metadata;
    // fields
    name:        Types.EntityName;
    description: Types.Description;
    // relations
    icon:        IconID;
    // structs
    resource:    Resource;
  };

  // Zone
  // our game world is divided into a tree of Zones
  // if a Zone is removed, don't repurpose just set isRetired to true
  public type ZoneID = Types.ID;
  public type Zone = {
    _metadata:         Metadata;
    // fields
    name:              Types.EntityName;
    description:       Types.Description;
    isVirtual:         Bool;    // is this zone physically within the game world?
    isRetired:         Bool;    // has this zone been retired    
    // fields - inheritance
    inheritAtmosphere: Bool;
    inheritClimate:    Bool;
    inheritGeology:    Bool;
    inheritPopulation: Bool;
    inheritTheme:      Bool;
    // relations
    biome:             ?BiomeID;
    culture:           ?CultureID;
    concepts:          [ConceptID];
    // relations - classification
    atmosphere:        [AtmosphereID];
    climate:           [ClimateID];
    geology:           [GeologyID];
    population:        [PopulationID];
    theme:             [ThemeID];
    // structs
    resource:          Resource;
    status:            Status;
  };

  //
  // Data Structures
  // reuseable components for the data model
  //

  // Ambience
  public type Ambience = {
    template: AmbienceTemplateID;
  };

  // ChunkData
  public type ChunkData = {
    stuff: Text;
  };
  
  // Cooldown
  public type Cooldown = {
    interval: Types.Interval;
    uses:     Nat;  // 1 to 20
    rolling:  Bool;
  };

  // Contributor
  public type Contributor = {
    // relations
    teams:   [TeamID];
    players: [PlayerID];
  };

  // Cost
  public type Cost = {
    // fields
    currency: Nat;
  };

  // Cover
  public type Cover = {
    template: CoverTemplateID;
  };

  // Item
  public type Item = {
    template: ItemTemplateID;
  };

  // Inventory
  public type Inventory = {
    items: [InventoryItem];
  };

  // InventoryItem
  public type InventoryItem = {
    quantity: Nat;
    order:    Nat;
    // structs
    item:     Item;
  };

  // Mob
  public type Mob = {
    template: MobTemplateID;
  };

  // ObjectAttr
  // stores the attributes of anything that is represented in game as
  // a physical object
  public type ObjectAttr = {
    // relations
    model: ModelID;
    // structs
    composition: [{
      layer: {
        #surface: Nat;
        #core:    Nat;
      };
      weighting: Types.Weighting;
      substance: SubstanceID;
    }];
    implementation: Types.TODO;
  };

  // Prop
  public type Prop = {
    template: PropTemplateID;
  };

  // Requirement
  public type Requirement = {
    // structs
    character: [RequirementCharacter];
    pet:       [RequirementPet];
    player:    [RequirementPlayer];
  };

  // RequirementCharacter
  // The subset of requirements that correspond to the current Character
  public type RequirementCharacter = {
    // fields
    minRank:  ?Types.Rank;
    maxRank:  ?Types.Rank;
    minLevel: ?Types.Level;
    maxLevel: ?Types.Level;
    // relations
    gender:   ?GenderID;
    classes:  [CharacterClassID];
    roles:    [RoleID];
    species:  [SpeciesID];
  };

  // RequirementPet
  // The subset of requirements that correspond to a Character's active Pet
  public type RequirementPet = {
    // fields
    minLevel: Types.Level;
    maxLevel: Types.Level;
    // relations
    gender:   ?GenderID;
    elements: [ElementID];
    species:  [SpeciesID];
  };

  // RequirementPlayer
  // The subset of requirements that correspond to the current Player
  public type RequirementPlayer = {
    playedFor: Types.Interval;
  };

  // Resource
  // Every discoverable Entity has a corresponding Resource structure that says how
  // and when it was discovered, and the secret key used to unlock it
  public type Resource = {
    // fields
    secret:         Types.UUID;
    claimTime:      Types.Time;
    // relations
    claimCharacter: ?CharacterID;
    claimChunk:     ?ChunkID;
    claimPet:       ?PetID;
    claimPlayer:    ?PlayerID;
    claimZone:      ?ZoneID;
  };

  // Restriction
  public type Restriction = {
    // structs
    character: [RestrictionCharacter];
    pet:       [RestrictionPet];
    player:    [RestrictionPlayer];
  };

  // RestrictionCharacter
  public type RestrictionCharacter = {
    // relations
    classes:  [CharacterClassID];
    roles:    [RoleID];
    species:  [SpeciesID];
  };

  // RestrictionPet
  public type RestrictionPet = {
    // relations
    elements: [ElementID];
    species:  [SpeciesID];
  };

  // RestrictionPlayer
  public type RestrictionPlayer = {
  };

  // Reward
  public type Reward = {
    currency: Nat;
    items:    [ItemTemplateID];
  };

  // RNG
  // A single dice-based random number generator.  Multiple RNGs can be combined together
  // using addition
  public type RNG = {
    chance:     Types.Percent;
    dice:       Nat;
    faces:      Nat;
    dropHigh:   Nat;
    dropLow:    Nat;
    modifier:   Int;
    multiplier: Int;
  };

  // Skybox
  public type Skybox = {
    template: SkyboxTemplateID;
  };

  // Status
  // Fields that collectively say whether or not an Entity is actually "live" within the game
  public type Status = {
    // fields
    isLive:       Bool;
    killWithFire: Bool;
    startTime:    ?Types.Time;
    endTime:      ?Types.Time;
    // relations
    startRelease: ?ReleaseID;
    endRelease:   ?ReleaseID;
  };

  //
  // Enums
  //

  // Axis
  // A designator for a cartesian coordinate system, optimised for a four-dimensional manifold
  // with three spatial dimensions.  For the sake of simplicity, relativistic effects are ignored 
  public type Axis = {
    #x:  Text;
    #y:  Text;
    #z:  Text;
  };

  // BuildStatus
  // a list of status codes used by BuildStatus
  public type BuildStatus = {
    #approved: Text;
  };

  // SoundChannel
  // @todo identifiers with numbers?
  public type SoundChannel = {
    #twodotone:  Text;
    #fivedotone: Text;
  };

  // TextureType
  // These correspond with the types of Texture found within Unity
  public type TextureType = {
    #albedo:   Text;
    #normal:   Text;
    #specular: Text;
  };

};
 