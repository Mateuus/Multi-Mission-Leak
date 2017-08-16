#include "..\..\script_macros.hpp"

params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};
sleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {["Cannot search that person.",5,"gray"] call RPG_Fnc_Msg;};

["Patting Down...",5,"blue"] call RPG_Fnc_Msg;

[player] remoteExec ["life_fnc_removeWeapons",_unit];

life_action_inUse = false;