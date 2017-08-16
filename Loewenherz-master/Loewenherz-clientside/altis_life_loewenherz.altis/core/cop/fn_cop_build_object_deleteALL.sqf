/*
	File: fn_cop_classification_open.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de


	Info:
	1 - Kavala
	2 - BP_West
	3 - BP_West2
	4 - BP_Mitte
	5 - BP_Ueberall
	6 - BP_East
	7 - AP1
	8 - AP2
	9 - HWP
	10 - Sonstige
*/

private ["_wasAlles","_tempArray","_temp","_txtTmp"];
_wasAlles = nearestobjects[player,["ALL"],200];
_tempArray = [];


{
	if(_x getVariable["LHM_COP_BUILD",false]) then {
		_tempArray pushback _x;
	};


} foreach _wasAlles;

_temp = count(_tempArray);
{
	_txtTmp = format["Objekt:'%1' wird gelöscht",typename(_x)];
	[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
	sleep 0.3;
	deleteVehicle _x;

} foreach _tempArray;

sleep 0.5;

_txtTmp = format["Es wurden %1 Objekte gelöscht!",_temp];
[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
