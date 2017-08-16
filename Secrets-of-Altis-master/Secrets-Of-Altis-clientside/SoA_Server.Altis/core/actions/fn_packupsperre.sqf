/*
    File: fn_packupsperre.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: G00golplexian

    Description:
    Sammelt das ausgelegte Sperrmaterial wieder ein.
*/
private["_sperre"];
_sperre = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0;
if(isNil "_sperre") exitWith {};

if(([true,"sperre",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Strassensperre aufgehoben.","PLAIN"];
    deleteVehicle _sperre;
};