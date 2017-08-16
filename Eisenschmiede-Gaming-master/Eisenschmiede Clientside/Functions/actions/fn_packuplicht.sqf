/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_licht"];
_licht = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0;
if(isNil "_licht") exitWith {};

if(([true,"licht",1] call ES_fnc_handleInv)) then
{
    titleText["Du hast die Beleuchtung aufgehoben.","PLAIN"];
    player removeAction ES_action_lichtPickup;
    ES_action_lichtPickup = nil;
    deleteVehicle _licht;
};