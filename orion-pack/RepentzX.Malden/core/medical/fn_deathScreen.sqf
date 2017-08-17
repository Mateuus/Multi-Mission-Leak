/*
    File: fn_deathScreen.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles stuff being displayed on the death screen while
    it is currently active.
*/
private ["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);
/*
waitUntil {
    if(!(life_bloodActionPlaying)) then {life_bloodActionPlaying = true; [(floor(random (85))) + 5] call life_fnc_deadBloodEffect;};
    _nearby = if (([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"Yes"} else {"No"};
    _medicsOnline ctrlSetText format [localize "STR_Medic_Online",independent countSide playableUnits];
    _medicsNear ctrlSetText format [localize "STR_Medic_Near",_nearby];
    sleep 1;
    (isNull (findDisplay 7300))
};
*/

waitUntil {
	 if(!(life_bloodActionPlaying)) then {life_bloodActionPlaying = true; [(floor(random (85))) + 5] call life_fnc_deadBloodEffect;};
	_nearby = 99999;
	{
		if (side _x isEqualTo independent && alive _x && _x != player) then
		{
			_distance = (getPosATL life_corpse) distance _x;
			if (_distance < _nearby) then { _nearby = _distance; };
		};
	} foreach playableUnits;
	_medicsOnline ctrlSetText format [localize "STR_Medic_Online",independent countSide playableUnits];
	if (_nearby isEqualTo 99999) then { _medicsNear ctrlSetText format["Nearest Medic: None",_nearby]; }
	else { _medicsNear ctrlSetText format["Nearest Medic: %1m",[(round _nearby)] call life_fnc_numberText]; };
	uiSleep 1;
	(isNull (findDisplay 7300))
};
