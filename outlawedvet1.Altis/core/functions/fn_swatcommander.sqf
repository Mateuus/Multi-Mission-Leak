#include "..\..\script_macros.hpp"
/*
	File: fn_swatcommander.sqf
	Author: RPGforYOU
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(FETCH_CONST(life_swatlevel) < 3) exitWith {closeDialog 0;};
private["_display","_list","_rank","_punishments","_predefined","_message","_text"];
disableSerialization;
waitUntil {!isNull (findDisplay 15000)};
_display = findDisplay 15000;
_list = _display displayCtrl 15002;

switch(FETCH_CONST(life_swatlevel)) do
{
	//recruit
	case 1: {ctrlShow [15004,false];ctrlShow [15005,false];ctrlShow [15006,false];ctrlShow [15007,false];ctrlShow [15008,false];};
	//squad leader
	case 2: {ctrlShow [15004,false];ctrlShow [15005,false];ctrlShow [15006,false];ctrlShow [15007,false];ctrlShow [15008,false];};
	//Staff
	case 3: {ctrlShow [15005,false];ctrlShow [15006,false];};
};


//Purge List
lbClear _list;

/*
{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
*/

{
if (side _x isEqualTo west) then {
	_rank = switch((_x getVariable "swatrank")) do {
													case 1: {_text = format["I"]};
													case 2: {_text = format["II"]};
													case 3: {_text = format["III"]};
													case 4: {_text = format["IIII"]};
													default {_text = format["O"]};
													};
	_picture = switch((_x getVariable "swatrank")) do {
													case 1: {"textures\playertags\swat1.paa"};
													case 2: {"textures\playertags\swat1.paa"};
													case 3: {"textures\playertags\swat2.paa"};
													case 4: {"textures\playertags\swat3.paa"};
													default {"\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa"};
													};
	_list lbAdd format["%2 - %1", _x getVariable["realname",name _x],_text];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
	_list lbSetPicture [(lbSize _list)-1,_picture];
}
} forEach playableUnits; 
