import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Types "Types";
import Schema "Schema";
import Variant "Variant";

module {

  // List of Entity Types
  public type Entity = {
    #Ability:             Ability;
    #AbilityGroup:        AbilityGroup;
    #Alignment:           Alignment;
    #AmbienceTemplate:    AmbienceTemplate;
    #Animation:           Animation;
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
    #Element:             Element;
    #Era:                 Era;
    #Gender:              Gender;
    #Geology:             Geology;
    #HardnessCategory:    HardnessCategory;
    #Icon:                Icon;
    #ItemTemplate:        ItemTemplate;
    #Material:            Material;
    #Mesh:                Mesh;
    #MobTemplate:         MobTemplate;
    #Model:               Model;
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
    #Terrain:             Terrain;
    #Texture:             Texture;
    #TextureAtlas:        TextureAtlas;
    #Theme:               Theme;
    #Weather:             Weather;
    #Zone:                Zone;
  };

  //
  // Entities
  // These work much the same as rows in a simple SQL table with a single PK
  //
  // The class is there to store extra information about the type struct
  // So for now we can put things like the "Types" that create validation rules, lengths,
  // sanitising rules in there.
  //

  //
  // Ability
  //

  public type AbilityID = Types.ID;
  public type Ability = {
    created:       Types.Time;
    lastModified:  Types.Time;
    // fields
    name:          Text;
    description:   Text;
    // relations
    icon:          IconID; 
  };
  public class AbilitySchema(e : Ability) = {
    public var name         = Schema.Name();
    public var description  = Schema.Description();
  }; 

  //
  // AbilityGroup
  // a predefined group of abilities
  //

  public type AbilityGroupID = Types.ID;
  public type AbilityGroup = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // relations
    abilities:    [AbilityID];
  };
  public class AbilityGroupSchema(e : AbilityGroup) = {
    var name        = Schema.Name();
    var description = Schema.Description(); 
  };

  //
  // Alignment
  //

  public type AlignmentID = Types.ID;
  public type Alignment = {
    created:       Types.Time;
    lastModified:  Types.Time;
    // fields
    name:          Text;
    description:   Text;
  };
  public class AlignmentSchema(e : Alignment) = {
    var name        = Schema.Name();
    var description = Schema.Description();
  };

  //
  // AmbienceTemplate
  // The template for a particle effect or sound that can be placed within a Zone
  //
  public type AmbienceTemplateID = Types.ID;
  public type AmbienceTemplate = {
    created:       Types.Time;
    lastModified:  Types.Time;
    // fields
    name:          Text;
    description:   Text;
    series:        Types.Series;
    // relations
    icon:          IconID;
    concepts:      [ConceptID];
    tags:          [TagID];
  };
  public class AmbienceTemplateSchema(e : AmbienceTemplate) = {
    var name        = Schema.Name();
    var description = Schema.Description();
  };

  //
  // Animation
  // A Rig has many Animations
  //

  public type AnimationID = Types.ID;
  public type Animation = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    series:       Types.Series;
    // relations
    rig:          RigID;
    // structs
    status:       Status; 
    contributors: [Contributor];
  };
  public class AnimationSchema(e : Animation) = {
    var name    = Schema.Name();
  };

  //
  // AssetBundle
  // A Unity AssetBundle generated by our bundler software
	// https://docs.unity3d.com/Manual/AssetBundlesIntro.html
  //

  public type AssetBundleID = Types.ID;
  public type AssetBundle = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    asset:        Types.TODO;
    // relations
    models:       [ModelID];
    shaders:      [ShaderID];
    sounds:       [SoundID];
    textures:     [TextureID];
  };
  public class AssetBundleSchema(e : AssetBundle) = {
  };

  //
  // Atmosphere
  //

  public type AtmosphereID = Types.ID;
  public type Atmosphere = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // relations
    icon:         IconID;
    substances:   [SubstanceID];
    tags:         [TagID];
    // structs
    resource:     Resource;
  };
  public class AtmosphereSchema(e : Atmosphere) = {
    public var name =        Schema.Name();
    public var description = Schema.Description();
  };

  //
  // Biome
  // A Biome forms the template for a Zone's Atmosphere, Climate and Geology
  //

  public type BiomeID = Types.ID;
  public type Biome = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // relations
    atmosphere:   AtmosphereID;
    icon:         IconID;
    climate:      ClimateID;
    concepts:     [ConceptID];
    geology:      [GeologyID];
    // structs
    resource:     Resource;
  };
  public class BiomeSchema(e : Biome) = {
    public var name =        Schema.Name();
    public var description = Schema.Description();
  };

  //
  // BuildProject
  //
  
  public type BuildProjectID = Types.ID;
  public type BuildProject = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // variants
    status:       Variant.BuildStatus;
    // relations
    originChunk:  ChunkID;
    team:         TeamID;
    // structs
    chunks:       [BuildProjectChunk];
  };
  public class BuildProjectSchema(e : BuildProject) = {
    public var name =        Schema.Name();
    public var description = Schema.Description();
  };

  //
  // BuildSubmission
  // When a BuildProject is submitted to a BuildTask we create a BuildSubmission
  //

  public type BuildSubmissionID = Types.ID;
  public type BuildSubmission = {
    created:      Types.Time;
    lastModified: Types.Time;
     // relations
    task:         BuildTaskID;
    project:      BuildProjectID;
  };
  public class BuildSubmissionSchema(e : BuildSubmission) = {
  };

  //
  // BuildTask
  // BuildTasks are created by the Dragginz Team to prioritise parts of the world that need
	// creating or upgrading
  //

  public type BuildTaskID = Types.ID;
  public type BuildTask = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // relations
    zone:         ?ZoneID;
    // structs
    chunks:       [BuildProjectChunk];
  };
  public class BuildTaskSchema(e : BuildTask) = {
    var name =        Schema.Name();
    var description = Schema.Description();
  };

  //
  // BuildTemplate
  // A BuildTemplate is a BuildProject that has been flagged as a reusable Template.
	// Care should be taken that the corresponding BuildProjects are not subsequently edited
	// by their Team, they have to be locked and moved to a new owner
  //

  public type BuildTemplateID = Types.ID;
  public type BuildTemplate = {
    created:      Types.Time;
    lastModified: Types.Time;
    // relations
    project:      BuildProjectID;
  };
  public class BuildTemplateSchema(e : BuildTemplate) = {
  };

  //
  // Character
  // A Player can create multiple Characters, each Character can
  // have multiple Pets
  //

  public type CharacterID = Types.ID;
  public type Character = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    // relations
    player:       PlayerID;
    gender:       GenderID;
    species:      SpeciesID;
    pets:         [PetID];
    roles:        [RoleID];
    // structs
    inventory:    Inventory;
  };
  public class CharacterSchema(e : Character) = {
    var name =           Schema.Name();
  };

  //
  // CharacterClass
  //

  public type CharacterClassID = Types.ID;
  public type CharacterClass = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    // relations
    icon:         IconID;
    concepts:     [ConceptID]; 
    // structs
    resource:     Resource;
  };
  public class CharacterClassSchema(e : CharacterClass) = {
    var name    =  Schema.Name();
  };

  //
  // CharacterTemplate
  //

  public type CharacterTemplateID = Types.ID;
  public type CharacterTemplate = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    // relations
    gender:       GenderID;
    species:      SpeciesID;
    // structs
    inventory:    Inventory;
  };
  public class CharacterTemplateSchema(e : CharacterTemplate) = {
    var name =      Schema.Name();
  };

  //
  // Chunk
  // A chunk is a 10 meter cubed volume of the game world
  //

  public type ChunkID = Types.ID;
  public type Chunk = {
    // fields
    x:         Types.ChunkCoord;
    y:         Types.ChunkCoord;
    z:         Types.ChunkCoord;
    // structs
    contents:  ChunkData;
  };
  public class ChunkSchema(e : Chunk) = {
    var x =         Schema.ChunkCoord();
    var y =         Schema.ChunkCoord();
    var z =         Schema.ChunkCoord();
  };

  //
  // Climate
  //

  public type ClimateID = Types.ID;
  public type Climate = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // relations
    icon:         IconID;
    tags:         [TagID];
    weather:      [WeatherID];
    // structs
    resource:     Resource;
  };
  public class ClimateSchema(e : Climate) = {
    var name =        Schema.Name();
    var description = Schema.Description();
  };

  //
  // Collider
  // A representation of a Collider within Unity
  //

  public type ColliderID = Types.ID;
  public type Collider = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    isTrigger:     Bool;
    meshScale:     ?Float;
    // enums
    axis:          Variant.Axis;
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
  public class ColliderSchema(e : Collider) = {

  };

  //
  // Concept
  // a concept art asset
  //

  public type ConceptID = Types.ID;
  public type Concept = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    asset:        Types.TODO;
    // relations
    status:       Status;
    contributors: [Contributor];
  };
  public class ConceptSchema(e : Concept) = {
  };

  //
  // CoverTemplate
  // a template for an instance of ground cover that can be placed within a Zone
  //

  public type CoverTemplateID = Types.ID;
  public type CoverTemplate = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    series:       Types.Series;
    // relations
    icon:         IconID;
    concepts:     [ConceptID];
    tags:         [TagID];
    // structs
    resource:     Resource;
    contributors: [Contributor];
  };
  public class CoverTemplateSchema(e : CoverTemplate) = {
    var name =         Schema.Name();
    var description =  Schema.Description();
  };

  //
  // Culture
  // Culture is a template for a Zone's Population and Themes
  //

  public type CultureID = Types.ID;
  public type Culture = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // relations
    icon:         IconID;
    concepts:     [ConceptID];
    population:   [PopulationID];
    tags:         [TagID];
    themes:       [ThemeID];
    // structs
    resource:     Resource;
  };
  public class CultureSchema(e : Culture) = {
    var name =         Schema.Name();
    var description =         Schema.Description();
  };

  //
  // Element
  // You can't make a fantasy game without an arbitrary set of elemental powers
  // Earth, Wind, Fire, Air and probably Shadow
  //

  public type ElementID = Types.ID;
  public type Element = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    sortOrder:    Types.SortOrder;
    // relations 
    icon:         IconID;
  };
  public class ElementSchema(e : Element) = {
    var name        = Schema.Name();
    var description = Schema.Description();
    var sortOrder   = Schema.SortOrder();
  };
  
  //
  // Era
  //

  public type EraID = Types.ID;
  public type Era = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    startYear:    Types.GameYear;
    endYear:      Types.GameYear;
    // relations
    icon:         IconID;
    // structs
    resource:     Resource;
  };
  public class EraSchema(e : Era) = {
    var name        = Schema.Name();
    var description = Schema.Description();
    var startYear   = Schema.GameYear();
    var endYear     = Schema.GameYear();
  };

  //   
  // Gender
  // An in-game gender, just Male or Female
  //

  public type GenderID = Types.ID;
  public type Gender = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    sortOrder:    Types.SortOrder;
    // relations
    icon:         IconID;
    // structs
    resource:     Resource;
  };
  public class GenderSchema(e : Gender) = {
    var name =      Schema.Name();
    var sortOrder =      Schema.SortOrder();
  };

  //
  // Geology
  //

  public type GeologyID = Types.ID;
  public type Geology = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // relations
    icon:         IconID;
    tags:         [TagID];
    // structs
    resource:    Resource;
  };
  public class GeologySchema(e : Geology) = {
    var name =       Schema.Name();
    var description =       Schema.Description();
  };

  //
  // HardnessCategory
  // A category of Hardness, used to group different materials together for game mechanics
  //

  public type HardnessCategoryID = Types.ID;
  public type HardnessCategory = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    minHardness:  Types.Hardness;
    maxHardness:  Types.Hardness;
    // relations
    icon:         IconID;
    // structs
    resource:     Resource;
  };
  public class HardnessCategorySchema(e : HardnessCategory) = {
    var name        = Schema.Name();
    var description = Schema.Description();
    var minHardness = Schema.Hardness();
    var maxHardness = Schema.Hardness();
  };

  //
  // Icon
  // A 240x240 PNG image used to represent basically anything in-game.  Will be used on the website,
  // client, and freely available to Players to use as memes.
  //

  public type IconID = Types.ID;
  public type Icon = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:     Text;
    asset:        Types.TODO;
    series:       Types.Series;
    // structs
    resource:     Resource;
    status:       Status;
    contributors: [Contributor];
  };
  public class IconSchema(e : Icon) = {
    var name =         Schema.Name();
  };

  //
  // ItemTemplate
  // The definition of an Item, not the in-game instance of that Item
  //

  public type ItemTemplateID = Types.ID;
  public type ItemTemplate = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:      Text;
    flavourText:  Text;
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
  public class ItemTemplateSchema(e : ItemTemplate) = {
    var name =      Schema.Name();
  };

  //
  // Material
  //

  public type MaterialID = Types.ID;
  public type Material = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:        Text;
    colour:      Types.Colour;
    series:      ?Types.Series;
    // relations
    mesh:        ?MeshID;
    shader:      ?ShaderID;
    textures:    [TextureID];
    // structs
    status:      Status;
  };
  public class MaterialSchema(e : Material) = {
    var name =        Schema.Name();
  };

  //
  // Mesh
  // A representation of a Mesh as defined by Unity
  //

  public type MeshID = Types.ID;
  public type Mesh = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    series:    ?Types.Series;
    // relations
    model:     ModelID;
    materials: [MaterialID];
    // structs
    status:    Status;
  };
  public class MeshSchema(e : Mesh) = {
  };

  //
  // MobTemplate
  //

  public type MobTemplateID = Types.ID;
  public type MobTemplate = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    series:       ?Types.Series;
    // relations
    icon:         IconID;
    concepts:     [ConceptID];
    tags:         [TagID];
    // structs
    modelImp:     ModelImp;
    resource:     Resource;
    status:       Status;
    composition:  SubstanceComposition;
  };
  public class MobTemplateSchema(e : MobTemplate) = {
    var name =        Schema.Name();
    var description = Schema.Description();
  };

  // Model
  // The representation of a 3D Model as defined by Unity
  public type ModelID = Types.ID;
  public type Model = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    lodLevels:    Nat;   // 1 to 10
    volume:       ?Types.Volume;
    // relations
    meshes:       [MeshID];
    // structs
    contributor:  Contributor;
    resource:     Resource;
    status:       Status;
  };
  public class ModelSchema(e : Model) = {
    var name =        Schema.Name();
    var description =  Schema.Description();
  };

  //
  // Pet
  // an actual instance of a Pet in the game
  //

  public type PetID = Types.ID;
  public type Pet = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Types.TODO;   // pet names are subject to extreme validation
    // relations
    gender:       GenderID;
    owner:        CharacterID;
    species:      SpeciesID;
  };
  public class PetSchema(e : Pet) = {
    var name =        Schema.TODO();
  };

  //
  // PetStage
  //

  public type PetStageID = Types.ID;
  public type PetStage = {
    created:        Types.Time;
    lastModified:   Types.Time;
    // fields
    name:           Text; 
    description:    Text;
    rank:           Types.Rank;
    baseLevel:      Types.Level;
    progressLevels: Nat;
    // structs
    resource:       Resource;
    costs:          [Cost];
    requirements:   [Requirement];
    restrictions:   [Restriction];
    rewards:        [Reward];
  };
  public class PetStageSchema(e : PetStage) = {
    var name           = Schema.Name();
    var description    = Schema.Description();
    var progressLevels = Schema.NatRange(1, 20);   // 1 to 20
  };

  //
  // PetTemplate
  // the list of the Pets that can be created by a Character
  //

  public type PetTemplateID = Types.ID;
  public type PetTemplate = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:     Text;
    description:   Text;
    // relations
    gender:        GenderID;
    species:       SpeciesID;
    // structs
    restrictions:  [Restriction];
  };
  public class PetTemplateSchema(e : PetTemplate) = {
    var name =     Schema.Name();
    var description =     Schema.Description();
  };

  // Player
  // A person who plays the game.  Preferably one Player account per person - we'll
  // try not to incentivise the creation of multiple accounts
  public type PlayerID = Types.ID;
  public type Player = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:     Text;
    username: Text;
    tag:      Nat; 
  };
  public class PlayerSchema(e : Player) = {
    var name     = Schema.Name();
    var username = Schema.Username();
    var tag      = Schema.NatRange(0, 9999); 
  };
  
  //
  // Population
  // A Zone can have many Populations
  //

  public type PopulationID = Types.ID;
  public type Population = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
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
  public class PopulationSchema(e : Population) = {
    var name = Schema.Name();
    var description = Schema.Description();
  };

  //
  // PropTemplate
  //

  public type PropTemplateID = Types.ID;
  public type PropTemplate = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
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
  public class PropTemplateSchema(e : PropTemplate) = {
    var name = Schema.Name();
    var description = Schema.Description();
  };
  
  //
  // Quality
  // The level of craftsmanship that an Item or Prop possesses.  Higher qualities increase the
  // value of an Item when sold, and can affect the loot rolls when an Item or Prop is broken down
  //

  public type QualityID = Types.ID;
  public type Quality = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:            Text;
    description:            Text;
    valueMultiplier: Nat;
    // relations
    icon:            IconID; 
    // structs
    resource:        Resource;
  };
  public class QualitySchema(e : Quality) = {
    var name = Schema.Name();
    var description = Schema.Description();
  };

  //
  // Rarity
  // There are seven levels of Rarity
  //

  public type RarityID = Types.ID;
  public type Rarity = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:            Text;
    valueMultiplier: Nat;
    weighting:       Types.Weighting;
    // relations
    icon:            IconID;
    // structs
    resource:        Resource;
  };
  public class RaritySchema(e : Rarity) = {
    var name = Schema.Name();
    var description = Schema.Description();
  };

  //
  // Recipe
  //

  public type RecipeID = Types.ID;
  public type Recipe = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // structs
    resource:     Resource;
    costs:        [Cost];
    requirements: [Requirement];
    restrictions: [Restriction];
    rewards:      [Reward]
  };
  public class RecipeSchema(e : Recipe) = {
    var name = Schema.Name();
    var description = Schema.Description();
  };

  //
  // Release
  // A scheduled content release
  //

  public type ReleaseID = Types.ID;
  public type Release = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:        Text;
    description: Text;
    startTime:   Types.Time;
    // relations
    icon:        IconID;
  };
  public class ReleaseSchema(e : Release) = {
    var name = Schema.Name();
    var description = Schema.Description();
  };

  //
  // Rig
  // A Rig as specified by Unity
  //

  public type RigID = Types.ID;
  public type Rig = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    series:       ?Types.Series;
    // relations
    animations:   [AnimationID];
    // structs
    status:       Status;
    contributors: [Contributor];
  };
  public class RigSchema(e : Rig) = {
    var name = Schema.Name();
    var description = Schema.Description();
  };

  // Role
  public type RoleID = Types.ID;
  public type Role = {
    created:       Types.Time;
    lastModified:  Types.Time;
    // fields
    name:          Text;
    description:   Text;
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
  public class RoleSchema(e : Role) = {
    var name = Schema.Name();
    var description = Schema.Description();
  };

  //
  // Shader
  //

  public type ShaderID = Types.ID;
  public type Shader = {
    #unity: {
      created:      Types.Time;
      lastModified: Types.Time;
      className: {
        #normal: Text;
      };
    };
    #asset: {
      created:      Types.Time;
      lastModified: Types.Time;
      // fields
      asset:        Types.TODO;
      series:       ?Types.Series;
      // structs
      status:       Status;
      contributors: [Contributor];
    };
  };
  public class ShaderSchema(e : Shader) = {

  };

  //
  // SizeCategory
  // Grouping objects by their size, so for instance, a sword may have a bonus against large creatures
  //

  public type SizeCategoryID = Types.ID;
  public type SizeCategory = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:        Text;
    description: Text;
    minSize:     Types.Distance;     // size of longest dimension
    maxSize:     Types.Distance;     // size of longest dimension
    // relations
    icon:        IconID;
    // structs
    resource:    Resource;
  };
  public class SizeCategorySchema(e : SizeCategory) = {
    var name = Schema.Name();
    var description = Schema.Description();
  };

  //
  // SkyboxTemplate
  // The template for the Skybox used in a Zone
  //

  public type SkyboxTemplateID = Types.ID;
  public type SkyboxTemplate = {
      created:      Types.Time;
      lastModified: Types.Time;
    // fields
    name:       Text;
    description: Text;
    asset:       Types.TODO;
    // structs
    status:      Status;
  };
  public class SkyboxTemplateSchema(e : SkyboxTemplate) = {
    var name =       Schema.Name();
    var description = Schema.Description();
  };

  //
  // Sound
  //

  public type SoundID = Types.ID;
  public type Sound = {
      created:      Types.Time;
      lastModified: Types.Time;
    // fields
    name:      Text;
    series:    ?Types.Series;
    // relations
    layers:    [SoundLayerID];
    // structs
    status:    Status;
  };
  public class SoundSchema(e : Sound) = {
     var name =       Schema.Name();
  };

  //
  // SoundComponent
  //

  public type SoundComponentID = Types.ID;
  public type SoundComponent = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    isRandom:   Bool;
    isRepeated: Bool;
    // relations
    variants:   [SoundVariantID];
  };
  public class SoundComponentSchema(e : SoundComponent) = {
  };

  //
  // SoundFile
  //

  public type SoundFileID = Types.ID;
  public type SoundFile = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:       Text;
    length:     Types.Interval;
    lufs:       Int;               // -99 to 99
    sampleRate: Int;               // readonly? @todo
    asset:      Types.TODO;
    // enums
    channel:    Variant.SoundChannel;
  };
  public class SoundFileSchema(e : SoundFile) = {
    var name =        Schema.Name();
  };

  //
  // SoundLayer
  // describes a complete single layer within a sound effect (layers also implement audio LOD)
  //

  public type SoundLayerID = Types.ID;
  public type SoundLayer = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    delay:        Types.Interval;
    level:        Float;               // 0 to 1
    minDistance:  Nat;                 // 0 to 10
    maxDistance:  Nat;                 // 0 to 10
    // relations
    components:   [SoundComponentID];
  };
  public class SoundLayerSchema(e : SoundLayer) = {
    var name =        Schema.Name();
  };

  // SoundLoop
  public type SoundLoopID = Types.ID;
  public type SoundLoop = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    startPos:      Types.Interval;
    endPos:        Types.Interval;
    crossfadeTime: Types.Interval;
    restartDelay:  Types.Interval;
    repeatTime:    ?Types.Interval;
    bounce:        Bool;
    reverse:       Bool;
  };
  public class SoundLoopSchema(e : SoundLoop) = {
  };

  // SoundVariant
  public type SoundVariantID = Types.ID;
  public type SoundVariant = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    playbackRate: Nat;              // 0 to 5
    bypassReverb: Bool;
    // relations
    soundLoop:    ?SoundLoopID;
    file:         [SoundFileID];
  };
  public class SoundVariantSchema(e : SoundVariant) = {
    var name =         Schema.Name();
  };

  //
  // Species
  // TREE STRUCTURE @todo
  //

  public type SpeciesID = Types.ID;
  public type Species = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
  };
  public class SpeciesSchema(e : Species) = {
    var name =      Schema.Name();
  };

  //
  // Substance
  // The basic material that something is made from.  We'd mostly stick with things like Air, Water and
  // not break them down into elements, which in most cases would be overly complex
  // @todo Tree structure
  //

  public type SubstanceID = Types.ID;
  public type Substance = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    description: Text;
    density:     Types.Density;
    hardness:    Types.Hardness;
    friction:    Types.Friction;
    // structs
    resource:    Resource;
  };
  public class SubstanceSchema(e : Substance) = {
    var name  =      Schema.Name();
  };

  //
  // Tag
  // a list of generic string tags that are used to describe zones in different ways
  //

  public type TagID = Types.ID;
  public type Tag = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
  };
  public class TagSchema(e : Tag) = {
    var name =        Schema.Name();
    var description = Schema.Description();
  };

  //
  // Team
  // A team is a group of players and a name, much the same as a Guild in WoW but can be
  // used in a more ephemeral way, such as grouping together people temporarily to work
  // on a Zone
  //

  public type TeamID = Types.ID;
  public type Team = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:      Text;
    // relations
    players:   [PlayerID];
  };
  public class TeamSchema(e : Team) = {
    var name =      Schema.Name();
  };

  //
  // TemperatureCategory
  // grouping objects into temperature ranges
  //

  public type TemperatureCategoryID = Types.ID;
  public type TemperatureCategory = {
      created:      Types.Time;
      lastModified: Types.Time;
    // fields
    name:        Text;
    description: Text;
    minTemp:     Types.Temperature;
    maxTemp:     Types.Temperature;
    // relations
    icon:        IconID;
    // structs
    resource:    Resource;
  };
  public class TemperatureCategorySchema(e : TemperatureCategory) = {
    var name =      Schema.Name();
    var description =      Schema.Description();
  };

  // Terrain
  // The various terrain found in our Dragginz Terrain System, utilising a set of shapes
  // based on cubes and diagonals
  public type TerrainID = Types.ID;
  public type Terrain = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:        Text;
    description: Text;
    resonance:   Types.Resonance;
    // relations
    icon:        IconID;
    material:    MaterialID;
    // structs
    composition: SubstanceComposition;
    resource:    Resource;
  };
  public class TerrainSchema(e : Terrain) = {
    var name =      Schema.Name();
    var description =      Schema.Description();
  };

  //
  // Texture
  //

  public type TextureID = Types.ID;
  public type Texture = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:         Text;
    asset:        Types.TODO;
    series:       ?Types.Series;
    // enums
    textureType:  Variant.TextureType;
    // relations
    material:     ?MaterialID;
    // structs
    resource:     Resource;
    status:       Status;
    contributors: [Contributor];
  };
  public class TextureClass(e : Texture) = {
    var name =      Schema.Name();
  };

  // TextureAtlas
  // A single PNG image containing many other PNG images tiled together, as per Unity
  public type TextureAtlasID = Types.ID;
  public type TextureAtlas = { 
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    asset:     Types.TODO;
    // relations
    textures:  [TextureID]
  };
  public class TextureAtlasSchema(e : TextureAtlas) = {
  };

  //
  // Theme
  //

  public type ThemeID = Types.ID;
  public type Theme = {
      created:      Types.Time;
      lastModified: Types.Time;
    // fields
    name:         Text;
    description:  Text;
    // relations
    icon:         IconID;
    tags:         [TagID];
    // structs
    resource:     Resource;
  };
  public class ThemeSchema(e : Theme) = {
    var name =      Schema.Name();
    var description =      Schema.Description();
  };

  //
  // Weather
  //

  public type WeatherID = Types.ID;
  public type Weather = {
    created:      Types.Time;
    lastModified: Types.Time;
    // fields
    name:        Text;
    description: Text;
    // relations
    icon:        IconID;
    // structs
    resource:    Resource;
  };
  public class WeatherClass(e : Weather) = {
    var name =      Schema.Name();
    var description =      Schema.Description();
  };

  //
  // Zone
  // our game world is divided into a tree of Zones
  // if a Zone is removed, don't repurpose just set isRetired to true
  //

  public type ZoneID = Types.ID;
  public type Zone = {
      created:      Types.Time;
      lastModified: Types.Time;
    // fields
    name:              Text;
    description:       Text;
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
  public class ZoneSchema(e : Zone) = {
    var name =              Schema.Name();
    var description = Schema.Description();
  };

  //
  // Data Structures
  // reuseable components for the data model
  //

  // Ambience
  public type Ambience = {
    template: AmbienceTemplateID;
  };

  // BuildProjectChunk
  public type BuildProjectChunk = {
    offsetX: Types.ChunkCoord;
    offsetY: Types.ChunkCoord;
    offsetZ: Types.ChunkCoord;
    data:    ChunkData;
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
    sizeModifier: Types.PercentNat;
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
    chance:     Types.PercentNat;
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

};
