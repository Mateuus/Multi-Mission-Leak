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
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "heroinu": {"life_inv_heroinu"};
			case "heroinp": {"life_inv_heroinp"};
			case "cannabis": {"life_inv_cannabis"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "money": {"life_cash"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "copperore": {"life_inv_copperore"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "copper_r": {"life_inv_copperr"};
			case "salt": {"life_inv_salt"};
			case "salt_r": {"life_inv_saltr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "diamond": {"life_inv_diamond"};
			case "diamondc": {"life_inv_diamondr"};
			case "cocaine": {"life_inv_coke"};
			case "cocainep": {"life_inv_cokep"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "cement": {"life_inv_cement"};
			case "rock": {"life_inv_rock"};
			case "goldbar": {"life_inv_goldbar"};
			case "wine": {"life_inv_wine"};
			case "grapes": {"life_inv_grapes"};
			case "methu": {"life_inv_methu"};
			case "methp": {"life_inv_methp"};
			case "battery": {"life_inv_battery"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};
			case "painkillers": {"life_inv_painkillers"};
			case "morphium": {"life_inv_morphium"};
			case "zipties": {"life_inv_zipties"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "mauer": {"life_inv_mauer"};
			case "rye": {"life_inv_rye"};
			case "hops": {"life_inv_hops"};
			case "yeast": {"life_inv_yeast"};
			case "cornmeal": {"life_inv_cornmeal"};
			case "moonshine": {"life_inv_moonshine"};
			case "bottles": {"life_inv_bottles"};
			case "bottledshine": {"life_inv_bottledshine"};
			case "bottledbeer": {"life_inv_bottledbeer"};
			case "bottledwhiskey": {"life_inv_bottledwhiskey"};
			case "beerp": {"life_inv_beerp"};
			case "whiskey": {"life_inv_whiskey"};
			case "mash": {"life_inv_mash"};
            case "sprengstoff": {"life_inv_sprengstoff"}; // Add This
            case "brennstab": {"life_inv_brennstab"}; // Add This
            case "uran": {"life_inv_uran"}; // Add This
			case "kidney": {"life_inv_kidney"};
			case "scalpel": {"life_inv_scalpel"};
			case "stelement": {"life_inv_stelement"};
			case "inelement": {"life_inv_inelement"};
			case "fuelK": {"life_inv_fuelK"};
			case "einsatzschild": {"life_inv_einsatzschild"};
			case "defibrilator": {"life_inv_defibrilator"};
			//Craftig
			case "edelmetall": {"life_inv_edelmetall"};
			case "edelholz": {"life_inv_edelholz"};
			case "Carbon": {"life_inv_carbon"};
			case "Plastik": {"life_inv_plastik"};
			case "Spezialglas": {"life_inv_spezialglas"};
			case "Stoff": {"life_inv_stoff"};
			case "Farbe": {"life_inv_farbe"};
			case "Messing": {"life_inv_messing"};
			case "Strohpuppe": {"life_inv_strohpuppe"};
			case "Schwarzpulver": {"life_inv_schwarzpulver"};
			case "Spezialfett": {"life_inv_spezialfett"};
			case "Lynx Bauplan": {"life_inv_lynx"};
			
			/*
			Tanoa Farming 2.0
			Made for TanoaRPG.de
			Author: Tim "cat24max" Vogler
	
			Copyright statement:
			You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
			*/
			case "woodlog": {"life_inv_woodlog"};
			case "woodplank": {"life_inv_woodplank"};
			case "woodfurniture": {"life_inv_woodfurniture"};
			case "sugarraw": {"life_inv_sugarraw"};
			case "sugarprocessed": {"life_inv_sugarprocessed"};
			case "waterspring": {"life_inv_waterspring"};
			case "waterclean": {"life_inv_waterclean"};
			case "waterbottle": {"life_inv_waterbottle"};
			case "goldore": {"life_inv_goldore"};
			case "goldcoins": {"life_inv_goldcoins"};
			case "oilraw": {"life_inv_oilraw"};
			case "oilrefined": {"life_inv_oilrefined"};
			case "oilheat": {"life_inv_oilheat"};
			case "oildiesel": {"life_inv_oildiesel"};
			case "oilkerosin": {"life_inv_oilkerosin"};
			case "hmherbs": {"life_inv_hmherbs"};
			case "hmfiltrated": {"life_inv_hmfiltrated"};
			case "hmbottled": {"life_inv_hmbottled"};
			case "hmillegal": {"life_inv_hmillegal"};
			case "coffeebeans": {"life_inv_coffeebeans"};
			case "coffee1": {"life_inv_coffee1"};
			case "energydrink": {"life_inv_energydrink"};
			case "angelstrumpetu": {"life_inv_angelstrumpetu"};
			case "angelstrumpetp": {"life_inv_angelstrumpetp"};
			case "crack": {"life_inv_crack"};
			
			//Shipwreck
			case "uwsl": {"life_inv_uwsl"};
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_heroinu": {"heroinu"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "life_cash": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_salt": {"salt"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_peach": {"peach"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_diamondr": {"diamondc"};
			case "life_inv_saltr": {"salt_r"};
			case "life_inv_coke": {"cocaine"};
			case "life_inv_cokep": {"cocainep"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_cement": {"cement"};
			case "life_inv_rock": {"rock"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_wine": {"wine"};
			case "life_inv_grapes": {"grapes"};
			case "life_inv_methu": {"methu"};
			case "life_inv_methp": {"methp"};
			case "life_inv_battery": {"battery"};
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_defusekit": {"defusekit"};
			case "life_inv_painkillers": {"painkillers"};
			case "life_inv_morphium": {"morphium"};
			case "life_inv_zipties": {"zipties"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_inv_mauer": {"mauer"};
			case "life_inv_mash": {"mash"};
			case "life_inv_yeast": {"yeast"};
			case "life_inv_rye": {"rye"};
			case "life_inv_hops": {"hops"};
			case "life_inv_whiskey": {"whiskey"};
			case "life_inv_beerp": {"beerp"};
			case "life_inv_bottles": {"bottles"};
			case "life_inv_cornmeal": {"cornmeal"};
			case "life_inv_bottledwhiskey": {"bottledwhiskey"};
			case "life_inv_bottledbeer": {"bottledbeer"};
			case "life_inv_bottledshine": {"bottledshine"};
			case "life_inv_moonshine": {"moonshine"};
            case "life_inv_sprengstoff": {"sprengstoff"}; // Add This
            case "life_inv_brennstab": {"brennstab"}; // Add This
            case "life_inv_uran": {"uran"}; // Add This 
			case "life_inv_kidney": {"kidney"};
			case "life_inv_scalpel": {"scalpel"};
			case "life_inv_stelement": {"stelement"};
			case "life_inv_inelement": {"inelement"};
			case "life_inv_fuelK": {"fuelK"};
			case "life_inv_einsatzschild": {"einsatzschild"};
			case "life_inv_defibrilator": {"defibrilator"};
			//Craftig
			case "life_inv_edelmetall": {"edelmetall"};
			case "life_inv_edelholz": {"edelholz"};
			case "life_inv_carbon": {"Carbon"};
	        case "life_inv_plastik": {"Plastik"};
	        case "life_inv_spezialglas": {"Spezialglas"};
	        case "life_inv_stoff": {"Stoff"};
	        case "life_inv_farbe": {"Farbe"};
	        case "life_inv_messing": {"Messing"};
        	case "life_inv_strohpuppe": {"Strohpuppe"};
	        case "life_inv_schwarzpulver": {"Schwarzpulver"};
        	case "life_inv_spezialfett": {"Spezialfett"};
			case "life_inv_lynx": {"Lynx Bauplan"};
			
			/*
			Tanoa Farming 2.0
			Made for TanoaRPG.de
			Author: Tim "cat24max" Vogler
	
			Copyright statement:
			You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
			*/
			case "life_inv_woodlog": {"woodlog"};
			case "life_inv_woodplank": {"woodplank"};
			case "life_inv_woodfurniture": {"woodfurniture"};
			case "life_inv_sugarraw": {"sugarraw"};
			case "life_inv_sugarprocessed": {"sugarprocessed"};
			case "life_inv_waterspring": {"waterspring"};
			case "life_inv_waterclean": {"waterclean"};
			case "life_inv_waterbottle": {"waterbottle"};
			case "life_inv_goldore": {"goldore"};
			case "life_inv_goldcoins": {"goldcoins"};
			case "life_inv_oilraw": {"oilraw"};
			case "life_inv_oilrefined": {"oilrefined"};
			case "life_inv_oilheat": {"oilheat"};
			case "life_inv_oildiesel": {"oildiesel"};
			case "life_inv_oilkerosin": {"oilkerosin"};
			case "life_inv_hmherbs": {"hmherbs"};
			case "life_inv_hmfiltrated": {"hmfiltrated"};
			case "life_inv_hmbottled": {"hmbottled"};
			case "life_inv_hmillegal": {"hmillegal"};
			case "life_inv_coffeebeans": {"coffeebeans"};
			case "life_inv_coffee1": {"coffee1"};
			case "life_inv_energydrink": {"energydrink"};
			case "life_inv_angelstrumpetu": {"angelstrumpetu"};
			case "life_inv_angelstrumpetp": {"angelstrumpetp"};
			case "life_inv_crack": {"crack"};
			
			//Shipwreck
			case "life_inv_uwsl": {"uwsl"};
		};
	};
};
