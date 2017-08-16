/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(isNil "nn_empInUse") then { nn_empInUse = false; };
	if(nn_empInUse) exitWith { hint "Das EMP warnt gerade schon ein Fahrzeug"; };
	hint "EMP-Warnung wurde an das Ziel gesendet!";
	nn_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	[[_vehicle], "life_fnc_vehicleWarned",crew _vehicle,false] spawn life_fnc_MP;
	uiSleep 30;
	nn_empInUse = false;
};