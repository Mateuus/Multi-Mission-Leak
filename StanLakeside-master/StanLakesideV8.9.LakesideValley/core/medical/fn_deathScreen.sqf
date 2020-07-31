/*
	File: fn_deathScreen.sqf
	
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);
waitUntil {
	_nearby = 99999;
	{
		if (side _x == independent && !(_x getVariable["dead",FALSE]) && _x != player) then
		{
			_distance = (getPosATL player) distance _x;
			if (_distance < _nearby) then { _nearby = _distance; };
		};
	} foreach playableUnits;
	_medicsOnline ctrlSetText format["Medics: %1",[independent] call life_fnc_playerCount];
	if (_nearby == 99999) then { _medicsNear ctrlSetText format["Nearest: None",_nearby]; }
	else { _medicsNear ctrlSetText format["Nearest: %1m",[(round _nearby)] call life_fnc_numberText]; };
	uiSleep 3;
	(isNull (findDisplay 7300))
};