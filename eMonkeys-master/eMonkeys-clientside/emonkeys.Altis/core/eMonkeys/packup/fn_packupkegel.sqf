/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_mauer"];
_mauer = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_mauer") exitWith {};

if(([true,"kegel",1] call EMonkeys_fnc_handleInv)) then
{
    titleText["Du hast ein Kegel aufgehoben.","PLAIN"];
    if(!isNil "EMonkeys_action_KegelDeploy") then {player removeAction EMonkeys_action_KegelDeploy;};
    EMonkeys_action_KegelPickup = nil;
    deleteVehicle _mauer;
};