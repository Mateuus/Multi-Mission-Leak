#include "..\..\script_macros.hpp"
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/

private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_itemNameo1","_itemNameo2","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error1","_error2","_min","_license","_illegalItems"];
_illegalItems = ["palmenOl","meth","marijuana","kristalle","uranIL","coral"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR EQUAL(_type,"") OR (player distance _vendor > 10)) exitWith {};
_error1 = false; 
_error2 = false;

_itemInfo = switch (_type) do {

	// Simple Processus
	case "kokosm": {["kokos","kokosmilch",1000,"Gewinne Milch",false]};
	case "kokosf": {["kokos","kokosfleisch",1000,"Gewinne Fruchtfleisch",false]};
	case "kaffee": {["ukaffee","kaffee",1000,"Mahle Bohnen",false]};
	case "zucker": {["zuckerr","zucker",1000,"Gewinne Zucker",false]};
	case "palmenOl": {["palmenb","palmenOl",1000,"Presse Blätter",false]};
	case "meth": {["umeth","meth",1000,"Koche Meth",false]};
	case "marihuana": {["hanf","marijuana",1000,"Verarbeite Hanf",false]};
	case "tabak": {["tabakr","zigaretten",1000,"Verarbeite Tabak",false]};
	case "kristalle": {["magmas","kristalle",1000,"Gewinne Kristalle",false]};
	case "uranIL": {["uuran","uranIL",1000,"Verarbeite Uran",false]};
	case "coral": {["coral","coralP",1000,"Putze Korallen",false]};
	case "copper": {["copperr","copper",1000,"Kupfererz wird gefiltert",false]};
	
	// Multi
	case "steel": {["iron","steel",1500,"Schmelze Eisen",true,"coal"];};
	case "drake": {["banane","drakecocktail",1500,"Mische Cocktail",true,"drakefruit"];};
	default {[];};
};

//Error checking
if(EQUAL(count _itemInfo,0)) exitWith {};

//Setup vars.
_oldItem = SEL(_itemInfo,0);
_newItem = SEL(_itemInfo,1);
_cost = SEL(_itemInfo,2);
_upp = SEL(_itemInfo,3);
_2var = SEL(_itemInfo,4);
if(_2var) then {_oldItem2 = SEL(_itemInfo,5);};


_hasLicense = LICENSE_VALUE(_type,"civ");

_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
_itemNameo1 = M_CONFIG(getText,"VirtualItems",_oldItem,"displayName");
_oldVal = ITEM_VALUE(_oldItem);
_min = _oldVal;

//2vars
if(_2var) then { _oldVal2 = ITEM_VALUE(_oldItem2);}; 

if(_2var) then {
	if(_oldVal != _oldVal2) then {_error1 = true;} else {_min = _oldVal};
	_itemNameo2 = M_CONFIG(getText,"VirtualItems",_oldItem2,"displayName");
};

if(_error1) exitWith{hint "Bitte benutzen Sie den gleichen Betrag für die beiden Einzelteile !"};

_cost = _cost * _min;
//Some more checks
if(EQUAL(_oldVal,0)) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then {
	while{true} do {
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_min] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};	
	
	//2vars			
	if(_2var) then {
		[false,_oldItem2,_min] call life_fnc_handleInv;
		5 cutText ["","PLAIN"];
		titleText[format[localize "STR_Process_Processed3",localize _itemNameo1,localize _itemNameo2,localize _itemName],"PLAIN"];
	
	} else 
	{	
	
		5 cutText ["","PLAIN"];
		titleText[format[localize "STR_Process_Processed",localize _itemNameo1,localize _itemName],"PLAIN"];
	};
	
	if(_type in _illegalItems) then {
		[10] call life_fnc_updateEXP;
	} else {
		[7] call life_fnc_updateEXP;
	};
	
	if(!([true,_newItem,_min] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_min] call life_fnc_handleInv; life_is_processing = false;};
	
	life_is_processing = false;
	
	} else 
	{

	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do {
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_min] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	//2vars
	if(_2var) then {
		[false,_oldItem2,_min] call life_fnc_handleInv;
		5 cutText ["","PLAIN"];
		titleText[format[localize "STR_Process_Processed4",localize _itemNameo1,localize _itemNameo2,localize _itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	} else 
	{
	
		5 cutText ["","PLAIN"];
		titleText[format[localize "STR_Process_Processed2",localize _itemNameo1,localize _itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	
	};
	
	if(!([true,_newItem,_min] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_min] call life_fnc_handleInv; life_is_processing = false;};
	
	SUB(CASH,_cost);
	
	
	if(_type in _illegalItems) then {
		[10] call life_fnc_updateEXP;
	} else {
		[7] call life_fnc_updateEXP;
	};
	life_is_processing = false;
};

/*
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_illegalItems"];
_illegalItems = ["turtle","palmenOl","cocain","meth","marijuana","heroin","lsd","kristalle","uranIL","coral"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR EQUAL(_type,"") OR (player distance _vendor > 10)) exitWith {};
if(vehicle player != player) exitWith {hint "Du kannst das nicht im Fahrzeug tun!";};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do {
	case "kokosm": {["kokos","kokosmilch",1000,"Gewinne Milch",false]};
	case "kokosf": {["kokos","kokosfleisch",1000,"Gewinne Fruchtfleisch",false]};
	case "wolle": {["uwolle","wolle",1000,"Wolle spinnen",false]};
	case "reis": {["ureis","reis",1000,"Reinige Reis",false]};
	case "nusse": {["unusse","nusse",1000,"Knacke Nüsse",false]};
	case "kaffee": {["ukaffee","kaffee",1000,"Mahle Bohnen",false]};
	case "zucker": {["zuckerr","zucker",1000,"Gewinne Zucker",false]};
	case "bambus": {["bambusr","bholz",1000,"Verarbeite Bambus",false]};
	case "palmenOl": {["palmenb","palmenOl",1000,"Presse Blätter",false]};
	case "cocain": {["ucocain","cocain",1000,"Gewinne Kokain",false]};
	case "meth": {["umeth","meth",1000,"Koche Meth",false]};
	case "marihuana": {["hanf","marijuana",1000,"Verarbeite Hanf",false]};
	case "heroin": {["uheroin","heroin",1000,"Gewinne Heroin",false]};
	case "tabak": {["tabakr","zigaretten",1000,"Verarbeite Tabak",false]};
	case "lsd": {["ulsd","lsd",1000,"Gewinne LSD",false]};
	case "salz": {["salzerz","salz",1000,"Reinige Salz",false]};
	case "kristalle": {["magmas","kristalle",1000,"Gewinne Kristalle",false]};
	case "uranL": {["uuran","uranL",1000,"Verarbeite Uran",false]};
	case "uranIL": {["uuran","uranIL",1000,"Verarbeite Uran",false]};
	case "solar": {["solarr","solarp",1000,"Solarplatten Reparieren",false]};
	case "turtle": {["turtle","turtleMeat",1000,"Entnehme Fleisch",false]};
	case "coral": {["coral","coralP",1000,"Putze Korallen",false]};
	default {[];};
};

//Error checking
if(EQUAL(count _itemInfo,0)) exitWith {};

//Setup vars.
_oldItem = SEL(_itemInfo,0);
_newItem = SEL(_itemInfo,1);
_cost = SEL(_itemInfo,2);
_upp = SEL(_itemInfo,3);

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = LICENSE_VALUE(_type,"civ");
};

_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
_oldVal = ITEM_VALUE(_oldItem);

_cost = _cost * _oldVal;
//Some more checks
if(EQUAL(_oldVal,0)) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then {
	while{true} do {
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,localize _itemName],"PLAIN"];
	
	if(_type in _illegalItems) then {
		[10] call life_fnc_updateEXP;
	} else {
		[7] call life_fnc_updateEXP;
	};
	life_is_processing = false;
} else {
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do {
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,localize _itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	SUB(CASH,_cost);
	
	if(_type in _illegalItems) then {
		[10] call life_fnc_updateEXP;
	} else {
		[7] call life_fnc_updateEXP;
	};
	life_is_processing = false;
};
*/