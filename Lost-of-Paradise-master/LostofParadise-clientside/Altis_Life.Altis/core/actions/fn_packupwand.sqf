/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_wand"];
_wand = nearestObjects[getPos player,["Land_CncBarrierMedium4_F"],8] select 0;
if(isNil "_wand") exitWith {};

if(([true,"wand",1] call life_fnc_handleInv)) then
{
	titleText["Du hast die Mauer abgebaut.","PLAIN"];
	//player removeAction life_action_wandPickup;
	life_action_wandPickup = nil;
	deleteVehicle _wand;
};