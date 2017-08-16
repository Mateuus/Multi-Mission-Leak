#include <macro.h>

/*
	File: fn_movesMenu.sqf
	Author: Jack "Scarso" Farhall
*/

private["_display","_list","_moves"];
disableSerialization;
player playMoveNow "";

_moves = [
  ["Kung Fu","AmovPercMstpSnonWnonDnon_exerciseKata"],
	["Push Ups","AmovPercMstpSnonWnonDnon_exercisePushup"],
	["Knee Bends (Fast)","AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
	["Knee Bends (Normal)","AmovPercMstpSnonWnonDnon_exercisekneeBendA"],
	["Scared","AmovPercMstpSnonWnonDnon_Scared"],
	["Take a Piss","Acts_AidlPercMstpSlowWrflDnon_pissing"],
	["Drunk Walk","AcinPercMstpSnonWnonDnon_agony"],
	["Pew","Acts_starterPistol_out"]
];

waitUntil {!isNull (findDisplay 2950)};
_display = findDisplay 2950;
_list = _display displayCtrl 2902;
lbClear _list;

{

	_list lbAdd format["%1", _x select 0];
	_list lbSetdata [(lbSize _list)-1,str(_x select 1)];
} foreach _moves;
