#include "\life_server\script_macros.hpp"
/*
    File: fn_bountyFetch.sqf
    Author: !TS JORDAN
	Originally Made for: Underbelly ArmA 

    Description:
    Displays bounty list information sent from the server.
*/
private _ret = param [0,objNull,[objNull]];
if (isNull _ret) exitWith {};
_ret = owner _ret;
private _inStatement = "";
private _list = [];
private _units = [];
{
    if (side _x isEqualTo civilian) then {_units pushBack (getPlayerUID _x)};
    false
} count playableUnits;

if (count _units isEqualTo 0) exitWith {[_list] remoteExec ["life_fnc_bountyList",_ret];};

{
    if (count _units > 1) then {
        if (_inStatement isEqualTo "") then {
            _inStatement = "'" + _x + "'";
        } else {
            _inStatement = _inStatement + ", '" + _x + "'";
        };
    } else {
        _inStatement = _x;
    };
} forEach _units;

private _query = format ["SELECT bountyID, bountyName FROM bounty WHERE bountyID in (%1)",_inStatement];
private _queryResult = [_query,2,true] call DB_fnc_asyncCall;
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1",_query];
};

{
    _list pushBack _x;
    false
} count _queryResult;

if (count _list isEqualTo 0) exitWith {[_list] remoteExec ["life_fnc_bountyList",_ret];};

[_list] remoteExec ["life_fnc_bountyList",_ret];
