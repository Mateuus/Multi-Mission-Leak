/*
    File: fn_packupstrahler.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Strahler abbauen
*/
private["_strahler"];
_strahler = nearestObjects[getPos player,["Land_PortableLight_double_F"],3] select 0;
if(isNil "_strahler") exitWith {};


if(([true,"strahler",1] call life_fnc_handleInv)) then
{
    titleText["Du hast den Strahler aufgehoben.","PLAIN"];
    
    life_action_barricadePickup = nil;
    deleteVehicle _strahler;
};