/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(life_empInUse) exitWith {hint "Der Fuel-Killer warnt grade schon ein Fahrzeug oder die Batterie muss sich erst wieder aufladen"; };
	life_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = life_emplast_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	(vehicle player) say3D "empacsound";
	[_vehicle] remoteExec ["life_fnc_vehicleEmpd",crew _vehicle];
	sleep (3 * 60);
	life_empInUse = false;
};
