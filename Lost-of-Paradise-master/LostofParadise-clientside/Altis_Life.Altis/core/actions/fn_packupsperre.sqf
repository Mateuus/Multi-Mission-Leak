/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_sperre"];
_sperre = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0;
if(isNil "_sperre") exitWith {};

if(([true,"sperre",1] call life_fnc_handleInv)) then
{
    titleText["Du hast eine Barriere aufgehoben.","PLAIN"];
    //player removeAction life_action_sperrePickup;
    life_action_sperrePickup = nil;
    deleteVehicle _sperre;
};