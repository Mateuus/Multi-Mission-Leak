/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {9};
	case "oilp": {8};
	case "heroinu": {4};
	case "heroinp": {3};
	case "cannabis": {4};
	case "marijuana": {3};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {8};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {5};
	case "fuelF": {6};
	case "fuelK": {7};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {4};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {2};
	case "glass": {2};
	case "diamond": {6};
	case "diamondc": {5};
	case "cocaine": {6};
	case "cocainep": {5};
	case "spikeStrip": {5};
	case "rock": {5};
	case "cement": {4};
	case "goldbar": {12};
	case "wine": {3};
	case "grapes": {4};
	case "methu": {5};
	case "methp": {4};
	case "battery": {1};
	case "blastingcharge": {30};
	case "boltcutter": {10};
	case "defusekit": {1};
	case "painkillers": {5};
	case "morphium": {6};
	case "zipties": {1};
	case "storagesmall": {10};
	case "storagebig": {20};
	case "mauer": {15};
	case "rye": {5};
	case "hops": {4};
	case "yeast": {5};
	case "cornmeal": {2};
	case "mash": {4};
	case "whiskey": {3};
	case "beerp": {3};
	case "moonshine": {10};
	case "bottledwhiskey": {2};
	case "bottledbeer": {2};
	case "bottledshine": {8};
	case "bottles": {1};
	case "uran": {6};
    case "brennstab": {4};
    case "sprengstoff": {3};
	case "kidney": {20};
	case "scalpel": {5};
	case "peach": {2};
	case "stelement": {5};
	case "inelement": {20};
	
	/*
	Tanoa Farming 2.0
	Made for TanoaRPG.de
	Author: Tim "cat24max" Vogler
	
	Copyright statement:
	You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
	*/
	case "woodlog": {4};
	case "woodplank": {3};
	case "woodfurniture": {3};
	
	case "sugarraw": {3};
	case "sugarprocessed": {2};
	
	case "waterspring": {3};
	case "waterclean": {2};
	case "waterbottle": {2};
	
	case "goldore": {2};
	case "goldcoins": {1};
	
	case "oilraw": {5};
	case "oilrefined": {4};
	case "oilheat": {3};
	case "oildiesel": {3};
	case "oilkerosin": {3};
	
	case "hmherbs": {3};
	case "hmfiltrated": {2};
	case "hmbottled": {2};
	case "hmillegal": {2};
	
	case "coffeebeans": {3};
	case "coffee1": {2};
	case "energydrink": {2};
	
	case "angelstrumpetu": {6};
	case "angelstrumpetp": {5};
	
	case "crack": {4};
	
	
	//Shipwreck
	case "uwsl": {5};
	
	
	
	default {1};
};
