/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear","_nearby","_medicsCount"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
	_medicsCount = [0] call DWEV_fnc_playerCount;
	_nearby = if(([independent,getPosATL player,120] call DWEV_fnc_nearUnits)) then {"Ja"} else {"Nein"};
	_medicsOnline ctrlSetText format["Feuerwehr Online: %1",_medicsCount];
	_medicsNear ctrlSetText format["Feuerwehr in der Nähe: %1",_nearby];
	
	if (_medicsCount == 0 ) then {((findDisplay 7300) displayCtrl 7303) ctrlEnable false;}; // Medics Rufen Knopf deaktivieren wenn kein Medic online
	
	sleep 1;

	(isNull (findDisplay 7300))

};
//((findDisplay 7300) displayCtrl 7303) ctrlEnable true;