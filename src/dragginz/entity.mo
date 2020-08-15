import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Types "./types"

module {

  // List of Entity Types
  // we'll probably need this eventually but not achieving much right now
  public type Entity = {
  };
  /*
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
  */

  //
  // Entities
  // These work much the same as rows in a simple SQL table with a single PK
  //

  // Base
  // Each entity requires the same list of fields... can probably expand upon in the future
  // for instance we could have a change log instead of just storing the creator
  // and last player to update
  public class Base() = {
    var created =        Types.Time();
    var lastModified =   Types.Time();
    //var createdBy:      ?PlayerID;
    //var lastModifiedBy: ?PlayerID;
  };

  // Ability
  public type AbilityID = Types.ID;
  public class Ability() = {
   // var _base:     Base = ???;
    // fields
    var name = Types.EntityName();
    var description = Types.Description();
    // relations
    //icon        : IconID;
  };


  // AbilityGroup
  // a predefined group of abilities
  public type AbilityGroupID = Types.ID;
  public class AbilityGroup() = {
//    var base =     Base() : Base;
    // fields
    var name =        Types.EntityName();
    var description = Types.Description();
    // relations
    var abilities:   [AbilityID] = [];
  };


  // Alignment
  public type AlignmentID = Types.ID;
  public class Alignment() = {
    //_base: Base;
    // fields
    var name = Types.EntityName();
  };

};
/*
  // AmbienceTemplate
  // The template for a particle effect or sound that can be placed within a Zone
  public type AmbienceTemplateID = Types.ID;
  public class AmbienceTemplate() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
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
  public class Animation() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName;
    series:       ?Types.Series;
    // relations
    rig:          RigID;
    // structs
    status:       Status;
    contributors: [Contributor];
  };

  // AreaGuide
  public type AreaGuideID = Types.ID;
  public class AreaGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName;
    description: Types.Description;
    area:        Types.Area;
  };

  // AssetBundle
  // A Unity AssetBundle generated by our bundler software
	// https://docs.unity3d.com/Manual/AssetBundlesIntro.html
  public type AssetBundleID = Types.ID;
  public type AssetBundle = {
    _base: Base;
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
  public class Atmosphere() = {
    _base:   Base;
    // fields
    var name = Types.EntityName();
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
  public class Biome() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
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
  public class BuildProject() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName;
    description: Types.Description;
    // enums
    status:      BuildStatus;
    // relations
    originChunk: ChunkID;
    team:        TeamID;
    // structs
    chunks:      [{
      offsetX:     Types.ChunkCoord;
      offsetY:     Types.ChunkCoord;
      offsetZ:     Types.ChunkCoord;
      data:        ChunkData;
    }];
  };

  // BuildSubmission
  // When a BuildProject is submitted to a BuildTask we create a BuildSubmission
  public type BuildSubmissionID = Types.ID;
  public type BuildSubmission = {
    _base: Base;
    // relations
    task:      BuildTaskID;
    project:   BuildProjectID;
  };

  // BuildTask
  // BuildTasks are created by the Dragginz Team to prioritise parts of the world that need
	// creating or upgrading
  public type BuildTaskID = Types.ID;
  public class BuildTask() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName;
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
    _base: Base;
    // relations
    project:   BuildProjectID;
  };

  // Character
  public type CharacterID = Types.ID;
  public class Character() = {
    _base:      Base;
    // fields
    var name =           Types.EntityName();
    // relations
    player:         PlayerID;
    gender:         GenderID;
    species:        SpeciesID;
    pets:           [PetID];
    roles:          [RoleID];
    // structs
    inventory:      Inventory;
  };

  // CharacterClass
  // @todo I wanted this to be called Class, maybe that name could
  // be within the Base
  public type CharacterClassID = Types.ID;
  public class CharacterClass() = {
    _base: Base;
    // fields
    var name    =  Types.EntityName();
    // relations
    icon:      IconID;
    concepts:  [ConceptID]; 
    // structs
    resource:  Resource;
  };

  // CharacterTemplate
  public type CharacterTemplateID = Types.ID;
  public class CharacterTemplate() = {
    _base: Base;
    // fields
    var name =      Types.EntityName();
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
    _base: Base;
    // fields
    x:         Types.ChunkCoord;
    y:         Types.ChunkCoord;
    z:         Types.ChunkCoord;
    // structs
    contents:  ChunkData;
  };

  // Climate
  public type ClimateID = Types.ID;
  public class Climate() = {
    _base:   Base;
    // fields
    var name =       Types.EntityName();
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
  public class Collider() = {
    _base:     Base;
    // fields
    isTrigger:     Bool;
    meshScale:     ?Float;
    // enums
    axis:          Axis;
    // relations
    mesh:          MeshID;
    // structs
    params: {
      #capsule: {
        length:   ?Types.Distance;
        radius:   ?Types.Distance; 
        rotation: ?Types.Quaternion;
      };
      #box: {
        size:     Types.Vector;
        rotation: ?Types.Quaternion;
      };
      #sphere: {
        radius:  ?Types.Distance;
      }
    };
  };

  // Concept
  public type ConceptID = Types.ID;
  public class Concept() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
    asset:        Types.TODO;
    // structs
    status:       Status;
    contributors: [Contributor];
  };

  // CoverTemplate
  // a template for an instance of ground cover that can be placed within a Zone
  public type CoverTemplateID = Types.ID;
  public class CoverTemplate() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
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
  public class Culture() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
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
  public class DensityGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    density:     Types.Density;
  };

  // Element
  // You can't make a fantasy game without an arbitrary set of elemental powers
  // Earth, Wind, Fire, Air and probably Shadow
  public type ElementID = Types.ID;
  public class Element() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    sortOrder:   Types.SortOrder;
    // relations
    icon:        IconID;
  };
  
  // Era
  public type EraID = Types.ID;
  public class Era() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
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
  public class FrictionGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    friction:    Types.Friction;
  };
     
  // Gender
  // An in-game gender, just Male or Female
  public type GenderID = Types.ID;
  public class Gender() = {
    _base: Base;
    // fields
    var name =      Types.EntityName();
    sortOrder: Types.SortOrder;
    // relations
    icon:      IconID;
    // structs
    resource:  Resource;
  };

  // Geology
  public type GeologyID = Types.ID;
  public class Geology() = {
    _base:   Base;
    // fields
    var name =       Types.EntityName();
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
  public class HardnessCategory() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
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
  public class HardnessGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    hardness:    Types.Hardness;
  };

  // HeightGuide
  public type HeightGuideID = Types.ID;
  public class HeightGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    height:      Types.Distance;
  };

  // Icon
  // A 240x240 PNG image used to represent basically anything in-game.  Will be used on the website,
  // client, and freely available to Players to use as memes.
  public type IconID = Types.ID;
  public class Icon() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
    asset:        Types.TODO;
    series:       ?Types.Series;
    // structs
    resource:     Resource;
    status:       Status;
    contributors: [Contributor];
  };

  // ItemTemplate
  // The definition of an Item, not the in-game instance of that Item
  public type ItemTemplateID = Types.ID;
  public class ItemTemplate() = {
    _base: Base;
    // fields
    var name =      Types.EntityName();
    // relations
    icon:      IconID;
    quality:   QualityID;
    rarity:    RarityID;
    concepts:  [ConceptID];
    // structs
    resource:  Resource;
    status:    Status;
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
  public class LengthGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    length:      Types.Distance;
  };

  // MassGuide
  public type MassGuideID = Types.ID;
  public class MassGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    mass:        Types.Mass;
  };

  // Material
  public type MaterialID = Types.ID;
  public class Material() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
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
  public class Mesh() = {
    _base: Base;
    // fields
    series:    ?Types.Series;
    // relations
    model:     ModelID;
    materials: [MaterialID];
    // structs
    status:    Status;
  };

  // MobTemplate
  //
  public type MobTemplateID = Types.ID;
  public class MobTemplate() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    series:      ?Types.Series;
    // relations
    icon:        IconID;
    concepts:    [ConceptID];
    tags:        [TagID];
    // structs
    modelImp:    ModelImp;
    resource:    Resource;
    status:      Status;
    composition: SubstanceComposition;
  };

  // Model
  // The representation of a 3D Model as defined by Unity
  public type ModelID = Types.ID;
  public class Model() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    lodLevels:   Nat;   // 1 to 10
    volume:      ?Types.Volume;
    // relations
    meshes:      [MeshID];
    // structs
    contributor: Contributor;
    resource:    Resource;
    status:      Status;
  };

  // OpacityGuide
  public type OpacityGuideID = Types.ID;
  public class OpacityGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    opacity:     Types.Opacity;
  };

  // Pet
  // an actual instance of a Pet in the game
  public type PetID = Types.ID;
  public class Pet() = {
    _base:   Base;
    // fields
    name:         Types.TODO;   // pet names are subject to extreme validation
    // relations
    gender:      GenderID;
    owner:       CharacterID;
    species:     SpeciesID;
  };

  // PetStage
  public type PetStageID = Types.ID;
  public class PetStage() = {
    _base:      Base;
    // fields
    name:           Types.EntityName;
    description:    Types.Description;
    rank:           Types.Rank;
    baseLevel:      Types.Level;
    var progressLevels = Types.NatRange(1, 20);   // 1 to 20
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
  public class PetTemplate() = {
    _base:     Base;
    // fields
    var name =     Types.EntityName();
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
  public class Player() = {
    _base:  Base;
    // fields
    var name     = Types.EntityName();
    var username = Types.Username();
    var tag      = Types.NatRange(0, 9999); 
  };
  

  // Population
  // A Zone can have many Populations
  public type PopulationID = Types.ID;
  public class Population() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
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
  public class PropTemplate() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
    description:  Types.Description;
    series:       ?Types.Series;
    // relations
    icon:         IconID;
    quality:      QualityID;
    concepts:     [ConceptID];
    tags:         [TagID];
    // structs
    modelImp:     ModelImp;
    resource:     Resource;
    status:       Status;
    contributors: [Contributor];
  };
  
  // Quality
  // The level of craftsmanship that an Item or Prop possesses.  Higher qualities increase the
  // value of an Item when sold, and can affect the loot rolls when an Item or Prop is broken down.
  public type QualityID = Types.ID;
  public class Quality() = {
    _base:       Base;
    // fields
    var name =            Types.EntityName();
    valueMultiplier: Nat;
    // relations
    icon:            IconID; 
    // structs
    resource:        Resource;
  };

  // Rarity
  // There are seven levels of Rarity 
  public type RarityID = Types.ID;
  public class Rarity() = {
    _base:       Base;
    // fields
    var name =            Types.EntityName();
    valueMultiplier: Nat;
    weighting:       Types.Weighting;
    // relations
    icon:            IconID;
    // structs
    resource:        Resource;
  };

  // Recipe
  public type RecipeID = Types.ID;
  public class Recipe() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
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
  public class Release() = {
    _base:    Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    startTime:   Types.Time;
    // relations
    icon:        IconID;
  };

  // ResonanceGuide
  public type ResonanceGuideID = Types.ID;
  public class ResonanceGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName;
    description: Types.Description;
    resonance:   Types.Resonance;
  };

  // Rig
  // A Rig as specified by Unity
  public type RigID = Types.ID;
  public class Rig() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
    series:       ?Types.Series;
    // relations
    animations:   [AnimationID];
    // structs
    status:       Status;
    contributors: [Contributor];
  };

  // Role
  public type RoleID = Types.ID;
  public class Role() = {
    _base:      Base;
    // fields
    var name =           Types.EntityName();
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
  public class Shader() = {
    #unity: {
      _base:      Base;
      className: {
        #normal: Text;
      };
    };
    #asset: {
      _base:      Base;
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
  public class SizeCategory() = {
    _base:   Base;
    // fields
    var name =    Types.EntityName();
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
  public class SkyboxTemplate() = {
    _base:   Base;
    // fields
    var name =       Types.EntityName;
    description: Types.Description;
    asset:       Types.TODO;
    // structs
    status:      Status;
  };

  // Sound
  public type SoundID = Types.ID;
  public class Sound() = {
    _base: Base;
    // fields
    var name =      Types.EntityName();
    series:    ?Types.Series;
    // relations
    layers:    [SoundLayerID];
    // structs
    status:    Status;
  };

  // SoundComponent
  public type SoundComponentID = Types.ID;
  public class SoundComponent() = {
    _base:  Base;
    // fields
    isRandom:   Bool;
    isRepeated: Bool;
    // relations
    variants:   [SoundVariantID];
  };

  // SoundFile
  public type SoundFileID = Types.ID;
  public class SoundFile() = {
    _base:  Base;
    // fields
    var name =       Types.EntityName();
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
  public class SoundLayer() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    delay:       Types.Interval;
    level:       Float;               // 0 to 1
    minDistance: Nat;                 // 0 to 10
    maxDistance: Nat;                 // 0 to 10
    // relations
    components:  [SoundComponentID];
  };

  // SoundLoop
  public type SoundLoopID = Types.ID;
  public class SoundLoop() = {
    _base:     Base;
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
  public class SoundVariant() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
    playbackRate: Nat;              // 0 to 5
    bypassReverb: Bool;
    // relations
    soundLoop:    ?SoundLoopID;
    file:         [SoundFileID];
  };

  // Species
  // TREE STRUCTURE @todo
  public type SpeciesID = Types.ID;
  public class Species() = {
    _base: Base;
    // fields
    var name =      Types.EntityName();
  };

  // Substance
  // The basic material that something is made from.  We'd mostly stick with things like Air, Water and
  // not break them down into elements, which in most cases would be overly complex
  // @todo Tree structure
  public type SubstanceID = Types.ID;
  public class Substance() = {
    _base:   Base;
    // fields
    var name  =      Types.EntityName();
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
  public class Tag() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
  };

  // Team
  // A team is a group of players and a name, much the same as a Guild in WoW but can be
  // used in a more ephemeral way, such as grouping together people temporarily to work
  // on a Zone
  public type TeamID = Types.ID;
  public class Team() = {
    _base: Base;
    // fields
    var name =      Types.EntityName();
    // relations
    players:   [PlayerID];
  };

  // TemperatureCategory
  // grouping objects into temperature ranges
  public type TemperatureCategoryID = Types.ID;
  public class TemperatureCategory() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
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
  public class TemperatureGuide() = {
    _base:   Base;
    // fields
    var name =       Types.EntityName();
    description: Types.Description;
    temperature: Types.Temperature;
  };

  // Terrain
  // The various terrain found in our Dragginz Terrain System, utilising a set of shapes
  // based on cubes and diagonals
  public type TerrainID = Types.ID;
  public class Terrain() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    resonance:   Types.Resonance;
    // relations
    icon:        IconID;
    material:    MaterialID;
    // structs
    composition: SubstanceComposition;
    resource:    Resource;
  };

  // Texture
  public type TextureID = Types.ID;
  public class Texture() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
    asset:        Types.TODO;
    series:       ?Types.Series;
    // enums
    textureType:  TextureType;
    // relations
    material:     ?MaterialID;
    // structs
    resource:     Resource;
    status:       Status;
    contributors: [Contributor];
  };

  // TextureAtlas
  // A single PNG image containing many other PNG images tiled together, as per Unity
  public type TextureAtlasID = Types.ID;
  public class TextureAtlas() = { 
    _base: Base;
    // fields
    asset:     Types.TODO;
    // relations
    textures:  [TextureID]
  };

  // Theme
  public type ThemeID = Types.ID;
  public class Theme() = {
    _base:    Base;
    // fields
    var name =         Types.EntityName();
    description:  Types.Description;
    // relations
    icon:         IconID;
    tags:         [TagID];
    // structs
    resource:     Resource;
  };

  // VelocityGuide
  public type VelocityGuideID = Types.ID;
  public class VelocityGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    velocity:    Types.Velocity;
  };

  // VolumeGuide
  public type VolumeGuideID = Types.ID;
  public class VolumeGuide() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
    description: Types.Description;
    volume:      Types.Volume;
  };

  // Weather
  public type WeatherID = Types.ID;
  public class Weather() = {
    _base:   Base;
    // fields
    var name =        Types.EntityName();
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
  public class Zone() = {
    _base:         Base;
    // fields
    var name =              Types.EntityName();
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
  // the actual instance of a Mob inside the game
  public type Mob = {
    template: MobTemplateID;
  };

  // ModelImp
  // the implementation of a Model
  public type ModelImp = {
    // fields
    sizeModifier: Types.Percent;
    // relations
    model:        ModelID;
    // structs
    meshes:       Types.TODO;
  };

  // Prop
  public type Prop = {
    template: PropTemplateID;
  };

  // Requirement
  public type Requirement = {
    // structs
    character: ?{
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
    pet: ?{
      // fields
      minLevel: ?Types.Level;
      maxLevel: ?Types.Level;
      // relations
      gender:   ?GenderID;
      elements: [ElementID];
      species:  [SpeciesID];
    };
    player: ?{
      playedFor: ?Types.Interval;
    };
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
    character: ?{
      classes:  [CharacterClassID];
      roles:    [RoleID];
      species:  [SpeciesID];
    };
    pet: ?{
      elements: [ElementID];
      species:  [SpeciesID];
    };
    player: ?{
    };
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

  // SubstanceComposition
  // the information on how a physical object is composed of Substances
  public type SubstanceComposition = {
    layers: [{
      // fields
      position: {
        #both;
        #core;
        #surface;
      };
      weighting: Types.Weighting;
      // relations
      substance: SubstanceID;
    }];
  };

  //
  // Enums
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

};
 */