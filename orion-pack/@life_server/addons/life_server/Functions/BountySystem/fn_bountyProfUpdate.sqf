#include "\life_server\script_macros.hpp"
/*
    File: fn_bountyProfUpdate.sqf
    Author: [midgetgrimm]
    Edited by: !TS JORDAN
	Originally Made for: Underbelly ArmA 
    Description:
    Updates name of player if they change profiles
*/
private ["_query","_tickTime","_wantedCheck","_wantedQuery"];
params [
    ["_uid","",[""]],
    ["_name","",[""]]
];

//Bad data check
if (_uid isEqualTo "" ||  {_name isEqualTo ""}) exitWith {};

_wantedCheck = format ["SELECT bountyName FROM bounty WHERE bountyID='%1'",_uid];
_wantedQuery = [_wantedCheck,2] call DB_fnc_asyncCall;
if (count _wantedQuery isEqualTo 0) exitWith {};

if (_name != (_wantedQuery select 0)) then {
    _query = format ["UPDATE bounty SET bountyName='%1' WHERE bountyID='%2'",_name,_uid];
    [_query,2] call DB_fnc_asyncCall;
};