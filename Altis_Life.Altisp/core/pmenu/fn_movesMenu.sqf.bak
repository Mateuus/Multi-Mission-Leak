#include "..\..\script_macros.hpp"
/*	
	File: fn_movesMenu.sqf
	Author: Jack "Scarso" Farhall
*/
private["_display","_list","_moves"];
disableSerialization;
_moves = 
[    
	["Kung Fu","AmovPercMstpSnonWnonDnon_exerciseKata"],
	["Pompki","AmovPercMstpSnonWnonDnon_exercisePushup"],
	["Przysiady (Szybkie)","AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
	["Przysiady (Normalne)","AmovPercMstpSnonWnonDnon_exercisekneeBendA"],
	["Przerażony","AmovPercMstpSnonWnonDnon_Scared"]
];
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
lbClear _list;
{		
	_list lbAdd format["%1", _x select 0];
	_list lbSetdata [(lbSize _list)-1,str(_x select 1)];
} forEach _moves;