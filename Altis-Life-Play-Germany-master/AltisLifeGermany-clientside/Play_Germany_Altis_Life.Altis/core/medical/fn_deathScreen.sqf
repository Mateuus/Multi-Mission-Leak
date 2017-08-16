/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by PlayGermany
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear","_numOfMedics"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);
_requestButton = ((findDisplay 7300) displayCtrl 7303);
_requestButtonFight = ((findDisplay 7300) displayCtrl 7307);
_requestButton ctrlEnable false;
_requestButtonFight ctrlEnable false;

waitUntil {
	_nearby = if(([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"Ja"} else {"Nein"};
	_numOfMedics = []call PG_fnc_countMedics;
	if(_numOfMedics == 0) then { 
		_medicsOnline ctrlSetText "Es ist leider kein Sanitäter verfügbar";
		_requestButton ctrlEnable false;
		_requestButtonFight ctrlEnable false;
		_nearby = "Nein";
	} else {
		_medicsOnline ctrlSetText format[localize "STR_Medic_Online",_numOfMedics];
		if(time > life_request_cooldown) then {
			_requestButton ctrlEnable true;
			_requestButtonFight ctrlEnable true;
		};
	};
	_medicsNear ctrlSetText format[localize "STR_Medic_Near",_nearby];
	uiSleep 1;
	(isNull (findDisplay 7300))
};