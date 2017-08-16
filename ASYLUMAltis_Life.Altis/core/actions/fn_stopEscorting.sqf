/*
	File: fn_stopEscorting.sqf

	Description:
	ASFSDFHAGFASF
*/
private["_escortee"];

_escortee = player getVariable ["currentlyEscorting", objNull];
if(isNull _escortee) then {
	_escortee = cursorTarget;
};

if(isNull _escortee) exitWith {}; //Not valid
if(!(_escortee getVariable ["Escorting",false])) exitWith {}; //He's not being Escorted.
_escortee setVariable["Escorting",nil,true];
detach _escortee;
player setVariable["currentlyEscorting",nil];
// [[45, player, format["Stopped escorting %1", name _escortee]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;

if(playerSide == civilian) then 
{
	[[],life_fnc_escortCheck, _escortee, false] call BIS_fnc_MP;
};