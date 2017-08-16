/*
	File: fn_vehicleSkinLBChange.sqf
	Author: Anton
	
	Description:
	Setzt den aktuellen Skin in die Skinvorschau ein
*/
_control = _this select 0;
_index = _this select 1;

_skinIndex = _control lbValue _index;
[ES_veh_veh,_skinIndex]call ES_fnc_colorVehicle;