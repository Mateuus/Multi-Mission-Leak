/*
	File: fn_displayHandler.sqf
	
	
	Description:
	Master display handler
*/

params ["_control", "_code", "_shift", "_ctrlKey", "_alt", ["_handled", false, [false]]];

//Esc Key Handler
if(_code isEqualTo 1) then {_handled = true;};

_handled;