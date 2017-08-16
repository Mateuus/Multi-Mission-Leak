/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
	_nearby = if (life_saniunterwegs) then {"Ja"} else {"Nein"};
	_medicsOnline ctrlSetText format[ "Sanitäter online: %1",[independent] call life_fnc_playerCount];
	_medicsNear ctrlSetText format[ "Arzt ist unterwegs zu dir: %1",_nearby];
	sleep 1;
	(isNull (findDisplay 7300))
};