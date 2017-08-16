/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_tracker": {(localize "STR_Item_Tracker")};
	case "life_inv_barrier": {(localize "STR_Item_Barrier")};
    case "life_inv_empmodul": {(localize "STR_Item_Empmodul")};
    case "life_inv_uwsl": {(localize "STR_Item_Uwsl")};
    case "life_inv_houseIDS": {(localize "STR_Item_HouseIDS")};

    // resource gathering
    case "life_inv_ptools": {(localize "STR_MS_Item_ProspectiveTools")};
    case "life_inv_shovel": {(localize "STR_MS_Item_Shovel")};
    case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
    case "life_inv_oil_unprocessed": {(localize "STR_Item_OilU")};
    case "life_inv_oil_processed": {(localize "STR_Item_OilP")};
    case "life_inv_copper_ore": {(localize "STR_Item_CopperOre")};
    case "life_inv_iron_ore": {(localize "STR_Item_IronOre")};
    case "life_inv_tin_ore": {(localize "STR_MS_Item_TinOre")};
    case "life_inv_aluminium_ore": {(localize "STR_MS_Item_AluminiumOre")};
    case "life_inv_lead_ore": {(localize "STR_MS_Item_LeadOre")};
    case "life_inv_silver_ore": {(localize "STR_MS_Item_SilverOre")};
    case "life_inv_platinum_ore": {(localize "STR_MS_Item_PlatinumOre")};
    case "life_inv_titanium_ore": {(localize "STR_MS_Item_TitaniumOre")};
    case "life_inv_molybdenum_ore": {(localize "STR_MS_Item_MolybdenumOre")};
    case "life_inv_zinc_ore": {(localize "STR_MS_Item_ZincOre")};
    case "life_inv_coal": {(localize "STR_MS_Item_Coal")};
    case "life_inv_uranium_ore": {(localize "STR_MS_Item_UraniumOre")};
    case "life_inv_uranium_cleaned": {(localize "STR_MS_Item_UraniumCleaned")};
    case "life_inv_uranium_processed": {(localize "STR_MS_Item_UraniumProcessed")};
    case "life_inv_uranium_enriched": {(localize "STR_MS_Item_UraniumEnriched")};
    case "life_inv_uranium_fuelrod": {(localize "STR_MS_Item_UraniumFuelRod")};
    case "life_inv_uranium_dirty": {(localize "STR_MS_Item_UraniumDirty")};
    case "life_inv_mercury_ore": {(localize "STR_MS_Item_MercuryOre")};
    case "life_inv_iridium_ore": {(localize "STR_MS_Item_IridiumOre")};
    case "life_inv_goldnugget": {(localize "STR_MS_Item_Goldnugget")};
    case "life_inv_copper_ingot": {(localize "STR_Item_CopperIngots")};
    case "life_inv_iron_ingot": {(localize "STR_Item_IronIngots")};
    case "life_inv_tin_ingot": {(localize "STR_MS_Item_TinIngots")};
    case "life_inv_aluminium_ingot": {(localize "STR_MS_Item_AluminiumIngots")};
    case "life_inv_lead_ingot": {(localize "STR_MS_Item_LeadIngots")};
    case "life_inv_silver_ingot": {(localize "STR_MS_Item_SilverIngots")};
    case "life_inv_platinum_ingot": {(localize "STR_MS_Item_PlatinumIngots")};
    case "life_inv_titanium_ingot": {(localize "STR_MS_Item_TitaniumIngots")};
    case "life_inv_molybdenum_ingot": {(localize "STR_MS_Item_MolybdenumIngots")};
    case "life_inv_zinc_ingot": {(localize "STR_MS_Item_ZincIngots")};
    case "life_inv_mercury": {(localize "STR_MS_Item_Mercury")};
    case "life_inv_iridium": {(localize "STR_MS_Item_Iridium")};
    case "life_inv_topaz_uncut": {(localize "STR_MS_Item_TopazesUncut")};
    case "life_inv_ruby_uncut": {(localize "STR_MS_Item_RubiesUncut")};
    case "life_inv_sapphire_uncut": {(localize "STR_MS_Item_SapphiresUncut")};
    case "life_inv_diamond_uncut": {(localize "STR_MS_Item_DiamondsUncut")};
    case "life_inv_emerald_uncut": {(localize "STR_MS_Item_EmeraldsUncut")};
    case "life_inv_quartz_uncut": {(localize "STR_MS_Item_QuartzUncut")};
    case "life_inv_garnet_uncut": {(localize "STR_MS_Item_GarnetUncut")};
    case "life_inv_topaz_cut": {(localize "STR_MS_Item_TopazesCut")};
    case "life_inv_ruby_cut": {(localize "STR_MS_Item_RubiesCut")};
    case "life_inv_sapphire_cut": {(localize "STR_MS_Item_SapphiresCut")};
    case "life_inv_diamond_cut": {(localize "STR_MS_Item_DiamondsCut")};
    case "life_inv_emerald_cut": {(localize "STR_MS_Item_EmeraldsCut")};
    case "life_inv_quartz_cut": {(localize "STR_MS_Item_QuartzCut")};
    case "life_inv_garnet_cut": {(localize "STR_MS_Item_GarnetCut")};
    case "life_inv_didymium": {(localize "STR_MS_Item_Didymium")};
    case "life_inv_neodymium": {(localize "STR_MS_Item_Neodymium")};
    case "life_inv_salt": {(localize "STR_Item_Salt")};
    case "life_inv_salt_refined": {(localize "STR_Item_SaltR")};
    case "life_inv_sand": {(localize "STR_Item_Sand")};
    case "life_inv_glass": {(localize "STR_Item_Glass")};
    case "life_inv_rock": {(localize "STR_Item_Rock")};
    case "life_inv_cement": {(localize "STR_Item_CementBag")};
    case "life_inv_saltpetre": {(localize "STR_MS_Item_Saltpetre")};
    case "life_inv_saltpetre_acid": {(localize "STR_MS_Item_Saltpetre_Acid")};
    case "life_inv_sulfur": {(localize "STR_MS_Item_Sulfur")};
    case "life_inv_sulfur_acid": {(localize "STR_MS_Item_Sulfur_Acid")};
    case "life_inv_titaniumgold": {(localize "STR_MS_Item_TitaniumGold")};
    case "life_inv_bronze": {(localize "STR_MS_Item_Bronze")};
    case "life_inv_aluminiumbronze": {(localize "STR_MS_Item_AluminiumBronze")};
    case "life_inv_brass": {(localize "STR_MS_Item_Brass")};
    case "life_inv_goldamalgam": {(localize "STR_MS_Item_Goldamalgam")};
    case "life_inv_ornament": {(localize "STR_MS_Item_Ornament")};
    case "life_inv_magnet": {(localize "STR_MS_Item_Magnet")};
    case "life_inv_leadbronze": {(localize "STR_MS_Item_Leadbronze")};
    case "life_inv_whitegold": {(localize "STR_MS_Item_Whitegold")};
    case "life_inv_redbrass": {(localize "STR_MS_Item_Redbrass")};
    case "life_inv_dirt": {(localize "STR_MS_Item_Dirt")};
    case "life_inv_dino": {(localize "STR_MS_Item_Dino")};
    case "life_inv_blackpowder": {(localize "STR_MS_Item_blackpowder")};

	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_taxi": {(localize "STR_License_Taxi")};
	case "license_civ_twitch": {(localize "STR_License_Twitch")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
    case "license_civ_cargo": {(localize "STR_License_Cargo")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_sek": {(localize "STR_License_SEK")};
	case "license_cop_kripo": {(localize "STR_License_Kripo")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_bm": {(localize "STR_License_bm")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_donator": {(localize "STR_License_Donator")};
	case "license_civ_press": {(localize "STR_License_press")};
};
