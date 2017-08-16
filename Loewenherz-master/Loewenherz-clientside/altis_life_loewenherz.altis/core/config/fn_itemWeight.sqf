/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = param [0,"",[""]];
if(_item == "") exitWith {};

switch (_item) do
{
// LHM Alcohol Start
	case "rye": {2};
	case "hops": {2};
	case "yeast": {2};
	case "cornmeal": {2};
	case "mash": {2};
	case "whiskey": {4};
	case "beerp": {4};
	case "moonshine": {5};
	case "bottledwhiskey": {5};
	case "bottledbeer": {5};
	case "bottledshine": {5};
	case "bottles": {1};
// LHM Alcohol End
	case "tracker": {1}; //GPS TRACKER
	case "tracker2": {1}; //GPS TRACKER fuer cops
//kippen start
	case "lzigarette": {1};
	case "krauser": {1};
	case "rooth": {1};
	case "malle": {1};
	case "stoivesant": {1};
//kippen end
	case "roadbarrier": {1};  //roadbarrier
	case "roadcone": {1};      //roadcone
	case "oilu": {7};
	case "oilp": {6};
	case "heroinu": {6};
	case "heroinp": {4};
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
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {1};
	case "glass": {1};
	case "diamond": {4};
	case "diamondc": {2};
	case "cocaine": {6};
	case "cocainep": {4};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};

	case "uran": {2}; //neu
	case "uranwaste": {4}; //neu
	case "tabak": {4}; //neu
	case "zigarette": {3}; //neu

	case "kidney": {15};
	case "container": {20};
	case "gas": {4};
	case "hacken": {1};
	case "woodu": {5};
	case "woodp": {4};
	case "unpMeth": {6};
	case "procMeth": {4};
	default {1};
};
