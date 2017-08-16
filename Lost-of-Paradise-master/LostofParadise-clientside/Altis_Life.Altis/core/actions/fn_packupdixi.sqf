/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_dixi"];
_dixi = nearestObjects[getPos player,["Land_ToiletBox_F"],8] select 0;
if(isNil "_dixi") exitWith {};

if(([true,"dixi",1] call life_fnc_handleInv)) then
{
    titleText["Du hast eine Toilette aufgehoben.","PLAIN"];
    //player removeAction life_action_dixiPickup;
    life_action_dixiPickup = nil;
    deleteVehicle _dixi;
};