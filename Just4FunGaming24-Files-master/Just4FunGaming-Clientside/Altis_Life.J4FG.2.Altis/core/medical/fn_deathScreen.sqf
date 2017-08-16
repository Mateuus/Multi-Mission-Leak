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
    _medicsOnline ctrlSetText format[ "Sanitäter online: %1", [independent] call XY_fnc_playerCount ];
    _medicsNear ctrlSetText format[ "Sanitäter in der Nähe: %1", ["NEIN", "JA"] select ( [independent, getPosATL player, 500] call XY_fnc_nearUnits ) ];
    uisleep 1;
    (isNull (findDisplay 7300))
};