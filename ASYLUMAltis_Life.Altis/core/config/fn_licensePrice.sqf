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
	case "driver": {100}; //Drivers License cost
	case "boat": {150}; //Boating license cost
	case "pilot": {4000}; //Pilot/air license cost
	case "gun": {250}; //Firearm/gun license cost
	case "home": {3500}; //Home owner license cost
	case "dive": {200}; //Diving license cost
	case "oil": {1000}; //Oil processing license cost
	case "cair": {1500}; //Cop Pilot License cost
	case "swat": {3500}; //Swat License cost
	case "cg": {800}; //Coast guard license cost
	case "heroin": {4500}; //Heroin processing license cost
	case "marijuana": {800}; //Marijuana processing license cost
	case "medmarijuana": {150}; //Medical Marijuana processing license cost
	case "gang": {1000}; //Gang license cost
	case "rebel": {12500}; //Rebel license cost
	case "truck": {4000}; //Truck license cost
	case "diamond": {3500};
	case "salt": {900};
	case "cocaine": {8000};
	case "sand": {700};
	case "iron": {950};
	case "copper": {600};
	case "cement": {400};
	case "meth": {6500};
	case "bounty": {6500};
};