#include "..\..\script_macros.hpp"
/*
    File: fn_adminMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the admin menu and hides buttons based on life_adminlevel.
*/
private["_display","_list","_side","_picture"];
if (FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0;};

waitUntil {!isNull (findDisplay 2900)};
disableSerialization;
_list = CONTROL(2900,2902);
if (FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0;};

switch (FETCH_CONST(life_adminlevel)) do
{
    case 1: {ctrlShow [2911,false];ctrlShow [2905,false];ctrlShow [2904,false];ctrlShow [2923,false];ctrlShow [2908,false];ctrlShow [2912,false];ctrlShow [2907,false];ctrlShow [2906,false];ctrlShow [2920,false];ctrlShow [2921,false];ctrlShow [2922,false];ctrlShow [2924,false];};
    case 2: {ctrlShow [2911,false];ctrlShow [2905,false];ctrlShow [2904,false];ctrlShow [2923,false];ctrlShow [2908,false];ctrlShow [2912,false];ctrlShow [2907,false];ctrlShow [2906,false];};
    case 3: {ctrlShow [2911,false];ctrlShow [2905,false];ctrlShow [2904,false];ctrlShow [2923,false];ctrlShow [2907,false];ctrlShow [2912,false];};
    case 4: {ctrlShow [2911,false];};
	case 5: {};
};
	
//Purge List
lbClear _list;

{
    _side = switch (side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_picture = switch((_x getVariable "adminrank")) do {
													case 1: {"textures\playertags\member.paa"};
													case 2: {"textures\playertags\member.paa"};
													case 3: {"textures\playertags\member.paa"};
													case 4: {"textures\playertags\staff.paa"};
													case 5: {"textures\playertags\ha.paa"};
													default {""};
													};
    _list lbAdd format["%1 - %2", _x getVariable ["realname",name _x],_side];
    _list lbSetdata [(lbSize _list)-1,str(_x)];
	_list lbSetPicture [(lbSize _list)-1,_picture];
} forEach playableUnits;
