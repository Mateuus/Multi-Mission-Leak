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
	case "oilu": {4};
	case "oilp": {2};
	case "kerosin": {2};
	case "heroinu": {3};
	case "heroinp": {2};
	case "cannabis": {4};
	case "marijuana": {2};
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
	case "fuelF": {4};
	case "money": {0};
	case "pickaxe": {1};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {2};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {1};
	case "glass": {2};
	case "diamond": {6};
	case "diamondc": {3};
	case "cocaine": {4};
	case "cocainep": {3};
	case "spikeStrip": {3};
	case "rock": {4};
	case "cement": {3};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "bauma": {2};
	case "brenn": {10};
	case "mais": {2};
	case "zucker": {4};
	case "schnaps": {2};
	case "papier": {1};
	case "flasche": {2};
	case "dose": {2};
	case "stein": {2};
	case "eisenkugel": {5};
	case "holzbrett": {2};
	case "muenze": {2};
	case "schmuck" : {3};
	case "vase" : {4};
	case "methu" : {4};
	case "methp" : {2};
	case "silberu" : {5};
	case "silberp" : {3};
	case "zigarettenu" : {4};
	case "zigarettenp" : {3};
	case "weinu" : {3};
	case "weinp" : {2};
	case "sprengstoffu" : {4};
	case "sprengstoffp" : {3};
	case "zigarrenu" : {5};
	case "zigarrenp" : {3};
	case "lsdu" : {3};
	case "lsdp" : {2};
	case "blauu" : {3};
	case "blaup" : {1};
	case "goldu" : {5};
	case "goldp" : {3};
	case "sschmuck" : {2};
	case "gschmuck" : {2};
	case "barricade" : {2};
	case "barrier" : {2};
	case "strahler" : {2};
	case "bauschaufel": {1};
	case "presslufthammer": {1};
	case "zipties": {1};
	case "baumwolle": {1};
	case "lauf": {3};
	case "mantel": {4};
	case "handgriff": {1};
	case "schulterstuetze": {2};
	case "verschluss": {1};
	case "stahl": {3};
	case "plastik": {2};
	case "bpzafir": {2};
	case "bplrr": {2};
	case "bplynx": {2};
	case "bpmarten": {2};
	case "zweibein": {1};
	case "kohle": {3};
	case "bpmk1": {2};
	case "bpmk14": {2};
	case "bpmk18": {2};
	case "bpspar17": {2};
	case "bpakm": {2};
	case "bpak12": {2};
	case "bpweste4": {2};
	case "lagerkiste": {10};
	case "kies": {3};
	case "xtc": {3};
	case "sense": {3};
	case "margarita": {1};
	case "calzone": {1};
	case "parkticket": {1};
	case "usb": {1};
	case "megaphone": {5};
		
	
	
	default {1};
};
