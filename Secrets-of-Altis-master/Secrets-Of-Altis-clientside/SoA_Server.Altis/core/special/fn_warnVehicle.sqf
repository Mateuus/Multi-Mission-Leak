/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(life_empInUse) exitWith { hint "Das EMP warnt grade schon ein Fahrzeug"; };
	life_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = life_emplast_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	[_vehicle] remoteExec ["life_fnc_vehicleWarned",crew _vehicle];
	sleep 10;
	life_empInUse = false;
};