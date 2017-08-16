// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_unit", "_time", "_count"];

_unit = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param;
_time = [ _this, 1, -1,            [0] ] call BIS_fnc_param;

if( isNull _unit || { _unit != player } || { XY_isArrested } || { !(alive player) } ) exitWith {};

player setVariable["restrained", false, true];
player setVariable["escorting", false, true];
player setVariable["transporting", false, true];

player setPos (getMarkerPos "jail_marker");

[0] call XY_fnc_removeLicenses;

// Remove all illegal stuff...
{
    if( _x select 5 ) then {
        _count = missionNamespace getVariable [ _x select 6, 0];
        if(_count > 0) then {
            [false, _x select 0, _count] call XY_fnc_handleInv;
        };
    };
} forEach XY_virtItems;

XY_isArrested = true;

removeAllWeapons player;
{
    player removeMagazine _x
} forEach (magazines player);

[2] call XY_fnc_updatePartial;

[player, _time] remoteExec ["XYDB_fnc_requestJailTime", 2];