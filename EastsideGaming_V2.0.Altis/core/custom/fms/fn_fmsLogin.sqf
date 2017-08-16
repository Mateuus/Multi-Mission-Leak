/*
	Autor: Basti
	File: fn_fmsLogin.sqf
	
	This File was written for Eastside-Gaming.de you are not allowed to use this file!
*/
disableSerialization;
_display = findDisplay 39400;
_tree = _display displayCtrl 1500;
_data = _tree tvData (_this select 0);
if((_data isEqualTo "space") || (_data isEqualTo ""))exitWith{hint "In diese Streife kannst du dich nicht einloggen."};
if(((player getVariable ["fms",[0,"pups"]]) select 1) isEqualTo _data)exitWith{hint "Du bist schon in dieser Streife."};
player setVariable ["fms",[(_this select 0),_data],true];
if(_data isEqualTo "not") then {
  hint parsetext format ["Erfolgreich ausgeloggt!"];
} else {
  hint parsetext format ["Erfolgreich in <t font='PuristaBold'>%1</t> eingeloggt!",getText(missionConfigFile >> "CfgFMS" >> "cop" >> _data >> "name")];
};
closeDialog 0;
[]spawn ESG_fnc_fmsMain;
