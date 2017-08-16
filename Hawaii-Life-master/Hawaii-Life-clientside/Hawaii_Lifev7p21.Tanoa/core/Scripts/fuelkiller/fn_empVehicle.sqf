/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith {hint "Der Helikopter hat bereits den Fuelkiller verwendet. Du musst warten bis er wieder einsatzbereit ist."; };
	nn_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	_vehicle setVariable["empInUse",true,true];
	if(isNull _vehicle) exitWith {};
	(vehicle player) say3D "empacsound";
	[_vehicle] remoteExecCall ["life_fnc_vehicleEmpd",crew _vehicle];
	sleep (10 * 60);
	nn_empInUse = false;
};
