/*
    File: fn_packupband.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: G00golplexian

    Description:
    Sammelt das ausgelegte Sperrmaterial wieder ein.
*/
private["_band"];
_band = nearestObjects[getPos player,["TapeSign_F"],8] select 0;
if(isNil "_band") exitWith {};

if(([true,"band",1] call life_fnc_handleInv)) then
{
    titleText["Du hast das Absperrband aufgehoben.","PLAIN"];
    deleteVehicle _band;
};