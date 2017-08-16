#include "..\..\script_macros.hpp"
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_oldItem3","_oldItem4","_newItem","_nItem","_process","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_oldVal3","_oldVal4","_ui","_progress","_pgText","_cP","_log"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor || EQUAL(_type,"") || (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..., nombre d'item different requi , si plus que 1 items 2, items 3, items 4"
_itemInfo = switch (_type) do {
	case "oil": {["oil_unprocessed","oil_processed",1200,(localize "STR_Process_Oil"),1];};
	case "diamond": {["diamond_uncut","diamond_cut",1350,(localize "STR_Process_Diamond"),1];};
	case "heroin": {["heroin_unprocessed","heroin_processed",1750,(localize "STR_Process_Heroin"),1];};
	case "copper": {["copper_unrefined","copper_refined",750,(localize "STR_Process_Copper"),1];};
	case "iron": {["iron_unrefined","iron_refined",1120,(localize "STR_Process_Iron"),1];};
	case "sand": {["sand","glass",650,(localize "STR_Process_Sand"),1];};
	case "salt": {["salt_unrefined","salt_refined",450,(localize "STR_Process_Salt"),1];};
	case "cocaine": {["cocaine_unprocessed","cocaine_processed",1500,(localize "STR_Process_Cocaine"),1];};
	case "crack": {["cocaine_processed","crack",1500,(localize "STR_Process_Crack"),1];};
	case "marijuana": {["cannabis","marijuana",500,(localize "STR_Process_Marijuana"),1];};
	case "cement": {["rock","cement",350,(localize "STR_Process_Cement"),1];};
	case "tabac": {["tabacf","tabac",1300,(localize "STR_Process_Tabac"),1];};
	case "papier": {["bois","feuillehumide",1300,(localize "STR_Process_FeuilleH"),1];};
	case "papiersec": {["feuillehumide","feuilleseche",1300,(localize "STR_Process_FeuilleS"),1];};
	case "fauxbillets": {["feuilleseche","argentsale",1300,(localize "STR_Process_FauxBillets"),1];};
	case "lithium": {["dechet","lithium",1300,(localize "STR_Process_Lithium"),1];};
	case "iode": {["salt_unrefined","iode",1300,(localize "STR_Process_Iode"),1];};
	case "meth": {["phosphorerouge","meth",2100,(localize "STR_Process_Meth"),4,"iode","lithium","ephedrine"];};
	default {[];};
};

//Error checking
if(EQUAL(count _itemInfo,0)) exitWith {};

//Setup vars.
_nItem = SEL(_itemInfo,4);
_oldItem = SEL(_itemInfo,0);
_newItem = SEL(_itemInfo,1);
_cost = SEL(_itemInfo,2);
_upp = SEL(_itemInfo,3);
if(_nItem != 1) then {
	switch (_nItem) do {
		case 2: { _oldItem2 = SEL(_itemInfo,5); };
		case 3: { _oldItem2 = SEL(_itemInfo,5); _oldItem3 = SEL(_itemInfo,6); };
		case 4: { _oldItem2 = SEL(_itemInfo,5); _oldItem3 = SEL(_itemInfo,6); _oldItem4 = SEL(_itemInfo,7); };
	};
};

if(_nItem == 1) then {
	if(_vendor in [cocaine_processed,heroin_processed]) then {
		_hasLicense = true;
	} else {
			_hasLicense = LICENSE_VALUE(_type,"civ");
	};
} else {
	_hasLicense = LICENSE_VALUE(_type,"civ");
};

_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
_oldVal = ITEM_VALUE(_oldItem);
if(_nItem != 1) then {
	switch (_nItem) do {
		case 2: { _oldVal2 = ITEM_VALUE(_oldItem2); };
		case 3: { _oldVal2 = ITEM_VALUE(_oldItem2); _oldVal3 = ITEM_VALUE(_oldItem3); };
		case 4: { _oldVal2 = ITEM_VALUE(_oldItem2); _oldVal3 = ITEM_VALUE(_oldItem3); _oldVal4 = ITEM_VALUE(_oldItem4); };
	};
};
if(_nItem != 1) then {
	_process = 0;
	switch (_nItem) do {
		case 2: { if(_oldVal == _oldVal2) then {_process = 1;}; };
		case 3: { if(_oldVal == _oldVal2 && _oldVal == _oldVal3) then {_process = 1;}; };
		case 4: { if(_oldVal == _oldVal2 && _oldVal == _oldVal3 && _oldVal == _oldVal4) then {_process = 1;}; };
	};
} else {_process = 1;};
_cost = _cost * _oldVal;
//Some more checks
if(EQUAL(_oldVal,0)) exitWith {};
if(_process == 0) exitWith {hint format["Tu dois avoir la même quantité d'ingrédients"];};

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
	if(_nItem != 1) then {
		switch (_nItem) do {
			case 2: { [false,_oldItem2,_oldVal2] call life_fnc_handleInv; };
			case 3: { [false,_oldItem2,_oldVal2] call life_fnc_handleInv; [false,_oldItem3,_oldVal3] call life_fnc_handleInv; };
			case 4: { [false,_oldItem2,_oldVal2] call life_fnc_handleInv; [false,_oldItem3,_oldVal3] call life_fnc_handleInv; [false,_oldItem4,_oldVal4] call life_fnc_handleInv; };
		};
	};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,localize _itemName],"PLAIN"];
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
	if(_nItem != 1) then {
		switch (_nItem) do {
			case 2: { [false,_oldItem2,_oldVal2] call life_fnc_handleInv; };
			case 3: { [false,_oldItem2,_oldVal2] call life_fnc_handleInv; [false,_oldItem3,_oldVal3] call life_fnc_handleInv; };
			case 4: { [false,_oldItem2,_oldVal2] call life_fnc_handleInv; [false,_oldItem3,_oldVal3] call life_fnc_handleInv; [false,_oldItem4,_oldVal4] call life_fnc_handleInv; };
		};
	};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,localize _itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	SUB(CASH,_cost);
	life_is_processing = false;
};
