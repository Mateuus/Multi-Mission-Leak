/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oilu": {"ES_inv_oilu"};
			case "oilp": {"ES_inv_oilp"};
			case "heroinu": {"ES_inv_heroinu"};
			case "heroinp": {"ES_inv_heroinp"};
			case "cannabis": {"ES_inv_cannabis"};
			case "marijuana": {"ES_inv_marijuana"};
			case "apple": {"ES_inv_apple"};
			case "water": {"ES_inv_water"};
			case "rabbit": {"ES_inv_rabbit"};
			case "salema": {"ES_inv_salema"};
			case "ornate": {"ES_inv_ornate"};
			case "mackerel": {"ES_inv_mackerel"};
			case "tuna": {"ES_inv_tuna"};
			case "mullet": {"ES_inv_mullet"};
			case "catshark": {"ES_inv_catshark"};
			case "turtle": {"ES_inv_turtle"};
			case "fishing": {"ES_inv_fishingpoles"};
			case "coffee": {"ES_inv_coffee"};
			case "turtlesoup": {"ES_inv_turtlesoup"};
			case "donuts": {"ES_inv_donuts"};
			case "fuelE": {"ES_inv_fuelE"};
			case "fuelF": {"ES_inv_fuelF"};
			case "money": {"ES_cash"};
			case "pickaxe": {"ES_inv_pickaxe"};
			case "copperore": {"ES_inv_copperore"};
			case "ironore": {"ES_inv_ironore"};
			case "iron_r": {"ES_inv_ironr"};
			case "copper_r": {"ES_inv_copperr"};
			case "salt": {"ES_inv_salt"};
			case "salt_r": {"ES_inv_saltr"};
			case "sand": {"ES_inv_sand"};
			case "glass": {"ES_inv_glass"};
			case "tbacon": {"ES_inv_tbacon"};
			case "lockpick": {"ES_inv_lockpick"};
			case "redgull": {"ES_inv_redgull"};
			case "peach": {"ES_inv_peach"};
			case "diamond": {"ES_inv_diamond"};
			case "diamondc": {"ES_inv_diamondr"};
			case "cocaine": {"ES_inv_coke"};
			case "cocainep": {"ES_inv_cokep"};
			case "spikeStrip": {"ES_inv_spikeStrip"};
			case "cement": {"ES_inv_cement"};
			case "rock": {"ES_inv_rock"};
			case "goldbar": {"ES_inv_goldbar"};
			case "blastingcharge": {"ES_inv_blastingcharge"};
			case "boltcutter": {"ES_inv_boltcutter"};
			case "defusekit": {"ES_inv_defusekit"};
			case "storagesmall": {"ES_inv_storagesmall"};
			case "storagebig": {"ES_inv_storagebig"};
			case "kidney": {"ES_inv_kidney"};
			case "hund1": {"ES_inv_hund1"};
			case "hund2": {"ES_inv_hund2"};
			case "hund3": {"ES_inv_hund3"};
			case "hund4": {"ES_inv_hund4"};
			case "hund5": {"ES_inv_hund5"};
			case "hund6": {"ES_inv_hund6"};
			case "lappi":{"ES_inv_laptop"};
			​case "gpstracker": {"ES_inv_gpstracker"};
			case "weddingring": {"ES_inv_weddingring"};
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "ES_inv_oilu": {"oilu"};
			case "ES_inv_oilp": {"oilp"};
			case "ES_inv_heroinu": {"heroinu"};
			case "ES_inv_heroinp": {"heroinp"};
			case "ES_inv_cannabis": {"cannabis"};
			case "ES_inv_marijuana": {"marijuana"};
			case "ES_inv_apple": {"apple"};
			case "ES_inv_water": {"water"};
			case "ES_inv_rabbit": {"rabbit"};
			case "ES_inv_salema": {"salema"};
			case "ES_inv_ornate": {"ornate"};
			case "ES_inv_mackerel": {"mackerel"};
			case "ES_inv_tuna": {"tuna"};
			case "ES_inv_mullet": {"mullet"};
			case "ES_inv_catshark": {"catshark"};
			case "ES_inv_turtle": {"turtle"};
			case "ES_inv_fishingpoles": {"fishing"};
			case "ES_inv_coffee": {"coffee"};
			case "ES_inv_turtlesoup": {"turtlesoup"};
			case "ES_inv_donuts": {"donuts"};
			case "ES_inv_fuelE": {"fuelE"};
			case "ES_inv_fuelF": {"fuelF"};
			case "ES_cash": {"money"};
			case "ES_inv_pickaxe": {"pickaxe"};
			case "ES_inv_copperore": {"copperore"};
			case "ES_inv_ironore": {"ironore"};
			case "ES_inv_ironr": {"iron_r"};
			case "ES_inv_copperr": {"copper_r"};
			case "ES_inv_sand": {"sand"};
			case "ES_inv_salt": {"salt"};
			case "ES_inv_glass": {"glass"};
			case "ES_inv_redgull": {"redgull"};
			case "ES_inv_lockpick": {"lockpick"};
			case "ES_inv_tbacon": {"tbacon"};
			case "ES_inv_peach": {"peach"};
			case "ES_inv_diamond": {"diamond"};
			case "ES_inv_diamondr": {"diamondc"};
			case "ES_inv_saltr": {"salt_r"};
			case "ES_inv_coke": {"cocaine"};
			case "ES_inv_cokep": {"cocainep"};
			case "ES_inv_spikeStrip": {"spikeStrip"};
			case "ES_inv_cement": {"cement"};
			case "ES_inv_rock": {"rock"};
			case "ES_inv_goldbar": {"goldbar"};
			case "ES_inv_blastingcharge": {"blastingcharge"};
			case "ES_inv_boltcutter": {"boltcutter"};
			case "ES_inv_defusekit": {"defusekit"};
			case "ES_inv_storagesmall": {"storagesmall"};
			case "ES_inv_storagebig": {"storagebig"};
			case "ES_inv_kidney": {"kidney"};			
			case "ES_inv_hund1": {"hund1"}; 
			case "ES_inv_hund2": {"hund2"}; 
			case "ES_inv_hund3": {"hund3"}; 
			case "ES_inv_hund4": {"hund4"}; 
			case "ES_inv_hund5": {"hund5"}; 
			case "ES_inv_hund6": {"hund6"}; 
			case "ES_inv_laptop":{"lappi"};
			​case "ES_inv_gpstracker": {"gpstracker"};
			case "ES_inv_weddingring": {"weddingring"};
		};
	};
};
