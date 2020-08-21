/*
	File: fn_placeablePlace.sqf

	Author: Maximum
	Description: Placeables for the cop\medic sides.
*/
disableSerialization;
if (life_barrier_active) exitWith {closeDialog 0; hint"Can't place 2 at the same time!";};
if (count life_bar_placey >= life_bar_limit) exitWith { hint "You've reached the limit of objects you can place."; };
if (vehicle player != player) exitWith {closeDialog 0;};

_display = findDisplay 40000;
_placeables = _display displayCtrl 40001;
_className = lbData[40001, lbCurSel (40001)];
closeDialog 0;
life_barrier_active = true;
_allowMoveDistance = 50;
_object = _className createVehicle (position player);
life_barrier_activeObj = _object;
_attachPos = [0, 3, 0.5];
_object attachTo[player, _attachPos];
_object enableSimulationGlobal false;
_originalPos = position _object;
_playerOriginalPos = position player;

waitUntil
{
    if (life_barrier_activeObj distance _originalPos > _allowMoveDistance || player distance _playerOriginalPos > _allowMoveDistance) then
    {
        [true] call life_fnc_placeableCancel;
    };
    uiSleep 1;
    !life_barrier_active;
};