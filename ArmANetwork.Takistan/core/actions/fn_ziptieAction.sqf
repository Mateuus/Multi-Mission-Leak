/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

_unit setVariable["restrained",true,true];
_unit setVariable["restrainedtype","civ",true];
[player] remoteExec ["life_fnc_ziptie",_unit];
//[getPlayerUID player,player getVariable["realname",profileName],"207"] remoteExecCall ["life_fnc_wantedAdd",2];
hintSilent "You have been added to the wanted list for kidnapping";
[0,format[localize "STR_NOTF_Ziptied",_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
