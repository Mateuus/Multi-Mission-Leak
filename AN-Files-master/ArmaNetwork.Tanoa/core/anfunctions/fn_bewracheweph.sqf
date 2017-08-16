/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_unit"];
_unit = cursorObject;
if(isNull _unit) exitWith {};
if(isNil "_unit") exitWith {};
if(_unit getVariable "restrained") exitWith
{
	hint "They're already ziptied";
};
if(_unit distance player > 4) exitWith
{
	hintSilent "Must be closer and incapacitated";
	["ziptie",1] call life_fnc_virtualItemAdd;
};
if(player isEqualTo _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
_unit setVariable["restrained",true,true];
_unit setVariable["restrainedtype","civ",true];
[player] remoteExecCall ["life_fnc_zipTied",_unit];
