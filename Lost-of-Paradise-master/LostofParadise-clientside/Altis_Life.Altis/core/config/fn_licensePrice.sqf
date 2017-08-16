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
	case "boat": {1000}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {100000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {16000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {150000}; //Heroin processing license cost
	case "marijuana": {120000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {1500000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "diamond": {35000};
	case "salt": {12000};
	case "cocaine": {150000};
	case "meth": {250000};
	case "gold": {30000};
	case "frog": {150000};
	case "schmuck": {50000};
	case "badcocaine": {300000};
	case "atomwaffe": {500000};
	case "krokodile": {150000};
	case "muschel": {50000};
	case "radioaktiv": {150000};
	case "pils": {15000};
	case "sand": {14500};
	case "iron": {9500};
	case "copper": {8000};
	case "bleiglas": {250000};
	case "legierung": {250000};
	case "silber": {8000};
	case "cement": {6500};
	case "mair": {15000};
	case "kerosin": {70000};
	case "donator1": {99999999};
	case "bhc": {99999999};
	case "aair": {15000};
	case "admin1": {99999999};
	case "admin2": {99999999};
	case "dm": {99999999};
	case "bs": {99999999};
	case "gg": {99999999};
	case "ar": {99999999};
	case "ssg": {99999999};
	case "rh": {99999999};
	case "presse": {99999999};
	case "uran": {150000};
	case "home": {500000};
};