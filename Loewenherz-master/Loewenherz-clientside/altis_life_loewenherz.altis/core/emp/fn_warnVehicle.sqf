/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
//if (typeName nn_last_vehicles == typeName []) exitWith {};
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith { hint "Das EMP ist in Benutzung oder laedt auf!"; };
	_index = lbCurSel (2902);
	if (_index == -1) exitWith {Hint "Nichts ausgewaehlt!"};
	nn_empInUse = true;
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	[[_vehicle], "lhm_fnc_vehicleWarned",crew _vehicle,false] call lhm_fnc_mp;
	sleep 10;
	nn_empInUse = false;
};