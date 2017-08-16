#include "..\..\script_macros.hpp"
/*
	File: fn_admincommander.sqf
	Author: RPGforYOU
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(FETCH_CONST(life_uclevel) < 4) exitWith {closeDialog 0;};
private["_display","_list","_side","_punishments","_predefined","_message"];
disableSerialization;
waitUntil {!isNull (findDisplay 16000)};
_display = findDisplay 16000;
_list = _display displayCtrl 16002;

switch(FETCH_CONST(life_uclevel)) do
{
	//recruit
	case 1: {ctrlShow [16004,false];ctrlShow [16005,false];ctrlShow [16006,false];ctrlShow [16007,false];ctrlShow [16008,false];ctrlShow [16009,false];};
	//Cop Trainer
	case 2: {ctrlShow [16004,false];ctrlShow [16005,false];ctrlShow [16006,false];ctrlShow [16007,false];ctrlShow [16008,false];ctrlShow [16009,false];};
	//Staff
	case 3: {ctrlShow [16004,false];ctrlShow [16005,false];ctrlShow [16006,false];ctrlShow [16007,false];ctrlShow [16008,false];ctrlShow [16009,false];};
	//Staff
	case 4: {ctrlShow [16005,false];ctrlShow [16006,false];};
};


//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;


