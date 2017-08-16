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
	case "money": {0};
	case "oilu": {7};
	case "oilp": {6};
	case "heroinu": {6};
	case "heroinp": {4};
	case "cannabis": {6};
	case "marijuana": {4};
	case "apple": {1};
	case "water": {2};
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
	case "salad": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "fuelcan_super": {5};
	case "fuelcan_superplus": {5};
	case "fuelcan_diesel": {5};
	case "fuelcan_biodiesel": {5};
	case "fuelcan_kerosin": {5};
	case "pickaxe": {2};
	case "axt": {2};
	case "hasenfalle": {2};
	case "copperore": {5};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {2};
	case "glass": {2};
	case "diamond": {5};
	case "diamondc": {2};
	case "cocaine": {6};
	case "cocainep": {4};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldbar": {12};
	case "silver": {5};
	case "silverr": {3};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "mauer": {5};
	case "kegel": {5};
	case "handcuffs": {2};
	case "jutesack": {3};	
	case "battery": {1};
	case "obstsalat": {2};
	
	//Jetmining
	case "cellulosepulver": {30};
	case "maisstaerke": {30};
	case "mischmittel": {30};
	case "natriumchlorid": {30};
	case "tablettenrohling": {30};
	case "acetylsalicylsaeure": {30};
	case "hypromellose": {30};
	case "casanovil": {30};
	case "sildenafil": {30};
	case "aspirin": {30};
	case "viagra": {30};
	
	case "rye": {2};
	case "hops": {2};
	case "yeast": {2};
	case "cornmeal": {2};
	case "mash": {2};
	case "whiskey": {4};
	case "beerp": {4};
	case "moonshine": {4};
	case "bottledwhiskey": {5};
	case "bottledbeer": {5};
	case "bottledshine": {5};
	case "bottles": {1};
	
	case "defibrillator": {10};
	case "bandage": {1};
	case "morphine": {1};
	
	case "flush": {8};

	case "titanore": {6};
	case "titaneisen": {4};
	case "titanmantel": {2};
	case "holz": {4};
	case "bretter": {3};
	case "edelholz": {2};
	case "baumwolle": {4};
	case "faser": {3};
	case "stoff": {2};
	case "dreck": {4};
	case "dreckhaufen": {2};
	case "felle": {4};
	case "unv_leder": {3};
	case "leder": {2};
	case "schutt": {4};
	case "schutthaufen": {2};
	
	case "tabak": {4};
	case "feinschnitt": {3};
	case "diesel": {3};
	case "diesel_gestreckt": {3};
	case "super": {3};
	case "superplus": {4};
	case "raps": {5};
	case "biodiesel": {4};
	case "zigarette": {4};	
	case "joints": {8};
	
	case "gpstracker": {2};
	case "bs_zamak_i": {2};
	case "bs_zamak_ii": {2};
	case "bs_humm_civ": {2};

	case "beryll": {10};
	case "aquamarin": {10};
	case "bernstein": {10};
	case "koenigsbernstein": {10};
	case "royal_bracelet": {10};
	case "nephrit": {10};
	case "jade": {10};
	case "opal": {10};
	case "zwielichtopal": {10};
	case "royal_necklace": {10};
	case "peridot": {1};
	case "tiefenperidot": {10};
	case "zirkon": {1};
	case "fuerstenzirkon": {10};
	case "royal_scepter": {10};
	case "saphir": {1};
	case "himmelssaphir": {10};
	case "smaragd": {1};
	case "traumsmaragd": {10};
	case "royal_ring": {10};
	case "fossilgestein": {10};
	case "achat": {10};
	case "amethyst": {10};
	case "malachit": {10};
	case "quarz": {10};
	case "obsidian": {10};
	case "rubin": {10};
	case "tigerauge": {10};
	case "royal_crown": {10};
	case "blutstein": {10};
	case "blutdiamant": {10};
	
	default {1};
};
