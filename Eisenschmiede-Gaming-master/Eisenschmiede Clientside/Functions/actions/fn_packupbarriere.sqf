/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_barriere"];
_barriere = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0;
if(isNil "_barriere") exitWith {};

if(([true,"barriere",1] call ES_fnc_handleInv)) then
{
    titleText["Du hast die feste Absperrung aufgehoben.","PLAIN"];
    player removeAction ES_action_barrierePickup;
    ES_action_barrierePickup = nil;
    deleteVehicle _barriere;
};