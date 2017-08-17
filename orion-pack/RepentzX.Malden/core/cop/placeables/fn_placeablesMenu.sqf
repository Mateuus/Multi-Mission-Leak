/*
	Author: Maximum
	Description: Placeables for the cop\medic sides.
*/
disableSerialization;
if(playerSide != west) exitWith {
    ["You must be a police officer to use this",false,"slow"] call life_fnc_notificationSystem;
}; 

createDialog "life_cop_placeables";
waitUntil { !isNull(findDisplay 20000) };
_display = findDisplay 20000;
_placeables = _display displayCtrl 20001;
lbClear _placeables;

{
	_name = _x select 0;
    _className = _x select 1;
    _placeables lbAdd _name;
    _placeables lbSetData [(lbSize _placeables) - 1, _className];
} foreach (life_placeables);
