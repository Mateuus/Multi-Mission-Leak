#include "..\..\script_macros.hpp"
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

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do {
	case "oil": {[[["oil_unprocessed",1]],[["oil_processed",1]],1200,( "Öl wird verarbeite")];};
	case "diamond": {[[["diamond_uncut",1]],[["diamond_cut",1]],1350,( "Diamanten werden geschliffen")];};
	case "heroin": {[[["heroin_unprocessed",1]],[["heroin_processed",1]],1750,( "Heroin wird verarbeitet")];};
	case "copper": {[[["copper_unrefined",1]],[["copper_refined",1]],750,( "Kupfer wird verarbeitet")];};
	case "iron": {[[["iron_unrefined",1]],[["iron_refined",1]],1120,( "Eisen wird verarbeitet")];};
	case "sand": {[[["sand",1]],[["glass",1]],650,( "Sand wird verarbeitet")];};
	case "salt": {[[["salt_unrefined",1]],[["salt_refined",1]],450,( "Salz wird verarbeitet")];};
	case "cocaine": {[[["cocaine_unprocessed",1]],[["cocaine_processed",1]],1500,( "Kokain wird verarbeitet")];};
	case "marijuana": {[[["cannabis",1]],[["marijuana",1]],500,( "Marihuana wird verarbeitet")];};
	case "cement": {[[["rock",1]],[["cement",1]],350,( "Zement wird gemischt")];};
	case "lsd": {[[["lsdu",1]],[["lsdp",1]],700,( "LSD wird Hergestellt")];};
	case "uran": {[[["uranu",1]],[["uranp",1]],750,( "Uran wird Hergestellt")];};
	case "coal": {[[["coalu",1]],[["coalp",1]],350,( "Kohle wird Hergestellt")];};
	case "carbon": {[[["carbonunrefined",1]],[["carbonRefined",1]],350,( "Carbon werden verarbeitet")];};
	case "holz": {[[["holzunrefined",1]],[["holzRefined",1]],350,( "Holz wird Hergestellt")];};
	case "schwarz": {[[["schwarzunrefined",1]],[["schwarzRefined",1]],350,( "Schwarzpulver wird verarbeitet")];};
	case "blei": {[[["bleiunrefined",1]],[["bleiRefined",1]],350,( "Blei wird Hergestellt")];};
	case "ExempleMultiProcess": {[[["peach",2],["cannabis",3],["cocaine_unprocessed",2]],[["diamond_cut",2],["marijuana",5]],350,( "Zement wird gemischt")];};
	default {[];};
};

//Error checking
if(EQUAL(count _itemInfo,0)) exitWith {};

//Setup vars.
_oldItem = SEL(_itemInfo,0);
_newItem = SEL(_itemInfo,1);
_cost = SEL(_itemInfo,2);
_upp = SEL(_itemInfo,3);
_exit = false;

_ArrayItem = [];
_ItemName = [];
{
	_ItemSelected = _x select 0;
	_ItemName pushBack _ItemSelected;
} forEach _oldItem;

_itemNameInv = [];
{
	_item = _x select 0;
	_var = ITEM_VARNAME(_item);
	_itemNameInv pushBack [_var];
} forEach _oldItem;

_ItemNumber = [];
{
	_itemNumberNow = _x select 1;
	_ItemNumber pushback [_itemNumberNow];
} forEach _oldItem;


_IndexNow = -1;
{
	_IndexNow = _IndexNow + 1;
	_ItemNameLife = (_itemNameInv select _IndexNow) select 0;
	_var = ITEM_VALUE2(_ItemNameLife);
	if(EQUAL(_var,0)) exitWith {
		_exit = true;
	};
	_ItemNumberLife = (_ItemNumber select _IndexNow) select 0;
	if (_var < _ItemNumberLife) exitWith {
		_exit = true;
	};
} forEach _itemNameInv;
if (_exit) exitWith {life_is_processing = false;[ "Du hast Kein item"] spawn life_fnc_nachricht;};   

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = LICENSE_VALUE(_type,"civ");
};

_oldVal = count _ItemName;

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
		sleep  0.28;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	if(player distance _vendor > 10) exitWith {[ "Du musst innerhalb von 10m bleiben, um verarbeiten zu können."] spawn life_fnc_nachricht; 5 cutText ["","PLAIN"]; life_is_processing = false;};  
	_IndexNow = -1;
	_ItemMax = [];
	{
		_IndexNow = _IndexNow + 1;
		_ItemNameLife = (_itemNameInv select _IndexNow) select 0;
		_var = ITEM_VALUE2(_ItemNameLife);
		_ItemNumberLife = (_ItemNumber select _IndexNow) select 0;
		_calcul = (floor ((_var)/(_ItemNumberLife)));
		_ItemMax pushBack _calcul;
	} forEach _itemNameInv;
	_ItemMin = _ItemMax select 0;
	{
		if (_x<_ItemMin) then {_ItemMin=_x};
	} forEach _ItemMax;
	_IndexNow = -1;
	{
		_IndexNow = _IndexNow + 1;
		_ItemNameHandle = _x select 0;
		_ItemNumberHandle = _x select 1;
		[false,_ItemNameHandle,((_ItemNumberHandle)*(_ItemMin))] call life_fnc_handleInv;
	} forEach _oldItem;
	{
		_ItemNameHandle = _x select 0;
		_ItemNumberHandle = _x select 1;
		[true,_ItemNameHandle,((_ItemNumberHandle)*(_ItemMin))] call life_fnc_handleInv;
	} forEach _newItem;
	5 cutText ["","PLAIN"];
	[ "Du hast es Erfolgreich Hergestellt"] spawn life_fnc_nachricht;
	life_is_processing = false;
} else {
	if(CASH < _cost) exitWith {[format[ "Du brauchst $%1, um ohne eine Lizenz verarbeiten zu können!",[_cost] call life_fnc_numberText]] spawn life_fnc_nachricht;; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	while{true} do {
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {[ "Du musst innerhalb von 10m bleiben, um verarbeiten zu können."] spawn life_fnc_nachricht; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(CASH < _cost) exitWith {hint format[ "Du brauchst $%1, um ohne eine Lizenz verarbeiten zu können!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	_IndexNow = -1;
	_ItemMax = [];
	{
		_IndexNow = _IndexNow + 1;
		_ItemNameLife = (_itemNameInv select _IndexNow) select 0;
		_var = ITEM_VALUE2(_ItemNameLife);
		_ItemNumberLife = (_ItemNumber select _IndexNow) select 0;
		_calcul = (floor ((_var)/(_ItemNumberLife)));
		_ItemMax pushBack _calcul;
	} forEach _itemNameInv;
	_ItemMin = _ItemMax select 0;
	{
		if (_x<_ItemMin) then {_ItemMin=_x};
	} forEach _ItemMax;
	_IndexNow = -1;
	{
		_IndexNow = _IndexNow + 1;
		_ItemNameHandle = _x select 0;
		_ItemNumberHandle = _x select 1;
		[false,_ItemNameHandle,((_ItemNumberHandle)*(_ItemMin))] call life_fnc_handleInv;
	} forEach _oldItem;
	{
		_ItemNameHandle = _x select 0;
		_ItemNumberHandle = _x select 1;
		[true,_ItemNameHandle,((_ItemNumberHandle)*(_ItemMin))] call life_fnc_handleInv;
	} forEach _newItem;
	5 cutText ["","PLAIN"];
	[ "Du hast es Erfolgreich Hergestellt"] spawn life_fnc_nachricht; 
	SUB(CASH,_cost);
	life_is_processing = false;
};
