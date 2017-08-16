/*
    File: fn_packupfeuer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: G00golplexian

    Description:
    Sammelt das ausgelegte Sperrmaterial wieder ein.
*/
private["_feuer"];
_feuer = nearestObjects[getPos player,["Land_Campfire_F"],8] select 0;
if(isNil "_feuer") exitWith {};

if(([true,"feuer",1] call life_fnc_handleInv)) then
{
    titleText["Du hast das Lagerfeuer entfernt.","PLAIN"];
    deleteVehicle _feuer;
	life_feueraktiv = false;
};