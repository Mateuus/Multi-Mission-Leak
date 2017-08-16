/*
    File: fn_packuphut.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: G00golplexian

    Description:
    Sammelt das ausgelegte Sperrmaterial wieder ein.
*/
private["_hut"];
_hut = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_hut") exitWith {};

if(([true,"hut",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Pylonen aufgehoben.","PLAIN"];
    deleteVehicle _hut;
};