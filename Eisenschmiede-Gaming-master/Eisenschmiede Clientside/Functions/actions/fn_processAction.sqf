#include "..\script_macros.hpp"
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR EQUAL(_type,"") OR (player distance _vendor > 10)) exitWith {};

_xpLvl = 1;
_bonus = ["oil","diamond","copper","iron","sand","salt","cement","uran","beer"];
if(_type in _bonus && ES_xp_lvl >= 8) then {_xpLvl = 0.90;};
if(_type in _bonus && ES_xp_lvl >= 14) then {_xpLvl = 0.80;};
if(_type in _bonus && ES_xp_lvl >= 25) then {_xpLvl = 0.70;};
if(_type in _bonus && ES_xp_lvl >= 32) then {_xpLvl = 0.60;};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do {
	case "oil": {["oil_unprocessed","oil_processed",1200,(localize "STR_Process_Oil")];};
	case "diamond": {["diamond_uncut","diamond_cut",1350,(localize "STR_Process_Diamond")];};
	case "heroin": {["heroin_unprocessed","heroin_processed",1750,(localize "STR_Process_Heroin")];};
	case "copper": {["copper_unrefined","copper_refined",750,(localize "STR_Process_Copper")];};
	case "iron": {["iron_unrefined","iron_refined",1120,(localize "STR_Process_Iron")];};
	case "sand": {["sand","glass",650,(localize "STR_Process_Sand")];};
	case "salt": {["salt_unrefined","salt_refined",450,(localize "STR_Process_Salt")];};
	case "cocaine": {["cocaine_unprocessed","cocaine_processed",1500,(localize "STR_Process_Cocaine")];};
	case "marijuana": {["cannabis","marijuana",500,(localize "STR_Process_Marijuana")];};
	case "cement": {["rock","cement",350,(localize "STR_Process_Cement")];};
	
	case "pilze": {["pilze_unrefined","pilze_refined",350,(localize "STR_Process_Pilze")];};
	case "meth": {["meth_unrefined","meth_refined",350,(localize "STR_Process_meth")];};
	case "speed": {["speed_unrefined","speed_refined",350,(localize "STR_Process_speed")];};	
	case "illmed": {["illmed_unrefined","illmed_refined",350,(localize "STR_Process_illmed")];};
	case "schwarz": {["schwarz_unrefined","schwarz_refined",350,(localize "STR_Process_schwarz")];};
	case "kohle": {["kohle_unrefined","kohle_refined",350,(localize "STR_Process_kohle")];};	
	case "wein": {["wein_unrefined","wein_refined",350,(localize "STR_Process_wein")];};
	case "safter": {["apple","apfels",150,(localize "STR_Process_apfels")];};
	case "peachs": {["peach","peachs",150,(localize "STR_Process_peachs")];};
	
	case "holz": {["holz_unrefined","holz_refined",350,(localize "STR_Process_holz")];};
	case "eisen": {["eisen_unrefined","eisen_refined",350,(localize "STR_Process_eisen")];};
	
	case "uran": {["uran_unrefined","uran_refined",0,(localize "STR_Process_uran")];};
	case "uran1": {["uran_refined","uran1_refined",0,(localize "STR_Process_uran1")];};
	case "uran2": {["uran1_refined","uran2_refined",0,(localize "STR_Process_uran2")];};
	
	case "mash": {["water","mash",100,(localize "STR_Process_Mash")];};
	case "whiskey": {["yeast","whiskey",1000,(localize "STR_Process_Whiskey")];};
	case "beer": {["yeast","beerp",1500,(localize "STR_Process_Beer")];};
	case "moonshine": {["yeast","moonshine",250,(localize "STR_Process_Moonshine")];};
	case "bottledshine": {["moonshine","bottledshine",500,(localize "STR_Process_BottledShine")];};
	case "bottledbeer": {["beerp","bottledbeer",500,(localize "STR_Process_BottledBeer")];};
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,(localize "STR_Process_BottleWhiskey")];};
	
	case "zucker": {["zuckeru","zuckerp",250,(localize "STR_Process_refined")];};
	case "kakao": {["kakaou","kakaop",500,(localize "STR_Process_kakaopr")];};
	case "oliven": {["olivenu","olivenp",500,(localize "STR_Process_olivenp")];};

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
5 cutRsc ["ES_progress","PLAIN"];
_ui = uiNamespace getVariable "ES_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

ES_is_processing = true;

if(_hasLicense) then {
	while{true} do {
		sleep (0.3*_xpLvl);
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; ES_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call ES_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; ES_is_processing = false;};
	if(!([true,_newItem,_oldVal] call ES_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call ES_fnc_handleInv; ES_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,localize _itemName],"PLAIN"];
	ES_is_processing = false;
} else {
	if(ES_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call ES_fnc_numberText]; 5 cutText ["","PLAIN"]; ES_is_processing = false;};
	
	while{true} do {
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; ES_is_processing = false;};
	if(ES_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call ES_fnc_numberText]; 5 cutText ["","PLAIN"]; ES_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call ES_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; ES_is_processing = false;};
	if(!([true,_newItem,_oldVal] call ES_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call ES_fnc_handleInv; ES_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,localize _itemName,[_cost] call ES_fnc_numberText],"PLAIN"];
	ES_cash = ES_cash - _cost;
	ES_is_processing = false;
};	