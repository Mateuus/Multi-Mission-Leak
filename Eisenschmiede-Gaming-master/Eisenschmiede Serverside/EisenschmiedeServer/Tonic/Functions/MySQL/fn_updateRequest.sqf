/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread","_xp","_xp1","_stats","_playtime","_playtime_update"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_xp1 = [_this,7,0,[0]] call BIS_fnc_param;
_xp = [_this,8,0,[0]] call BIS_fnc_param;
_stats = [_this,9,[100,100,0],[[]]] call BIS_fnc_param;



//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};

//Parse and setup some data.
_name = [_name] call ES_fnc_mresString;
_gear = [_gear] call ES_fnc_mresArray;
_cash = [_cash] call ES_fnc_numberSafe;
_bank = [_bank] call ES_fnc_numberSafe;
_xp1 = [_xp1] call ES_fnc_numberSafe;
_xp = [_xp] call ES_fnc_numberSafe;
_stats = [_stats] call ES_fnc_mresArray;


//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call ES_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call ES_fnc_mresArray;

/*

//PLAYTIME
_playtime = [_uid] call ES_fnc_getPlayTime;
_playtime_update = [];
{
	if((_x select 0) == _uid) exitWith
	{
		_playtime_update pushBack [_x select 1];
	};
} foreach ES_fnc_playtime_values_request;
_playtime_update = (_playtime_update select 0) select 0;
switch (_side) do {
	case west: {_playtime_update set[0,_playtime];};
	case civilian: {_playtime_update set[2,_playtime];};
	case independent: {_playtime_update set[1,_playtime];};
};
_playtime_update = [_playtime_update] call ES_fnc_mresArray;

diag_log format ["_playtime_update: %1",_playtime_update];
*/

switch (_side) do {
	case west: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', xplvl_cop='%7' WHERE playerid='%6'",_name,_cash,_bank,_gear,_licenses,_uid,_xp1];};
	case civilian: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7', xplvl_civ='%8', civ_stats='%9' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,[_this select 7] call ES_fnc_bool,_xp,_stats];};
	case independent: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%6', xplvl_med='%7' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,_xp1];};
};

_queryResult = [_query,1] call ES_fnc_asyncCall;