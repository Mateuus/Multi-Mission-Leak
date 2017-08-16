/*
	File: fn_admin_wlist.sqf
	Author: Barney

	Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.

	Description:
	Bibidi babidi boooooo
*/


disableSerialization;

private ["_display","_listbox","_combo","_failed","_num","_faction","_query","_log"];
_display = findDisplay 5888;
_listbox = _display displayCtrl 1500;
_combo = _display displayCtrl 2100;
_failed = true;

_num = ctrlText 1400;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};

if(lbcursel _listbox == -1) exitWith {hint "Nichts ausgewählt"};
if(lbcursel _combo == -1) exitWith {hint "Nichts ausgewählt"};


_uid = _listbox lbData (lbcursel _listbox);
_faction = _combo lbData (lbcursel _combo);

if(_faction == "") exitWith {hint "Keine Fraktion ausgewählt";};


if(_faction == "coplevel") then {

	if(!(_num in ["0","1","2","3","4","5","6","7","8","9","10"])) exitWith {};
	_query = format ["UPDATE players SET coplevel = '%1' WHERE playerid='%2'",_num,_uid];
	_log = format ["%1 hat %2 auf %3 lvl %4 gesetzt",name player,getPlayerUID player, _faction, _num];
	_failed = false;
};


if(_faction == "mediclevel") then {

	if(!(_num in ["0","1","2","3","4","5"])) exitWith {};
	_query = format ["UPDATE players SET mediclevel = '%1' WHERE playerid='%2'",_num,_uid];
	_log = format ["%1 hat %2 auf %3 lvl %4 gesetzt",name player,getPlayerUID player, _faction, _num];
	_failed = false;
};


if(_faction == "seclevel") then {

	if(!(_num in ["0","1","2","3","4","5"])) exitWith {};
	_query = format ["UPDATE players SET seclevel = '%1' WHERE playerid='%2'",_num,_uid];
	_log = format ["%1 hat %2 auf %3 lvl %4 gesetzt",name player,getPlayerUID player, _faction, _num];
	_failed = false;
};

if(_failed) exitWith {hint format["Bei dieser Fraktion gibt es kein Level %1, Trottel....",_num];};




[["admin",_log],"TON_fnc_externLog",false,false] call lhm_fnc_mp;
[[_query,player], "lhm_fnc_wlist", false, false] call lhm_fnc_mp;
