/*
    File: fn_pulloutAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls civilians out of a car if it's stopped.
*/
private["_vehicle", "_crew"];

_vehicle = [_this, 0, Objnull, [Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if( speed _vehicle >= 10 ) exitWith {};
if( _vehicle distance player > 10 ) exitWith {};
if( (currentWeapon player != primaryWeapon player && currentWeapon player != handgunWeapon player) || currentWeapon player == "" ) exitWith {
    hint "Ohne Waffe kriegst du niemanden aus einem Fahrzeug!";
};
if( playerSide != west && locked _vehicle != 0 ) exitWith {
    hint "Das Fahrzeug ist abgeschlossen";
};

_crew = crew _vehicle;
{
    [getPlayerUID player, 5, format ["Zieht %1 (%2) aus dem Fahrzeug @ %3", name _x, getPlayerUID _x, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];
    [getPlayerUID _x, 5, format ["Wurde von %1 (%2) aus dem Fahrzeug gezogen @ %3", profileName, getPlayerUID player, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];

    _x setVariable ["transporting", false, true];
    _x setVariable ["escorting", false, true];
    [] remoteExec ["XY_fnc_pulloutVeh", _x];
} forEach _crew;