/*

Author: CamaroZ

File: fn_alarme.sqf

*/

private ["_alarme","_house"];

_house = param [0,objNull,[objNull]];

if (isNull _house) exitWith {};

if (!(_house isKindOf "House_F")) exitWith {};

if (_house getVariable "alarme") then {

playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player, false, getPosASL player, 1, 1, 150]; //Hausalarm

// Instead of player can be reset by _house, the sound would be the object. But it has not been tested ...

} else {

 hint "Das Haus besitzt keine Alarmanlage.";

};