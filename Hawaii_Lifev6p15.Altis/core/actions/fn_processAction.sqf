#include "..\..\script_macros.hpp"
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_illegalItems"];
_illegalItems = ["turtle","palmenOl","cocain","meth","marijuana","heroin","lsd","kristalle","uranIL","coral"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR EQUAL(_type,"") OR (player distance _vendor > 10)) exitWith {};
if(vehicle player != player) exitWith {hint "Du kannst das nicht im Fahrzeug tun!";};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do {
	case "kokosm": {["kokos","kokosmilch",1000,"Gewinne Milch"]};
	case "kokosf": {["kokos","kokosfleisch",1000,"Gewinne Fruchtfleisch"]};
	case "wolle": {["uwolle","wolle",1000,"Wolle spinnen"]};
	case "reis": {["ureis","reis",1000,"Reinige Reis"]};
	case "nusse": {["unusse","nusse",1000,"Knacke Nüsse"]};
	case "kaffee": {["ukaffee","kaffee",1000,"Mahle Bohnen"]};
	case "zucker": {["zuckerr","zucker",1000,"Gewinne Zucker"]};
	case "bambus": {["bambusr","bholz",1000,"Verarbeite Bambus"]};
	case "palmenOl": {["palmenb","palmenOl",1000,"Presse Blätter"]};
	case "cocain": {["ucocain","cocain",1000,"Gewinne Kokain"]};
	case "meth": {["umeth","meth",1000,"Koche Meth"]};
	case "marihuana": {["hanf","marijuana",1000,"Verarbeite Hanf"]};
	case "heroin": {["uheroin","heroin",1000,"Gewinne Heroin"]};
	case "tabak": {["tabakr","zigaretten",1000,"Verarbeite Tabak"]};
	case "lsd": {["ulsd","lsd",1000,"Gewinne LSD"]};
	case "salz": {["salzerz","salz",1000,"Reinige Salz"]};
	case "kristalle": {["magmas","kristalle",1000,"Gewinne Kristalle"]};
	case "uranL": {["uuran","uranL",1000,"Verarbeite Uran"]};
	case "uranIL": {["uuran","uranIL",1000,"Verarbeite Uran"]};
	case "solar": {["solarr","solarp",1000,"Solarplatten Reparieren"]};
	case "turtle": {["turtle","turtleMeat",1000,"Entnehme Fleisch"]};
	case "coral": {["coral","coralP",1000,"Putze Korallen"]};
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
		[5] call life_fnc_updateEXP;
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
		[5] call life_fnc_updateEXP;
	};
	life_is_processing = false;
};	