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
	case "driver": {5000}; //Drivers License cost
    case "boat": {11000}; //Boating license cost
    case "pilot": {55000}; //Pilot/air license cost
	case "fly": {200000}; //Pilot/air license cost
    case "gun": {50000}; //Firearm/gun license cost
    case "dive": {50000}; //Diving license cost
    case "oil": {80000}; //Oil processing license cost
    case "cair": {15000}; //Cop Pilot License cost
    case "swat": {35000}; //Swat License cost
    case "cg": {8000}; //Coast guard license cost
    case "heroin": {90000}; //Heroin processing license cost
    case "marijuana": {80000}; //Marijuana processing license cost
    case "medmarijuana": {15000}; //Medical Marijuana processing license cost
    case "gang": {500000}; //Gang license cost
    case "rebel": {1000000}; //Rebel license cost
    case "truck": {21000}; //Truck license cost
    case "diamond": {80000};
    case "salt": {12000};
    case "cocaine": {100000};
    case "sand": {14500};
	case "iron": {11000};
    case "copper": {10000};
    case "cement": {15000};
    case "mair": {15000};
	case "mboat": {11000};
	case "hack": {15000};
	case "aair": {150};
	case "home": {450000};
	case "stiller":{100000};
	case "liquor":{75000};
	case "bottler":{90000};
	case "mash":{100000};
	case "hunter":{45000};
	case "plutonium":{100000};
	case "holz":{18000};
};