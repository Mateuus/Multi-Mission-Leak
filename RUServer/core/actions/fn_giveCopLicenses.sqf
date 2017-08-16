/*
	File: fn_giveCopLicenses.sqf
*/
private["_unit"];
params [["_unit", ObjNull,[ObjNull]]
];
if(isNull _unit) exitWith {};
[4] remoteExecCall ["life_fnc_giveCopLicenses",_unit];
