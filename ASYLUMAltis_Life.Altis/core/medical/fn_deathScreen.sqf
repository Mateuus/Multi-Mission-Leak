/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by: John "Paratus" VanderZwet
	
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
		if ((side _x == independent || ["cop_medic",str _x] call BIS_fnc_InString) && alive _x && _x != player) then
		{
			_distance = (getPosATL life_corpse) distance _x;
			if (_distance < _nearby) then { _nearby = _distance; };
		};
	} foreach playableUnits;
	_medicsOnline ctrlSetText format["Medics Online: %1",([independent] call life_fnc_playerCount) + ({["cop_medic",str _x] call BIS_fnc_InString} count playableUnits)];
	if (_nearby == 99999) then { _medicsNear ctrlSetText format["Nearest Medic: None",_nearby]; }
	else { _medicsNear ctrlSetText format["Nearest Medic: %1m",[(round _nearby)] call life_fnc_numberText]; };
	_canRevive = (((player getVariable["can_revive",-1000]) < time) && (time - (player getVariable ["last_revived",-1000]) > 300) && isNil "life_allowMedic");
	_medicsButton ctrlEnable _canRevive;
	sleep 1;
	(isNull (findDisplay 7300))
};