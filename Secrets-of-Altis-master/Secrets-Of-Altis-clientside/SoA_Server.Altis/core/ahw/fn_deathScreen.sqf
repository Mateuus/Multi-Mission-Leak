/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear","_nearby"];
disableSerialization;
WaitUntil{!(isNull (findDisplay 7300))};

hudactive = false;
2 cutFadeout 0;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

While {true} do {
	_nearby = if([independent,getPosATL life_corpse,2000] call life_fnc_nearUnits) then {"Ja"} else {"Nein"};
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",(independent countSide playableUnits)];
	_medicsNear ctrlSetText format["Sanitäter in der Nähe: %1",_nearby];
	uisleep 1;
	if(isNull (findDisplay 7300)) exitWith{};
};