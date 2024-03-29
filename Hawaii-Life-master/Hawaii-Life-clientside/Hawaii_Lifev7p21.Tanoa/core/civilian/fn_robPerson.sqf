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
	if (life_HC_isActive) then {
		[CASH,player,_robber] remoteExecCall ["life_fnc_robReceive",_robber];
		[getPlayerUID _robber,_robber GVAR ["realname",name _robber],"211"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
		[1,"STR_NOTF_Robbed",true,[_robber GVAR ["realname",name _robber],profileName,[CASH] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[player, _robber, CASH, 4, BANK, CASH] remoteExecCall ["HC_fnc_handleDBLog",HC_Life];
		CASH = 0;
    } else {
		[CASH,player,_robber] remoteExecCall ["life_fnc_robReceive",_robber];
		[getPlayerUID _robber,_robber GVAR ["realname",name _robber],"211"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		[1,"STR_NOTF_Robbed",true,[_robber GVAR ["realname",name _robber],profileName,[CASH] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[player, _robber, CASH, 4, BANK, CASH] remoteExecCall ["TON_fnc_handleDBLog",RSERV];
		CASH = 0;
    };
} else {
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["life_fnc_broadcast",_robber];
};

[0] call SOCK_fnc_updatePartial;
