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
[localize "STR_NOTF_Searching",true,"slow"] call life_fnc_notificationSystem;
sleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {[localize "STR_NOTF_CannotSearchPerson",true,"slow"] call life_fnc_notificationSystem;};
[] remoteExecCall ["life_fnc_removeWeaponAction",_unit];
[player] remoteExec ["life_fnc_searchClient",_unit];
life_action_inUse = true;