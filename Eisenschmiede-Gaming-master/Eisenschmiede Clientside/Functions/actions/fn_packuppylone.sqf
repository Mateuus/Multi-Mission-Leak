/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_pylone"];
_pylone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_pylone") exitWith {};

if(([true,"pylone",1] call ES_fnc_handleInv)) then
{
    titleText["Du hast die Pylone aufgehoben.","PLAIN"];
    player removeAction ES_action_pylonePickup;
    ES_action_pylonePickup = nil;
    deleteVehicle _pylone;
};