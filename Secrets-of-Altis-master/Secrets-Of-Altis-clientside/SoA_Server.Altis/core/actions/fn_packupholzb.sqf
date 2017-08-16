/*
    File: fn_packupholzb.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: G00golplexian

    Description:
    Sammelt das ausgelegte Sperrmaterial wieder ein.
*/
private["_holzb"];
_holzb = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0;
if(isNil "_holzb") exitWith {};

if(([true,"holzb",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Holzbarriere aufgehoben.","PLAIN"];
    deleteVehicle _holzb;
};