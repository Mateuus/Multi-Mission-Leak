/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the license price.

	Obsolete, just for backward compatibility to the old gathering system
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {10000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "process_oil": {35000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "sek": {-1}; //SEK License cost
	case "kripo": {-1}; //Kripo License cost
	case "press": {-1}; //Kripo License cost
	case "cg": {8000}; //Coast guard license cost
	case "process_heroin": {90000}; //Heroin processing license cost
	case "process_marijuana": {45000}; //Marijuana processing license cost
	case "process_medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {1500000}; //Rebel license cost
	case "bm": {7000000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "process_diamond": {35000};
	case "process_salt": {12000};
	case "process_cocaine": {75000};
	case "process_sand": {14500};
	case "process_iron": {9500};
	case "process_copper": {8000};
	case "process_cement": {6500};
	case "process_uranium_cleaned": {5000};
	case "process_uranium_processed": {10000};
	case "process_uranium_enriched": {30000};
	case "process_uranium_fuelrod": {150000};
	case "process_uranium_dirty": {200000};
	case "mair": {15000};
	case "home": {75000};
	case "donator": {-1};
};