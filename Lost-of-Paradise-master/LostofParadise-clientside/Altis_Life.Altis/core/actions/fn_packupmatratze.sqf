/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_matratze"];
_matratze = nearestObjects[getPos player,["Land_Sleeping_bag_blue_F"],8] select 0;
if(isNil "_matratze") exitWith {};

if(([true,"matratze",1] call life_fnc_handleInv)) then
{
	titleText["Du hast eine Matratze abgebaut.","PLAIN"];
	//player removeAction life_action_generatorPickup;
	life_action_matratzePickup = nil;
	deleteVehicle _matratze;
};