/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = param [0,"",[""]];
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items

	case "lhm_inv_tourniquet": {"Tourniquet"};
	case "lhm_inv_Israeli_bandage": {"Israeli Bandage"};
	case "lhm_inv_combat_gauze": {"Combat Gauze"};
	case "lhm_inv_druckverband": {"Druckverband"};
	case "lhm_inv_morphin": {"Morphine"};
	case "lhm_inv_tabletten": {"Homöopathische Tabletten"};
	case "lhm_inv_schiene": {"Schiene"};

// LHM Alcohol Start
	case "lhm_inv_mash": {(localize "STR_Item_gMMixture")};
	case "lhm_inv_yeast": {(localize "STR_Item_yeast")};
	case "lhm_inv_rye": {(localize "STR_Item_rye")};
	case "lhm_inv_hops": {(localize "STR_Item_hops")};
	case "lhm_inv_whiskey": {(localize "STR_Item_DWhiskey")};
	case "lhm_inv_beerp": {(localize "STR_Item_fermBeer")};
	case "lhm_inv_bottles": {(localize "STR_Item_GlassBottles")};
	case "lhm_inv_cornmeal": {(localize "STR_Item_CGrains")};
	case "lhm_inv_bottledwhiskey": {(localize "STR_Item_bWhiskey")};
	case "lhm_inv_bottledbeer": {(localize "STR_Item_bBeer")};
	case "lhm_inv_bottledshine": {(localize "STR_Item_bMoonshine")};
	case "lhm_inv_moonshine": {(localize "STR_Item_dMoonshine")};

	case "lhm_inv_uran": {(localize "STR_Item_uran")}; //neu
	case "lhm_inv_uranwaste": {(localize "STR_Item_uranw")}; //neu
	case "lhm_inv_tabak": {(localize "STR_Item_tabak")}; //neu
	case "lhm_inv_zigarette": {(localize "STR_Item_zigarette")}; //neu
	case "lhm_inv_kidney": {(localize "STR_Item_niere")};
	case "lhm_inv_container": {(localize "STR_Item_container")};
// LHM ALcohol End
	case "lhm_inv_tracker": {(localize "STR_Item_tracker")}; //GPS TRACKER
	case "lhm_inv_tracker2": {(localize "STR_Item_tracker")}; //GPS TRACKER fuer Cops
//LHM Kippen start
	case "lhm_inv_lzigarette": {(localize "STR_Item_lzigarette")};
	case "lhm_inv_krauser": {(localize "STR_Item_knauser")};
	case "lhm_inv_rooth": {(localize "STR_Item_roothaendle")};
	case "lhm_inv_malle": {(localize "STR_Item_malle")};
	case "lhm_inv_stoivesant": {(localize "STR_Item_Stoivesant")};
//LHM Kippen end
	case "lhm_inv_roadbarrier1": {(localize "STR_Item_roadbarrier")};  //roadbarrier
	case "lhm_inv_roadcone1": {(localize "STR_Item_roadcone")};   //roadcone
	case "lhm_inv_card": {(localize "STR_Item_Scratchcard")};   //Rubbel_los
	case "lhm_inv_protest": {(localize "STR_Item_protest")};   //Protest Sign
	case "lhm_inv_sensor": {(localize "STR_Item_sensor")}; //Bewegungsmelder
	case "lhm_inv_sensor1": {(localize "STR_Item_sensor")}; //Bewegungsmelder
	case "lhm_inv_graffiti": {(localize "STR_Item_grafiti")}; //LH Graffiti
	case "lhm_inv_geocatch": {(localize "STR_Item_geoc")};
	case "lhm_inv_gas": {(localize "STR_Item_gasfass")};
	case "lhm_inv_hacken": {"Abschlepphaken"};
	case "lhm_inv_woodu": {(localize "STR_Item_woodu")};
	case "lhm_inv_woodp": {(localize "STR_Item_woodp")};
	case "lhm_inv_axe": {(localize "STR_Item_axe")};
	case "lhm_inv_egg": {(localize "STR_Item_nSchatten")};
	case "lhm_inv_oilu": {(localize "STR_Item_OilU")};
	case "lhm_inv_oilp": {(localize "STR_Item_OilP")};
	case "lhm_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "lhm_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "lhm_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "lhm_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "lhm_inv_apple": {(localize "STR_Item_Apple")};
	case "lhm_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "lhm_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "lhm_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "lhm_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "lhm_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "lhm_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "lhm_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "lhm_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "lhm_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "lhm_inv_water": {(localize "STR_Item_WaterBottle")};
	case "lhm_inv_coffee": {(localize "STR_Item_Coffee")};
	case "lhm_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "lhm_inv_donuts": {(localize "STR_Item_Donuts")};
	case "lhm_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "lhm_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "lhm_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "lhm_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "lhm_inv_ironore": {(localize "STR_Item_IronOre")};
	case "lhm_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "lhm_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "lhm_inv_sand": {(localize "STR_Item_Sand")};
	case "lhm_inv_salt": {(localize "STR_Item_Salt")};
	case "lhm_inv_saltr": {(localize "STR_Item_SaltR")};
	case "lhm_inv_glass": {(localize "STR_Item_Glass")};
	case "lhm_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "lhm_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "lhm_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "lhm_inv_redgull": {(localize "STR_Item_RedGull")};
	case "lhm_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "lhm_inv_peach": {(localize "STR_Item_Peach")};
	case "lhm_inv_coke": {(localize "STR_Item_CocaineU")};
	case "lhm_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "lhm_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "lhm_inv_rock": {(localize "STR_Item_Rock")};
	case "lhm_inv_cement": {(localize "STR_Item_CementBag")};
	case "lhm_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "lhm_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "lhm_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "lhm_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "lhm_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "lhm_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "lhm_inv_unpMeth": {(localize "STR_Item_uMeth")};
	case "lhm_inv_procMeth": {(localize "STR_Item_pMeth")};

	//License Block
// LHM Alcohol
	case "license_civ_stiller": {"Distillers License"};
	case "license_civ_liquor": {"Liquor License"};
	case "license_civ_bottler": {"Bottling License"};

	case "license_civ_uran": {"Uran License"}; // neu
	case "license_civ_zigarette": {"Zigaretten License"}; // neu
	case "license_civ_hunter": {"Bounty Hunter License"}; //neu
	case "license_civ_wood": {"Wood License"}; //neu
// LHM Alcohol
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
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

//SkillSystem
	//Prof Block
	case "Oil_Prof": {(localize "STR_Prof_Oil")};
    case "Iron_Prof": {(localize "STR_Prof_Iron")};
    case "Copper_Prof": {(localize "STR_Prof_Copper")};
    case "Rock_Prof": {(localize "STR_Prof_Rock")};
    case "Fruit_Prof": {(localize "STR_Prof_Fruit")};
    case "Salt_Prof": {(localize "STR_Prof_Salt")};
    case "Sand_Prof": {(localize "STR_Prof_Sand")};
    case "Diamond_Prof": {(localize "STR_Prof_Diamond")};
    case "Cocaine_Prof": {(localize "STR_Prof_Cocaine")};
    case "Cannabis_Prof": {(localize "STR_Prof_Cannabis")};
    case "Heroin_Prof": {(localize "STR_Prof_Heroin")};
    case "Meth_Prof": {(localize "STR_Prof_meth")};
    case "Krok_Prof": {(localize "STR_Prof_krok")};
    case "Brewing_Prof": {(localize "STR_Prof_brewing")};
    case "Shining_Prof": {(localize "STR_Prof_shining")};
    case "Distilling_Prof": {(localize "STR_Prof_distilling")};
    case "Bottling_Prof": {(localize "STR_Prof_bottling")};
    case "Ticket_Prof": {(localize "STR_Prof_ticket")};
    case "Arrest_Prof": {(localize "STR_Prof_arrest")};
    case "Impound_Prof": {(localize "STR_Prof_impound")};
    case "Revive_Prof": {(localize "STR_Prof_revive")};
    case "Rogue_Prof": {(localize "STR_Prof_rogue")};
    case "Hero_Prof": {(localize "STR_Prof_hero")};
    case "Citizen_Prof": {(localize "STR_Prof_citizen")};
    case "Criminal_Prof": {(localize "STR_Prof_criminal")};
    case "Hunting_Prof": {(localize "STR_Prof_hunting")};
    case "Fishing_Prof": {(localize "STR_Prof_fishing")};
    case "Thief_Prof": {(localize "STR_Prof_thief")};
	case "Tobacco_Prof": {(localize "STR_Tobacco_Prof")};
	case "Cigarette_Prof": {(localize "STR_Cigarette_Prof")};
	case "Smoke_Prof": {(localize "STR_Smoke_Prof")};
	case "Repair_Prof": {(localize "STR_Repair_Prof")};
	case "RedGull_Prof": {(localize "STR_RedGull_Prof")};
	case "shooting_Prof": {(localize "STR_shooting_Prof")};
	case "shooting_Prof": {(localize "STR_ADAC_Prof")};

//SkillSystem

	default {([_var] call lhm_fnc_don_vartostr)};
};
