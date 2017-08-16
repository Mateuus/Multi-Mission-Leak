/*
	File: fn_vInjectionMenu.sqf
	Author: Barney

	Description:
	blah blah blah....


	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/


private ["_display","_listbox","_btn","_Fahrzeuge","_foreachindex"];
disableSerialization;

closeDialog 0;

createDialog "injection";
waitUntil {!isnull(findDisplay 2541)};

_display = findDisplay 2541;
_listbox = _display displayCtrl 1500;
_btn = _display displayCtrl 2400;



_Fahrzeuge = nearestObjects[player,["Car"],40];

if(count(_Fahrzeuge) == 0) exitWith {
	_listbox lbadd "Keine Fahrzeuge in der Nähe";

};

{
	_listbox lbadd format ["%1",getText(configFile >> "CfgVehicles" >> typeof(_x) >> "displayName")];
	_listbox lbSetPicture[_foreachindex,getText(configFile >> "CfgVehicles" >> typeof(_x) >> "picture")];
	_listbox lbsetdata[_foreachindex,(netid _x)];

} foreach _Fahrzeuge;


_btn buttonSetAction "[] spawn lhm_fnc_upgradeCar;";

