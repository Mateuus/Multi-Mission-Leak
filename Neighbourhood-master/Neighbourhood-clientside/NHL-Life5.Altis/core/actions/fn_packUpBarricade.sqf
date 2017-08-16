/*
    File: fn_packupbarricade.sqf
    Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de

    Description:
    Packs up a deployed barricade.
*/
private["_barricade"];
_barricade = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0;
if(isNil "_barricade") exitWith {};
if(playerSide == civilian) exitWith {};

if(([true,"barricade",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Barrikade aufgehoben.","PLAIN"];
    player removeAction life_action_barricadePickup;
    life_action_barricadePickup = nil;
    deleteVehicle _barricade;
};