/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
params [
	["_cash",0,[0]],
	["_victim",objNull,[objNull]],
	["_robber",objNull,[objNull]]
];
if(_robber isEqualTo _victim) exitWith {};;
if(_cash isEqualTo 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

if("robbery" in AN_Skills) then {
[(_cash * 1.2),0,0] call life_fnc_sewawruk;
} else {
[_cash,0,0] call life_fnc_sewawruk;
};
titleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_rupadudejat],"PLAIN"];
