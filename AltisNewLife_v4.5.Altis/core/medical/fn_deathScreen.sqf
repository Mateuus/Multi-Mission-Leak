private["_medicsOnline","_medicsNear"];
disableSerialization;

for "_x" from 0 to 20 do {
    _x cutRsc ["wasted","PLAIN"];
};
playsound "wasted";
_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);
waitUntil {
	_nearby = 99999;
	{
	if (side _x == independent && alive _x && _x != player) then {
			_distance = (getPosATL player) distance _x;
			if (_distance < _nearby) then {_nearby = _distance;};
		};
	} foreach playableUnits;

	_medicsOnline ctrlSetText format["Medecin(s) actif(s): %1",[independent] call life_fnc_playerCount];

		if (_nearby == 99999) then {
		_medicsNear ctrlSetText format["Medecin proche: Non",_nearby];
		} else {
		_medicsNear ctrlSetText format["Medecin le plus proche : %1m",[(round _nearby)] call life_fnc_numberText];
		};
	uiSleep 1;
	(isNull (findDisplay 7300))
};