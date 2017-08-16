#include <macro.h>
if(GETC(bitch_level) < 1) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(GETC(bitch_level) < 1) exitWith {closeDialog 0;};
switch(GETC(bitch_level)) do
{
	case 1: {ctrlShow [2904,false];ctrlShow [2905,false];ctrlShow [2906,false];ctrlShow [2907,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];};
	case 2: {ctrlShow [2905,false];ctrlShow [2906,false];ctrlShow [2907,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];};
	case 3: {ctrlShow [2907,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];};
	case 4: {ctrlShow [2910,false];ctrlShow [2911,false];};
	case 5: {};
	};
lbClear _list;
{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; case east : {"Gvt"}; default {"Inconnu"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if(GETC(bitch_level) < 1) exitWith {closeDialog 0;};