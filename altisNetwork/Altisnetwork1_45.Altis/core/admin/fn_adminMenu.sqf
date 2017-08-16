#include "..\..\script_macros.hpp"
/*
    File: fn_adminMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the admin menu and hides buttons based on life_adminlevel.
*/

//if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
private["_display","_list","_side","_godmode","_markers"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_list = CONTROL(2900,2902);
_playerID = getPlayerUID player;


//if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
switch (FETCH_CONST(life_adminlevel)) do
{
    case 1: {ctrlShow [2904,false];ctrlShow [2905,false];ctrlShow [2906,false];ctrlShow [2907,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];};
    case 2: {ctrlShow [2905,false];ctrlShow [2906,false];ctrlShow [2907,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];};
    case 3: {ctrlShow [2907,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];};
    case 4: {ctrlShow [2911,false];};
};

//-- Dev Admin
if ((_playerID) in ["76561198004899973"]) then {
    /*
    ctrlShow [2904,true];//-- Comp
    ctrlShow [2905,true];//-- Spectate
    ctrlShow [2906,true];//-- Teleport
    ctrlShow [2907,true];//-- Fog
    ctrlShow [2908,true];//-- God
    ctrlShow [2909,true];//-- Freeze
    ctrlShow [2910,true];//-- Markers
    */
    ctrlShow [2911,true];//-- Debug
};

/*
if(FETCH_CONST(life_adminlevel) == 0) then 
{
    if((getPlayerUID player) in ["76561198004899973"]) then 
    {
        case 1: {ctrlShow [2904,true];ctrlShow [2905,true];ctrlShow [2906,true];ctrlShow [2907,true];ctrlShow [2908,true];ctrlShow [2909,true];ctrlShow [2910,true];ctrlShow [2911,true];};
        case 2: {ctrlShow [2905,true];ctrlShow [2906,true];ctrlShow [2907,true];ctrlShow [2908,true];ctrlShow [2909,true];ctrlShow [2910,true];ctrlShow [2911,true];};
        case 3: {ctrlShow [2907,true];ctrlShow [2908,true];ctrlShow [2909,true];ctrlShow [2910,true];ctrlShow [2911,true];};
        case 4: {ctrlShow [2911,true];};
    };
};
*/
//Purge List
lbClear _list;

{
    _side = switch (side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
    _list lbAdd format["%1 - %2", _x getVariable ["realname",name _x],_side];
    _list lbSetdata [(lbSize _list)-1,str(_x)];
} forEach playableUnits;
//if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

if (life_god) then {
    _godmode = CONTROL(2900,2908);
    _godmode ctrlSetTextColor [0, 255, 0, 1];    // green
};
if (life_markers) then {
    _markers = CONTROL(2900,2910);
    _markers ctrlSetTextColor [0, 255, 0, 1];    // green
};