/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_tape"];
_tape = nearestObjects[getPos player,["TapeSign_F"],8] select 0;
if(isNil "_tape") exitWith {};

if(([true,"tape",1] call ES_fnc_handleInv)) then
{
    titleText["Du hast die feste Absperrung aufgehoben.","PLAIN"];
    player removeAction ES_action_tapePickup;
    ES_action_tapePickup = nil;
    deleteVehicle _tape;
};