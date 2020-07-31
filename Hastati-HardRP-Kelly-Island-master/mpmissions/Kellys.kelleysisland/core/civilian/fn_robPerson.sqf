#include "..\..\script_macros.hpp"
/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
params [
	["_robber",objNull,[objNull]]
];
if(isNull _robber) exitWith {}; //No one to return it to?

if(CASH > 0) then {
	[CASH,player,_robber] remoteExecCall ["life_fnc_robReceive",_robber];
	[getPlayerUID _robber,_robber GVAR ["realname",name _robber],"211"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	[1,"STR_NOTF_Robbed",true,[_robber GVAR ["realname",name _robber],profileName,[CASH] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	CASH = 0;
} else {
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["life_fnc_broadcast",_robber];
};

[0] call SOCK_fnc_updatePartial;
