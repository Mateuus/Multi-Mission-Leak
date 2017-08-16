/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear","_medicsButton"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsButton = ((findDisplay 7300) displayCtrl 7303);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
	_nearby = 99999;
	{
		if (side _x == independent && alive _x && _x != player) then
		{
			_distance = (getPosATL ES_corpse) distance _x;
			if (_distance < _nearby) then { _nearby = _distance; };
		};
	} foreach playableUnits;
	_medicsOnline ctrlSetText format["Sanitäter Online: %1",[independent] call ES_fnc_playerCount];
	if (_nearby == 99999) then { _medicsNear ctrlSetText format["Sanitäter in der Umgebung: Keine"]; }
	else { _medicsNear ctrlSetText format["Sanitäter in der Umgebung: %1m",[(round _nearby)] call ES_fnc_numberText]; };
	if(!ES_medicRequest) then {_medicsButton ctrlEnable false;} else {_medicsButton ctrlEnable true;};
	sleep 1;
	(isNull (findDisplay 7300))
};