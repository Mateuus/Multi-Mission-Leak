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
	case "ES_inv_oilu": {(localize "STR_Item_OilU")};
	case "ES_inv_oilp": {(localize "STR_Item_OilP")};
	case "ES_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "ES_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "ES_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "ES_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "ES_inv_apple": {(localize "STR_Item_Apple")};
	case "ES_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "ES_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "ES_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "ES_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "ES_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "ES_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "ES_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "ES_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "ES_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "ES_inv_water": {(localize "STR_Item_WaterBottle")};
	case "ES_inv_coffee": {(localize "STR_Item_Coffee")};
	case "ES_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "ES_inv_donuts": {(localize "STR_Item_Donuts")};
	case "ES_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "ES_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "ES_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "ES_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "ES_inv_ironore": {(localize "STR_Item_IronOre")};
	case "ES_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "ES_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "ES_inv_sand": {(localize "STR_Item_Sand")};
	case "ES_inv_salt": {(localize "STR_Item_Salt")};
	case "ES_inv_saltr": {(localize "STR_Item_SaltR")};
	case "ES_inv_glass": {(localize "STR_Item_Glass")};
	case "ES_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "ES_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "ES_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "ES_inv_redgull": {(localize "STR_Item_RedGull")};
	case "ES_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "ES_inv_peach": {(localize "STR_Item_Peach")};
	case "ES_inv_coke": {(localize "STR_Item_CocaineU")};
	case "ES_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "ES_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "ES_inv_rock": {(localize "STR_Item_Rock")};
	case "ES_inv_cement": {(localize "STR_Item_CementBag")};
	case "ES_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "ES_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "ES_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "ES_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "ES_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "ES_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "ES_inv_kidney": {"Black Market Kidney"}; 
	case "ES_inv_hund1": {"Gassen Hund"}; 
	case "ES_inv_hund2": {"STR_Item_hund2"};
	case "ES_inv_hund3": {"Gassen Hund"}; 
	case "ES_inv_hund4": {"Gassen Hund"}; 
	case "ES_inv_hund5": {"Gassen Hund"}; 
	case "ES_inv_hund6": {"Gassen Hund"}; 	
	case "ES_inv_weddingring": {(localize "STR_Item_WeddingRing")};
	
	//License Block
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
	case "license_cop_cSO": {(localize "STR_License_CopSkinOrden")};
	case "license_cop_ncis": {(localize "STR_License_NCIS")};
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
	case "license_med_seuche": {(localize "STR_License_Seuche")};
	case "license_civ_home": {(localize "STR_License_Home")};
};
