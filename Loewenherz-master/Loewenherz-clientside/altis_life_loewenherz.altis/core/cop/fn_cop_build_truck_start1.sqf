/*
	File: fn_cop_classification_open.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

private ["_info","_txtTmp","_obj"];
if(typeof(cursorTarget) != "O_Truck_02_Ammo_F") exitWith {hint "Falscher Truck";};
_info = nearestObjects[player,["O_Truck_02_Ammo_F"],100];


hint "Der Baumodus wird gestartet";





{
	_txtTmp = format ["Platziere Objektbau - Zenter '%1' in %2 Sekunde(n)", (getText(configFile >> "CfgVehicles" >> "Flag_Quontrol_F" >> "displayName")),_x];

 	[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

	sleep 1;

} foreach [5,4,3,2,1];




_obj = "Flag_Quontrol_F" createVehicle ((_info select 0) modelToWorld [0,-10,-3]);
_obj setVariable["LHM_COP_BUILD",true,true];


_txtTmp = format ["Das Objekt %1 wurde gespawned", (getText(configFile >> "CfgVehicles" >> "Flag_Quontrol_F" >> "displayName"))];

[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

