/*
	File: fn_playerAddBank.sqf
	Author: Baney

	Description:
	Adds/Removes player to/from Memberlist for the action


	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
private["_display","_allplayers","_playersSelected","_what","_add","_where","_netIDWho"];

_what =  param [0,"",[""]];
if(_what == "") exitWith {Hint "?"};
if(_what == "add") then {
	_add = true;
} else {
	_add = false;
};
disableSerialization;

if(isnull (findDisplay 9573)) exitWith {};
_display = findDisplay 9573;

_allplayers = _display displayCtrl 1500;
_playersSelected = _display displayCtrl 1501;



if(_add) then {
	_where = lbCurSel _allplayers;
	if(_where == -1) exitWith {hint "Niemanden ausgewählt";};
	_netIDWho = _allplayers lbData _where;
	LHM_group_Bank pushback (objectFromNetId _netIDWho);
	LHM_group_Bank = LHM_group_Bank - [Objnull];
} else {
	_where = lbCurSel _playersSelected;
	if(_where == -1) exitWith {hint "Niemanden ausgewählt";};
	_netIDWho = _playersSelected lbData _where;
	LHM_group_Bank =  LHM_group_Bank - [objectFromNetId _netIDWho];
	LHM_group_Bank = LHM_group_Bank - [Objnull];
};

