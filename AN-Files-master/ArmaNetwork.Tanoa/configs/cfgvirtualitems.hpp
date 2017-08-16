/*
ArmA.Network
*/
class VirtualItems
{
// Food First (For Raths pizza)
  class apple
  {
    variable = "apple";
    displayName = "STR_Item_Apple";
    weight = 1;
    buyPrice = 200;
    sellPrice = 10;
    illegal = 0;
    edible = 1250;
    icon = "\sndimg\icons\apple.paa";
    saveItem = 1;
  };
  class peach
  {
    variable = "peach";
    displayName = "STR_Item_peach";
    weight = 1;
    buyPrice = 200;
    sellPrice = 10;
    illegal = 0;
    edible = 250;
    icon = "\sndimg\icons\peach.paa";
    saveItem = 1;
  };
  class tbacon
  {
    variable = "tbacon";
    displayName = "STR_Item_tbacon";
    weight = 2;
    buyPrice = 150;
    sellPrice = -1;
    illegal = 0;
    edible = 1500;
    icon = "\sndimg\icons\ico_tbacon.paa";
    saveItem = 1;
  };
  class donut
  {
    variable = "donut";
    displayName = "STR_Item_donut";
    weight = 1;
    buyPrice = 100;
    sellPrice = -1;
    illegal = 0;
    edible = 1250;
    icon = "\sndimg\icons\donut.paa";
    saveItem = 1;
  };
  class mre
  {
    variable = "mre";
    displayName = "STR_Item_MRE";
    weight = 2;
    buyPrice = 30;
    sellPrice = -1;
    illegal = 0;
    edible = 3500;
    icon = "\sndimg\icons\ico_mre.paa";
    saveItem = 1;
  };
  class salemaRaw {
		variable = "salemaRaw";
		displayName = "STR_Item_SalemaRaw";
		weight = 2;
		buyPrice = -1;
		sellPrice = 45;
		illegal = 0;
		edible = -1;
		icon = "";
    saveItem = 1;
	};
	class ornateRaw {
		variable = "ornateRaw";
		displayName = "STR_Item_OrnateRaw";
		weight = 2;
		buyPrice = -1;
		sellPrice = 40;
		illegal = 0;
		edible = -1;
		icon = "";
    saveItem = 1;
	};
	class mackerelRaw {
		variable = "mackerelRaw";
		displayName = "STR_Item_MackerelRaw";
		weight = 4;
		buyPrice = -1;
		sellPrice = 175;
		illegal = 0;
		edible = -1;
		icon = "";
    saveItem = 1;
	};
	class tunaRaw {
		variable = "tunaRaw";
		displayName = "STR_Item_TunaRaw";
		weight = 6;
		buyPrice = -1;
		sellPrice = 700;
		illegal = 0;
		edible = -1;
		icon = "";
    saveItem = 1;
	};
	class mulletRaw {
		variable = "mulletRaw";
		displayName = "STR_Item_MulletRaw";
		weight = 4;
		buyPrice = -1;
		sellPrice = 250;
		illegal = 0;
		edible = -1;
		icon = "";
    saveItem = 1;
	};
	class catsharkRaw {
		variable = "catsharkRaw";
		displayName = "STR_Item_CatSharkRaw";
		weight = 6;
		buyPrice = -1;
		sellPrice = 300;
		illegal = 0;
		edible = -1;
		icon = "";
    saveItem = 1;
	};
	class turtleRaw {
		variable = "turtleRaw";
		displayName = "STR_Item_TurtleRaw";
		weight = 6;
		buyPrice = -1;
		sellPrice = 3000;
		illegal = 1;
		edible = -1;
		icon = "";
    saveItem = 1;
	};
// Drinks
  class redgull
  {
    variable = "redgull";
    displayName = "STR_Item_RedGull";
    weight = 2;
    buyPrice = 100;
    sellPrice = -1;
    illegal = 0;
    edible = 800;
    icon = "\sndimg\icons\ico_redgull.paa";
    saveItem = 1;
  };
  class coffee
  {
    variable = "coffee";
    displayName = "STR_Item_coffee";
    weight = 1;
    buyPrice = 30;
    sellPrice = -1;
    illegal = 0;
    edible = 60;
    icon = "\sndimg\icons\coffee.paa";
    saveItem = 1;
  };
  class waterBottle
  {
    variable = "waterBottle";
    displayName = "STR_Item_waterBottle";
    weight = 1;
    buyPrice = 10;
    sellPrice = -1;
    illegal = 0;
    edible = 100;
    icon = "\sndimg\icons\ico_waterBottle.paa";
    saveItem = 1;
  };
//Alcohol
  class vodka
  {
    variable = "vodka";
    displayName = "STR_Item_vodka";
    weight = 3;
    buyPrice = 250;
    sellPrice = -1;
    illegal = 0;
    edible = 10;
    icon = "\sndimg\icons\ico_vodka.paa";
    saveItem =1;
  };
  class whiskey
  {
    variable = "whiskey";
    displayName = "STR_Item_whiskey";
    weight = 3;
    buyPrice = 300;
    sellPrice = -1;
    illegal = 0;
    edible = 5;
    icon = "\sndimg\icons\whiskeykeg.paa";
    saveItem = 1;
  };
  class beer
  {
    variable = "beer";
    displayName = "STR_Item_beer";
    weight = 7;
    buyPrice = 150;
    sellPrice = -1;
    illegal = 0;
    edible = 15;
    icon = "\sndimg\icons\beer.paa";
    saveItem = 1;
  };
//Civ LEGAL Tools and Equipment
  class pickaxe
  {
    variable = "pickaxe";
    displayName = "STR_Item_pickaxe";
    weight = 10;
    buyPrice = 250;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\pickaxe.paa";
    saveItem = 1;
  };
  class fuelFull
  {
    variable = "fuelFull";
    displayName = "STR_Item_FuelF";
    weight = 15;
    buyPrice = 750;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\ico_fuel.paa";
    saveItem = 1;
  };
  class fuelEmpty
  {
    variable = "fuelEmpty";
    displayName = "STR_Item_FuelE";
    weight = 5;
    buyPrice = -1;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\ico_fuelempty.paa";
    saveItem = 1;
  };
  //Illegal Tools and Equipment
  class ziptie
  {
    variable = "ziptie";
    displayName = "STR_Item_ziptie";
    weight = 1;
    buyPrice = 100;
    sellPrice = -1;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\icons\ziptie.paa";
    saveItem = 1;
  };
  class lockpick
  {
    variable = "lockpick";
    displayName = "STR_Item_Lockpick";
    weight = 8;
    buyPrice = 300;
    sellPrice = -1;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\icons\lockpick.paa";
    saveItem = 1;
  };
  class blastingcharge
  {
    variable = "blastingcharge";
    displayName = "STR_Item_BCharge";
    weight = 15;
    buyPrice = 50000;
    sellPrice = -1;
    illegal = 1;
    edible = -1;
    requirement = "('demo' in AN_Skills)";
    icon = "\sndimg\icons\ico_blastingCharge.paa";
    saveItem = 0;
  };
  class empcharge
  {
    variable = "empcharge";
    displayName = "STR_Item_EmpCharge";
    weight = 10;
    buyPrice = 40000;
    sellPrice = -1;
    illegal = 1;
    edible = -1;
    requirement = "('hacker' in AN_Skills)";
    icon = "\sndimg\icons\ico_blastingCharge.paa";
    saveItem = 0;
  };
  class laptop
  {
    variable = "laptop";
    displayName = "STR_Item_Laptop";
    weight = 5;
    buyPrice = 30000;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    requirement = "('hacker' in AN_Skills)";
    icon = "\sndimg\icons\ico_blastingCharge.paa";
    saveItem = 1;
  };
  class boltcutter
  {
    variable = "boltcutter";
    displayName = "STR_Item_BCutter";
    weight = 10;
    buyPrice = 1000;
    sellPrice = -1;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\icons\ico_boltcutters.paa";
    saveItem = 1;
  };
//Gold bars
  class goldbar
  {
    variable = "goldbar";
    displayName = "STR_Item_GoldBar";
    weight = 24;
    buyPrice = -1;
    sellPrice = 35000;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\icons\goldbar.paa";
    saveItem = 0;
  };
// Cop and EMS Tools and Equipment
  class spikeStrip
  {
    variable = "spikeStrip";
    displayName = "STR_Item_SpikeStrip";
    weight = 10;
    buyPrice = 40;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\spikestrip.paa";
    saveItem = 1;
  };
  class jaws
  {
    variable = "jaws";
    displayName = "STR_Item_Jaws";
    weight = 3;
    buyPrice = 10;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    requirement = "playerside isEqualTo independent";
    icon = "\sndimg\icons\jaws.paa";
    saveItem = 1;
  };
//Mined and refinded objects
  class copperore
  {
    variable = "copperore";
    displayName = "STR_Item_CopperOre";
    weight = 9;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\copper_ore.paa";
    saveItem = 1;
  };
  class copperr
  {
    variable = "copperr";
    displayName = "STR_Item_CopperIngot";
    weight = 6;
    buyPrice = -1;
    sellPrice = 115;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\copper.paa";
    saveItem = 0;
  };
  class ironore
  {
    variable = "ironore";
    displayName = "STR_Item_IronOre";
    weight = 3;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\iron_ore.paa";
    saveItem = 0;
  };
  class ironr
  {
    variable = "ironr";
    displayName = "STR_Item_IronIngot";
    weight = 3;
    buyPrice = -1;
    sellPrice = 151;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\iron.paa";
    saveItem = 0;
  };
  class oilu
  {
    variable = "oilu";
    displayName = "STR_Item_OilU";
    weight = 4;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\oil_unprocessed.paa";
    saveItem = 0;
  };
  class oilp
  {
    variable = "oilp";
    displayName = "STR_Item_OilP";
    weight = 2;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\oil_processed.paa";
    saveItem = 0;
  };
  class salt
  {
    variable = "salt";
    displayName = "STR_Item_Salt";
    weight = 4;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\salt_unprocessed.paa";
    saveItem = 0;
  };
  class saltr
  {
    variable = "saltr";
    displayName = "STR_Item_SaltR";
    weight = 2;
    buyPrice = -1;
    sellPrice = 101;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\salt.paa";
    saveItem = 0;
  };
  class sand
  {
    variable = "sand";
    displayName = "STR_Item_Sand";
    weight = 2;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\sand.paa";
    saveItem = 0;
  };
  class glass
  {
    variable = "glass";
    displayName = "STR_Item_Glass";
    weight = 2;
    buyPrice = -1;
    sellPrice = 121;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\glass.paa";
    saveItem = 0;
  };
  class diamond
  {
    variable = "diamond";
    displayName = "STR_Item_DiamondU";
    weight = 4;
    buyPrice = -1;
    sellPrice = 30;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\diamond_unprocessed.paa";
    saveItem = 0;
  };
  class diamondc
  {
    variable = "diamondc";
    displayName = "STR_Item_DiamondC";
    weight = 3;
    buyPrice = -1;
    sellPrice = 530;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\diamond.paa";
    saveItem = 0;
  };
  class rock
  {
    variable = "rock";
    displayName = "STR_Item_Rock";
    weight = 6;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\rock.paa";
    saveItem = 0;
  };
  class cement
  {
    variable = "cement";
    displayName = "STR_Item_CementBag";
    weight = 7;
    buyPrice = -1;
    sellPrice = 241;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\cement.paa";
    saveItem = 0;
  };
  class dirt
  {
    variable = "dirt";
    displayName = "STR_Item_Dirt";
    weight = 2;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\dirticon.paa";
    saveItem = 1;
  };
  class leadore
  {
    variable = "leadore";
    displayName = "STR_Item_LeadOre";
    weight = 4;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\zincoreicon.paa";
    saveItem = 0;
  };
  class leadr
  {
    variable = "leadr";
    displayName = "STR_Item_LeadIngot";
    weight = 3;
    buyPrice = -1;
    sellPrice = 150;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\iron.paa";
    saveItem = 0;
  };
  class zincore
  {
    variable = "zincore";
    displayName = "STR_Item_ZincOre";
    weight = 5;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\zincoreicon.paa";
    saveItem = 0;
  };
  class zincr
  {
    variable = "zincr";
    displayName = "STR_Item_ZincIngot";
    weight = 3;
    buyPrice = -1;
    sellPrice = 150;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\zincingoticon.paa";
    saveItem = 0;
  };
  class emerald
  {
    variable = "emerald";
    displayName = "STR_Item_Emerald";
    weight = 5;
    buyPrice = -1;
    sellPrice = 250;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\emeraldicon.paa";
    saveItem = 0;
  };
  class ruby
  {
    variable = "ruby";
    displayName = "STR_Item_Ruby";
    weight = 5;
    buyPrice = -1;
    sellPrice = 250;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\rubyicon.paa";
    saveItem = 0;
  };
  class sapphire
  {
    variable = "sapphire";
    displayName = "STR_Item_Sapphire";
    weight = 5;
    buyPrice = -1;
    sellPrice = 250;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\sapphireicon.paa";
    saveItem = 0;
  };
  class crystal
  {
    variable = "crystal";
    displayName = "STR_Item_Crystal";
    weight = 5;
    buyPrice = -1;
    sellPrice = 250;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\crystalicon.paa";
    saveItem = 0;
  };
  class platinumore
  {
    variable = "platinumore";
    displayName = "STR_Item_PlatinumOre";
    weight = 5;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\platinumoreicon.paa";
    saveItem = 0;
  };
  class platinumr
  {
    variable = "platinumr";
    displayName = "STR_Item_PlatinumIngot";
    weight = 5;
    buyPrice = -1;
    sellPrice = 150;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\platinumingoticon.paa";
    saveItem = 0;
  };
// Drugs
  class methp
  {
    variable = "methp";
    displayName = "STR_Item_MethP";
    weight = 3;
    buyPrice = -1;
    sellPrice = 600;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\icons\ico_methp.paa";
    saveItem = 0;
  };
  class heroinp
  {
    variable = "heroinp";
    displayName = "STR_Item_HeroinP";
    weight = 2;
    buyPrice = -1;
    sellPrice = 500;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\icons\ico_heroinu.paa";
    saveItem = 0;
  };
  class cannabis
  {
    variable = "cannabis";
    displayName = "STR_Item_Cannabis";
    weight = 4;
    buyPrice = -1;
    sellPrice = 1;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\icons\cannabis.paa";
    saveItem = 0;
  };
  class marijuana
  {
    variable = "marijuana";
    displayName = "STR_Item_Marijuana";
    weight = 2;
    buyPrice = -1;
    sellPrice = 420;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\icons\ico_marijuana.paa";
    saveItem = 1;
  };
  class cocainep
  {
    variable = "cocainep";
    displayName = "STR_Item_CocaineP";
    weight = 2;
    buyPrice = -1;
    sellPrice = 911;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\icons\cocainep.paa";
    saveItem = 0;
  };
  class mushrooms
  {
    variable = "mushrooms";
    displayName = "STR_Item_Mushrooms";
    weight = 2;
    buyPrice = -1;
    sellPrice = 20;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\icons\mushrooms.paa";
    saveItem = 0;
  };
  class magicmushrooms
  {
    variable = "magicmushrooms";
    displayName = "STR_Item_MagicMushrooms";
    weight = 2;
    buyPrice = -1;
    sellPrice = 111;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\sahrani\icons\magicmushrooms.paa";
    saveItem = 1;
  };
  class acetone
  {
    variable = "acetone";
    displayName = "STR_Item_Acetone";
    weight = 2;
    buyPrice = 52;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\sahrani\icons\acetone.paa";
    saveItem = 1;
  };
  class hydroacid
  {
    variable = "hydroacid";
    displayName = "STR_Item_Hydroacid";
    weight = 2;
    buyPrice = 55;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\sahrani\icons\hydrochloric.paa";
    saveItem = 1;
  };
  class sodiumhydro
  {
    variable = "sodiumhydro";
    displayName = "STR_Item_Sodiumhydro";
    weight = 2;
    buyPrice = 50;
    sellPrice = -1;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\sahrani\icons\causticsoda.paa";
    saveItem = 1;
  };
  class ether
  {
    variable = "ether";
    displayName = "STR_Item_Ether";
    weight = 1;
    buyPrice = 45;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\sahrani\icons\ether.paa";
    saveItem = 1;
  };
  class opium
  {
    variable = "opium";
    displayName = "STR_Item_Opium";
    weight = 2;
    buyPrice = -1;
    sellPrice = -1;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\sahrani\icons\opium.paa";
    saveItem = 0;
  };
  class poppyseeds
  {
    variable = "poppyseeds";
    displayName = "STR_Item_Poppyseeds";
    weight = 1;
    buyPrice = -1;
    sellPrice = -1;
    illegal = 0;
    edible = -1;
    icon = "\sndimg\sahrani\icons\poppyseeds.paa";
    saveItem = 0;
  };
  class cocaleaf
  {
    variable = "cocaleaf";
    displayName = "STR_Item_Cocaleaf";
    weight = 2;
    buyPrice = -1;
    sellPrice = -1;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\sahrani\icons\cocaleaf.paa";
    saveItem = 0;
  };
  class cocainepaste
  {
    variable = "cocainepaste";
    displayName = "STR_Item_Cocainepaste";
    weight = 2;
    buyPrice = -1;
    sellPrice = -1;
    illegal = 1;
    edible = -1;
    icon = "\sndimg\sahrani\icons\cocainepaste.paa";
    saveItem = 0;
  };
};
