/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_mauer"];
_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0;
if(isNil "_mauer") exitWith {};

if(([true,"mauer",1] call EMonkeys_fnc_handleInv)) then
{
    titleText["Du hast die Mauer aufgehoben.","PLAIN"];
    if(!isNil "EMonkeys_action_mauerDeploy") then {player removeAction EMonkeys_action_mauerDeploy;};
    EMonkeys_action_mauerPickup = nil;
    deleteVehicle _mauer;
};