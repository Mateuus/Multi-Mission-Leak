#include "..\..\script_macros.hpp"
/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit || !(_unit GVAR ["restrained",FALSE])) exitWith {}; //Error check?

_unit SVAR ["restrained",FALSE,TRUE];
_unit SVAR ["Escorting",FALSE,TRUE];
_unit SVAR ["transporting",FALSE,TRUE];
detach _unit;
player say3D "menottes";  

_playerID = getPlayerUID player;
_playerName = name player;
_onPlayerID = getPlayerUID _unit;
_onPlayerName = name _unit;
_type = 2;
[_playerID,_playerName,_onPlayerID,_onPlayerName,_type,""] remoteExecCall ["TON_fnc_copLog", (call life_fnc_HCC)];

[0,"STR_NOTF_Unrestrain",true,[_unit GVAR ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];