// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_index","_vehicle"];
disableSerialization;
if( isNull (findDisplay 3494) ) exitWith {};

_index = lbCurSel (2902);
_vehicle = XY_empLastVehicles select _index;
if(isNull _vehicle) exitWith {};

if( !(_vehicle isKindOf "Air") ) exitWith {
    hint "Es können nur Luftfahrzeuge EMP'd werden!";
};
if( !(_vehicle getVariable["emp.warned", false]) ) exitWith {
    hint "Das Fahrzeug muss erst gewarnt werden!";
};

if( XY_empInUse ) exitWith { 
    hint "Das EMP ist in Benutzung oder der Kondensator muss sich aufladen"; 
};
XY_empInUse = true;

hint "EMP wird ausgeführt, das feindliche Fahrzeug muss innerhalb von 200m verbleiben";
(vehicle player) say3D "empsound";
[_vehicle, player] remoteExec ["XY_fnc_vehicleEmpd", _vehicle];
format ["<EMP> %1 (%2) EMP fired @ %3 (%4) @ %5", profileName, getPlayerUID player, name (driver _vehicle), getPlayerUID (driver _vehicle) , mapGridPosition player] remoteExec ["XY_fnc_log", 2];

sleep (2 * 60);
XY_empInUse = false;