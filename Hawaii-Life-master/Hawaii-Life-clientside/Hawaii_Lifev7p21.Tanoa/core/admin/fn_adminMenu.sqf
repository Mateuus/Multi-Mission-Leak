#include "..\..\script_macros.hpp"
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
private["_display","_list","_side","_spectate","_TpMap","_TpHere","_God","_Freeze","_Markers","_Debug"];
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

disableSerialization;

waitUntil {!isNull (findDisplay 2900)};
_list = CONTROL(2900,2902);
_money = CONTROL(2900,2904);
_spectate = CONTROL(2900,2905);
_TpMap = CONTROL(2900,2906);
_TpHere = CONTROL(2900,2907);
_God = CONTROL(2900,2908);
_Freeze = CONTROL(2900,2909);
_Markers = CONTROL(2900,2910);
_Debug = CONTROL(2900,2911);
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

switch(FETCH_CONST(life_adminlevel)) do
{
	case 1: {
			//Entschädigen
			ctrlShow [2904,false];
			//Spectate
			ctrlShow [2905,false];
			//Teleport MAP
			ctrlShow [2906,false];
			//Teleport to Me
			ctrlShow [2907,false];
			//GodMode
			ctrlShow [2908,false];
			//Freeze
			ctrlShow [2909,false];
			//Map Marker
			ctrlShow [2910,false];
			//Debug
			ctrlShow [2911,false];
		};
	case 2: {
			//Spectate
			ctrlShow [2905,false];
			//Teleport MAP
			ctrlShow [2906,false];
			//Teleport to Me
			ctrlShow [2907,false];
			//GodMode
			ctrlShow [2908,false];
			//Freeze
			ctrlShow [2909,false];
			//Map Marker
			ctrlShow [2910,false];
			//Debug
			ctrlShow [2911,false];
			_money buttonSetAction "createDialog ""Life_Admin_Compensate"";";
		};
	case 3: {
			//Teleport to Me
			ctrlShow [2907,false];
			//GodMode
			ctrlShow [2908,false];
			//Freeze
			ctrlShow [2909,false];
			//Map Marker
			ctrlShow [2910,false];
			//Debug
			ctrlShow [2911,false];
			_money buttonSetAction "createDialog ""Life_Admin_Compensate"";";
			_spectate buttonSetAction "[] call life_fnc_adminSpectate;";
		};
	case 4: {
			//Debug
			ctrlShow [2911,false];
			_money buttonSetAction "createDialog ""Life_Admin_Compensate"";";
			_spectate buttonSetAction "[] call life_fnc_adminSpectate;";
			_TpMap buttonSetAction "[] call life_fnc_adminTeleport; hint 'Select where you would like to teleport';";
			_TpHere buttonSetAction "[] call life_fnc_adminTpHere;";
			_God buttonSetAction "[] call life_fnc_adminGodMode;";
			_Freeze buttonSetAction "[] call life_fnc_adminFreeze;";
			_Markers buttonSetAction "[] spawn life_fnc_adminMarkers;";
		};
	case 5: {
			_money buttonSetAction "createDialog ""Life_Admin_Compensate"";";
			_spectate buttonSetAction "[] call life_fnc_adminSpectate;";
			_TpMap buttonSetAction "[] call life_fnc_adminTeleport; hint 'Select where you would like to teleport';";
			_TpHere buttonSetAction "[] call life_fnc_adminTpHere;";
			_God buttonSetAction "[] call life_fnc_adminGodMode;";
			_Freeze buttonSetAction "[] call life_fnc_adminFreeze;";
			_Markers buttonSetAction "[] spawn life_fnc_adminMarkers;";
			_Debug buttonSetAction "[] call life_fnc_adminDebugCon;";
		};
};

//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x GVAR ["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};