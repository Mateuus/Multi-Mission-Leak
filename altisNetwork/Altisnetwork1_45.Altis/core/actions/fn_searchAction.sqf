/*
    File: fn_searchAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the searching process.
*/
params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};
[localize "STR_NOTF_PSearching",false,"fast"] call life_fnc_notification_system;
player say3D "Patdown";
sleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {
    [localize "STR_NOTF_CannotSearchPerson",true,"fast"] call life_fnc_notification_system;
    };
[player] remoteExec ["life_fnc_searchClient",_unit];
life_action_inUse = true;