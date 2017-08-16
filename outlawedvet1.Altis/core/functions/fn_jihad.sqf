/*#include "..\..\script_macros.hpp"
/*
    File: fn_jihad.sqf
    Author: Credits to Yolo Joe for Original Script / Fixed by @Heavy_Bob and @Liam0.
    Special thanks to @NiiRoZz and @tkcjesse for additional input.
    Description:
    A suicide vest. Yes this is a bomb. Handle with caution.

private["_unit","_bomb"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
// checks
if(player distance (getMarkerPos "campnorth") < 175) exitWith {};
if(player distance (getMarkerPos "reb_spawn_1") < 175) exitWith {};
if(player distance (getMarkerPos "Donator_Zone") < 175) exitWith {};
if(player distance (getMarkerPos "army_spawn") < 150) exitWith {};
if(player distance (getMarkerPos "spawn_island") < 150) exitWith {};
if(player distance (getMarkerPos "jail_marker") < 30) exitWith {};
if(isNil "_unit" || isNull _unit || !isPlayer _unit || life_isknocked || life_istazed || (vehicle _unit != _unit) || !alive _unit || (_unit getVariable ["restrained",false])) exitWith {};
if(vest _unit != "V_HarnessOGL_gry") exitWith {hint "You aren't wearing a suicide vest.";}; // Need add to localize but Jawshy i think do commit inside stringtable
//if (player distance (getmarkerpos "sz_1") < 70 OR player distance (getmarkerpos "sz_2") < 200 OR player distance (getmarkerpos "sz_3") < 500 OR player distance (getmarkerpos "civ_terminal_2") < 250) exitWith {hint "Some supernatural force prevents you from detonating a bomb in this holy place!"};
// Bomb
removeVest player;
_bomb = "Bomb_04_F";
_bomb createVehicle (ASLtoATL (getPosASL player));
Uisleep 0.5;
player setDamage 1;
*/