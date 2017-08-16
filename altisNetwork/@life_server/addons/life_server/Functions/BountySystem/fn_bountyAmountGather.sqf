#include "\life_server\script_macros.hpp"
/*
    File: fn_bountyAmountGather.sqf
    Author: !TS JORDAN
	Originally Made for: Underbelly ArmA 

    Description: Gathers the total bounty and notif's the servers players.
*/
params [
    ["_uid","",[""]], 
	["_name", "",[""]],
	["_amount","",[""]]
];

if(_uid isEqualTo "") exitWith {};

private _query = format ["SELECT bounty FROM bounty WHERE bountyID='%1'",_uid];
private _queryResult = [_query,2] call DB_fnc_asyncCall;
_amount = call compile format ["%1",_amount];
private _amountT = _queryResult select 0;
_amountT = call compile format ["%1", _amountT];

[1,"STR_Bounty_AddP",true,[_name,[_amount] call life_fnc_numberText,[_amountT] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];