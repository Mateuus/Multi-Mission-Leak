/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	_vehicle = nn_last_vehicles select _index;
	if(_vehicle getVariable "empInUse") exitWith {hint "Der Helikopter hat bereits den Fuelkiller verwendet. Du musst warten bis er wieder einsatzbereit ist."; };
	_vehicle setVariable["empInUse",true,true];
	_index = lbCurSel (2902);
	if(isNull _vehicle) exitWith {};
	(vehicle player) say3D "empacsound";
	[_vehicle] remoteExecCall ["life_fnc_vehicleEmpd",crew _vehicle];
	sleep (10 * 60);
	_vehicle setVariable["empInUse",false,true];
};
