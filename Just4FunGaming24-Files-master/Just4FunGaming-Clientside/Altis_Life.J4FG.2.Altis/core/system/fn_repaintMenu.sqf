// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private["_ctrl", "_colorArray"];

if( XY_currentInteraction getVariable["dbInfo", -1] < 0 ) exitWith {
    hint "Mietfahrzeuge können nicht umlackiert werden";
};
if( XY_actionInUse ) exitWith {
    hint "Du bist grad anderweitig beschäftigt";
};
if( XY_currentInteraction getVariable["side", sideUnknown] != civilian ) exitWith {
    hint "Es können nur Zivilisten-Fahrzeuge lackiert werden";
};

if( !(createDialog "XY_dialog_repaintVehicle") ) exitWith {};

disableSerialization;

_ctrl = (findDisplay 2300) displayCtrl 2302;

lbClear 2302;

{
	if( (call (_x select 0)) in ["civ_reb", "civ_car", "civ_truck"] ) then {
		_ctrl lbAdd format["%1", _x select 1];
		_ctrl lbSetValue [ (lbSize _ctrl) - 1, _forEachIndex ];
	};
} forEach ([typeOf XY_currentInteraction] call XY_fnc_colorConfig);