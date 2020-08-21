/*
	File: fn_placeablesMenu.sqf

	Author: Maximum
	Description: Placeables for the cop\medic sides.
*/
disableSerialization;
createDialog "life_placeables";
waitUntil { !isNull(findDisplay 40000) };
_display = findDisplay 40000;
_placeables = _display displayCtrl 40001;
lbClear _placeables;
{
    _name = _x select 0;
    _className = _x select 1;
    _placeables lbAdd _name;
    _placeables lbSetData [(lbSize _placeables) - 1, _className];
} forEach life_placeables;