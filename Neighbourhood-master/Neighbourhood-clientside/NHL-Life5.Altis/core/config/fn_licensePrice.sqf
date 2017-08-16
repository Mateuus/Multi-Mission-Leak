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
    //Führerscheine
	case "driver": {5000}; //Drivers License cost
	case "truck": {35000}; //Truck license cost
	case "pilot": {70000}; //Pilot/air license cost
	case "boat": {20000}; //Boating license cost
	case "gun": {40000}; //Firearm/gun license cost
	case "dive": {3500}; //Diving license cost
	case "home": {500000}; //Eigentümer Lizenz
	case "cair": {15000};
	case "cair2": {15000};	//Cop Pilot License cost
	case "mrsf_cop": {150000};	//Cop Pilot License cost
	case "mair": {15000}; //Medic Pilot License cost
	case "cg": {15000}; //Coast guard license cost
	case "swat": {50000}; //Swat License cost
	case "adf": {10}; // A.D.F
	case "aufenthalt": {500}; //Aufenthaltsgenehmigungs
	case "arbeitsgenehmigung": {500}; //Arbeitsgenehmigung
	case "luftfracht": {75000}; //Luftfracht Lizenz
	case "fracht": {25000}; //Fracht Lizenz
	case "dutyfree" : {10000}; // Duty Free Lizenz
	case "muell" : {5000}; //Muellsortier Lizenz
	
	//Legale Lizenzen
	case "arch": {5000}; //Archäologieschein
	case "diamond": {30000}; //Diamond processing license cost
	case "iron": {30000}; //Iron processing license cost
	case "oil": {30000}; //Oil processing license cost
	case "salt": {30000};
	case "sand": {30000};
	case "copper": {30000};
	case "cement": {30000};
	case "silber" : {30000};
	case "wein" : {20000};
	case "zigaretten" : {30000};
	case "gold" : {30000};
	case "sschmuck" : {30000};
	case "gschmuck" : {30000};
	case "stahl": {30000};
	case "plastik": {30000};
	
	//Illegale Lizenzen
	case "heroin": {150000}; //Heroin processing license cost
	case "marijuana": {150000}; //Marijuana processing license cost
	case "cocaine": {150000};
	case "sense": {250000};
	case "meth": {150000};
	case "lsd" : {150000};
	case "zigarren" : {150000};
	case "sprengstoff" : {170000};
	case "gang": {75000}; //Gang license cost
	case "rebel": {800000}; //Rebel license cost
	case "bm": {200000}; //schwarzmarkt
	
	
	//firmen
	case "whinc": {100}; //Warehouse Inc.

};