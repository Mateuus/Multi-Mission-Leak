/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_mauer"];
_mauer = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_mauer") exitWith {};

if(([true,"mauer",1] call life_fnc_handleInv)) then
{
	titleText["Du hast die Pylone aufgehoben.","PLAIN"];
	//player removeAction life_action_mauerPickup;
	life_action_mauerPickup = nil;
	deleteVehicle _mauer;
};