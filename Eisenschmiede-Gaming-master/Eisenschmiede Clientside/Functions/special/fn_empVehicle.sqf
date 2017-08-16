/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith { hint "Das EMP warnt grade schon ein Fahrzeug oder die Batterie muss sich erst wieder aufladen;"};
	nn_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	(vehicle player) say3D "empacsound";
	[[_vehicle], "ES_fnc_vehicleEmpd",crew _vehicle,false] spawn ES_fnc_MP;
	sleep (3 * 60);
	nn_empInUse = false;
};
