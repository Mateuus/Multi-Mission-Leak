#include "\life_server\script_macros.hpp"
/*
    File: fn_bountyCrimes.sqf
    Author: !TS JORDAN
	Originally Made for: Underbelly ArmA 

    Description:
    Grabs the bounty amount for the selected player.
*/
disableSerialization;

params [
    ["_ret",objNull,[objNull]],
    ["_criminal",[],[]]
];

private _query = format ["SELECT bounty FROM bounty WHERE bountyID='%1'",_criminal select 0];
private _queryResult = [_query,2] call DB_fnc_asyncCall;

_ret = owner _ret;

[_queryResult] remoteExec ["life_fnc_bountyInfo",_ret];
