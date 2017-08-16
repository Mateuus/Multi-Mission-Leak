/*
    File: fn_packupbarrier.sqf
    Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de

    Description:
    Packs up a deployed barrier.
*/
private["_barrier"];
_barrier = nearestObjects[getPos player,["TapeSign_F"],8] select 0;
if(isNil "_barrier") exitWith {};
if(playerSide == civilian) exitWith {};

if(([true,"barrier",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Barrikade aufgehoben.","PLAIN"];
    player removeAction life_action_barrierPickup;
    life_action_barrierPickup = nil;
    deleteVehicle _barrier;
};