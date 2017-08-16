/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_tisch"];
_tisch = nearestObjects[getPos player,["Land_WoodenTable_large_F"],8] select 0;
if(isNil "_tisch") exitWith {};

if(([true,"tisch",1] call life_fnc_handleInv)) then
{
    titleText["Du hast einen Tisch aufgehoben.","PLAIN"];
    //player removeAction life_action_dixiPickup;
    life_action_tischPickup = nil;
    deleteVehicle _tisch;
};