/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_switchVehColorShop.sqf
	Server: e-Monkeys.com
    
    Description: Change selected vehicle color in the Shop
*/
private["_display","_VehicleColorList","_selectedColor","_ColorClass"];
disableSerialization;

_display = findDisplay 20000;
_VehicleColorList = _display displayCtrl 1100;

_selectedColor = lbCurSel _VehicleColorList;
_ColorClass = _VehicleColorList lbValue _selectedColor;

[EMonkeys_vehicleInShop,_ColorClass] call EMonkeys_fnc_colorVehicle;