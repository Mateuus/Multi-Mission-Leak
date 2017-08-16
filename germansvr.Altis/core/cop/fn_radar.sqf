/*
    File: fn_radar.sqf
    Author: Silly Aussie kid named Jaydon

    Description:
    Looks like weird but radar?
*/
if (playerSide != west) exitWith {};
private ["_speed","_vehicle"];
_vehicle = cursorObject;
_speed = round speed _vehicle;

if ((_vehicle isKindOf "Car") && (currentWeapon player) isEqualTo "Rangefinder") then {
    hint parseText format ["<t color='#ffffff'><t size='1'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#33CC33'><t align='center'><t size='2'>" +(localize "STR_Cop_VehSpeed"),round  _speed];
};