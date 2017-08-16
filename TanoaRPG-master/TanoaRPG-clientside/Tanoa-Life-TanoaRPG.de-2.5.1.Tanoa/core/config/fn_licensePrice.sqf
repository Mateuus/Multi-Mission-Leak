/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {1000}; //Drivers License cost
	case "boat": {15000}; //Boating license cost
	case "pilot": {50000}; //Pilot/air license cost
	case "gun": {50000}; //Firearm/gun license cost
	case "dive": {25000}; //Diving license cost
	case "oil": {100000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {10000}; //Coast guard license cost
	case "heroin": {500000}; //Heroin processing license cost
	case "marijuana": {120000}; //Marijuana processing license cost
	case "medmarijuana": {75000}; //Medical Marijuana processing license cost
	case "gang": {200000}; //Gang license cost
	case "rebel": {2500000}; //Rebel license cost
	case "schwarzmarkt": {12000000}; //Schwarzmarkt license cost
	case "truck": {85000}; //Truck license cost
	case "diamond": {100000}; //Diamanten Lizenz
	case "salt": {60000}; //Salz Lizenz
	case "cocaine": {500000}; //Kokain Lizenz
	case "sand": {55000}; //Sand Lizenz
	case "iron": {15000}; //Eisen Lizenz
	case "copper": {15000}; //Kupfer Lizenz
	case "cement": {75000}; //Zement Lizenz
	case "grapes": {12000}; //Trauben Lizenz
	case "moonshine": {500000}; //Moonshine Lizenz
	case "meth": {450000}; //Meth Lizenz
	case "medic": {10000}; //Medic Ausbildung
	case "mair": {15000}; //Maische
	case "home": {500000}; //Home Lizenz
	case "adac": {10000}; //ADAC Lizenz
	case "stiller":{250000}; //Abfüller
	case "liquor":{275000}; //Desti
	case "bottler":{150000}; //Abfüller Lizenz
	case "mash":{100000}; //Maische Lizenz
	case "uran": {750000}; //Uran Lizenz
	case "ielem": {850000}; //Phyiker Lizenz
	case "car": {500}; //Imperium Farhzeuge
	case "air": {5000}; //Imperium Luft
	
	/*
	Tanoa Farming 2.0
	Made for TanoaRPG.de
	Author: Tim "cat24max" Vogler
	
	Copyright statement:
	You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
	*/
	case "wood": {30000};
	case "sugar": {30000};
	case "water": {15000};
	case "gold": {80000};
	case "oilrefined": {30000};
	case "oilheat": {50000};
	case "oildiesel": {100000};
	case "oilkerosin": {150000};
	
	case "huntermasterlegal": {30000};
	case "huntermasterillegal": {300000};
	case "coffee": {30000};
	case "energydrink": {450000};
	case "angelstrump": {300000};
};