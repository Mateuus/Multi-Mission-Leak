#include <macro.h>

/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_level","_cpRate","_exp"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
_legal = ["oil","diamond","copper","iron","sand","salt","cement","wood","wool","diesel","jet","gas"];
//Error check
if(isNull _vendor OR EQUAL(_type,"") OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do {
	case "oil": {["oil_unprocessed","oil_processed",1200,(localize "STR_Process_Oil"),200,0];};
	case "diesel": {["oil_unprocessed","oil_diesel",1500,(localize "STR_Process_Diesel"),200,0];};
	case "jet": {["oil_unprocessed","oil_jet",5200,(localize "STR_Process_Jet"),200,0];};
	case "heavy": {["oil_unprocessed","oil_heavy",4200,(localize "STR_Process_Heavy"),200,0];};
	case "gas": {["gas_unprocessed","gas_processed",2200,(localize "STR_Process_Oil"),200,0];};
	case "diamond": {["diamond_uncut","diamond_cut",1350,(localize "STR_Process_Diamond"),200,0];};
	case "heroin": {["heroin_unprocessed","heroin_processed",1750,(localize "STR_Process_Heroin"),200,0];};
	case "copper": {["copper_unrefined","copper_refined",750,(localize "STR_Process_Copper"),200,0];};
	case "iron": {["iron_unrefined","iron_refined",1120,(localize "STR_Process_Iron"),200,0];};
	case "sand": {["sand","glass",650,(localize "STR_Process_Sand"),200,0];};
	case "salt": {["salt_unrefined","salt_refined",450,(localize "STR_Process_Salt"),200,0];};
	case "cocaine": {["cocaine_unprocessed","cocaine_processed",1500,(localize "STR_Process_Cocaine"),200,0];};
	case "marijuana": {["cannabis","marijuana",500,(localize "STR_Process_Marijuana"),200,0];};
	case "cement": {["rock","cement",350,(localize "STR_Process_Cement"),200,0];};
	case "wood": {["wood","lumber",350,(localize "STR_Process_Wood"),200,0];};
	case "hashish": {["marijuana","hashish",2750,(localize "STR_Process_Hashish"),200,0];};
	case "morphine": {["heroin_processed","morphine",3750,(localize "STR_Process_Morphine"),200,0];};
	case "krokodil": {["morphine","krokodil",4750,(localize "STR_Process_Krokodil"),200,0];};
	case "wool": {["wool","fabric",550,(localize "STR_Process_Wool"),200,0];};
	case "meth": {["meth_unprocessed","meth_processed",1550,(localize "STR_Process_Meth"),200,0];};
	default {[];};
};

//Error checking
if(EQUAL(count _itemInfo,0)) exitWith {};

//Setup vars.
_oldItem = SEL(_itemInfo,0);
_newItem = SEL(_itemInfo,1);
_cost = SEL(_itemInfo,2);
_upp = SEL(_itemInfo,3);
_exp = SEL(_itemInfo,4);
_level = SEL(_itemInfo,5);
if(LEVEL < _level) exitWith {hintSilent format["You have to be level %1 to process %2",_level,_newItem]};

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = LICENSE_VALUE(_type,"civ");
};
//for oil stuff
if (_type in ["diesel","jet","heavy", "gas"]) then {
	_hasLicense = LICENSE_VALUE("oil","civ");
};
//i dont want to make a license for this/these
if (_type in ["wood"]) then {
	_hasLicense = true;
};

_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
_oldVal = ITEM_VALUE(_oldItem);

_cost = _cost * _oldVal;
//Some more checks
if(EQUAL(_oldVal,0)) exitWith {};

//Setup our progress bar.'
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.01;

life_is_processing = true;

if(skill_civ_processing && _type in _legal) then {_cpRate = 0.06};
//_toSpawn = "test_EmptyObjectForSmoke" createVehicle position player;
if(_hasLicense) then {
	while{true} do {
		sleep  0.3;
		_cP = _cP + _cpRate;
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
	life_is_processing = false;
	_exp = round(random(_exp));
	_exp = _oldVal * _exp;
	[true,_exp] spawn life_fnc_expConfig;
} else {
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	while{true} do {
		sleep  0.9;
		_cP = _cP + _cpRate;
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
	life_is_processing = false;
	_exp = round(random(_exp));
	_exp = _oldVal * _exp;
	[true,_exp] spawn life_fnc_expConfig;
};
//deleteVehicle _toSpawn;
