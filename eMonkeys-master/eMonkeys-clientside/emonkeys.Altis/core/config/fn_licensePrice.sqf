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
	case "driver": {500}; //Drivers License cost
	case "boat": {7500}; //Boating license cost
	case "pilot": {35000}; //Pilot/air license cost
	case "gun": {50000}; //Firearm/gun license cost
	case "dive": {20000}; //Diving license cost
	case "oil": {175000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {200000}; //Heroin processing license cost
	case "marijuana": {200000}; //Marijuana processing license cost
	case "medmarijuana": {200000}; //Medical Marijuana processing license cost
	case "gang": {2000}; //Gang license cost
	case "rebel": {100000}; //Rebel license cost
	case "truck": {45000}; //Truck license cost
	case "diamond": {275000};
	case "salt": {17500};
	case "cocaine": {200000};
	case "sand": {60000};
	case "iron": {27500};
	case "copper": {20000};
	case "cement": {70000};
	case "silver": {200000};
	case "mair": {15000}; //Custom
	case "log": {100000}; //Logistik
	case "home": {250000}; //reb
	case "pullOut": {5000000};
	case "escort": {2000000};
	case "torture": {5000000};
	case "restrain": {3000000};
	case "stiller":{50000};
	case "liquor":{100000};
	case "bottler":{100000};
	case "mash":{100000};
	case "invisible":{5000000};
	case "jet":{20000000};

};