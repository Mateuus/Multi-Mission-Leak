// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private["_index","_vehicle"];

disableSerialization;
if( isNull (findDisplay 3494) ) exitWith {};

if( XY_empInUse ) exitWith { 
    hint "Das EMP ist in Benutzung oder der Kondensator muss sich aufladen";
};
XY_empInUse = true;

_index = lbCurSel (2902);
_vehicle = XY_empLastVehicles select _index;
if(isNull _vehicle) exitWith {};

if( !(_vehicle isKindOf "Air") ) exitWith {
    hint "Es können nur Luftfahrzeuge EMP'd werden!";
};

[_vehicle] remoteExec ["XY_fnc_vehicleWarned", _vehicle];
format ["<EMP> %1 (%2) EMP warned %3 (%4) @ %5", profileName, getPlayerUID player, name (driver _vehicle), getPlayerUID (driver _vehicle) , mapGridPosition player] remoteExec ["XY_fnc_log", 2];

sleep 30;
XY_empInUse = false;