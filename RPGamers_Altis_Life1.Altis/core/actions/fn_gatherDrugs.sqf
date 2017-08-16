#include "..\..\script_macros.hpp"

_item = [_this select 3,0,"",[""]] call BIS_fnc_param;

if (player getVariable "restrained") exitWith {[localize "STR_NOTF_isrestrained",5,"gray"] call RPG_Fnc_Msg;};
if (player getVariable "restrainedz") exitWith {[localize "STR_NOTF_isrestrained",5,"gray"] call RPG_Fnc_Msg;};
if (player getVariable "playerSurrender") exitWith {[localize "STR_NOTF_surrender",5,"gray"] call RPG_Fnc_Msg;};

if (_item in ["cannabis","heroin_unprocessed"]) exitWith { (_this select 3) spawn life_fnc_zoneGather; };
if (_item in ["froglegs"]) exitWith { (_this select 3) spawn life_fnc_lsdGather; };