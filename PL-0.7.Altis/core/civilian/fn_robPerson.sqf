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
	//[getPlayerUID _robber,_robber GVAR ["realname",name _robber],"211"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	[1,"STR_NOTF_Robbed",true,[_robber GVAR ["realname",name _robber],profileName,[CASH] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	CASH = 0;

	_playerID = getPlayerUID _robber;
	_playerName = _robber GVAR ["realname",name _robber];
	_onPlayerID = getPlayerUID profileName;
	_onPlayerName = name profileName;
	_amount = [CASH] call life_fnc_numberText;
	_type = 5;
	[_playerID,_playerName,_onPlayerID,_onPlayerName,_type,_amount] remoteExecCall ["TON_fnc_actionLog", (call life_fnc_HCC)];
	
} else {
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["life_fnc_broadcast",_robber];
};

[0] call SOCK_fnc_updatePartial;
