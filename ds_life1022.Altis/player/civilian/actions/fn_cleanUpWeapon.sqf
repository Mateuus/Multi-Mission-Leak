/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Script for civs removing weapons and briefcases from the ground
*/

private ["_base","_target","_briefcases"];

if(DS_doingStuff) exitwith {};
_base = [] call DS_fnc_getPlayerBase;
if(isNull _base) exitwith {};
if(player distance _base > 100) exitwith {};
_target = cursorTarget;
if(!((typeOf _target) in ["GroundWeaponHolder","WeaponHolderSimulated"])) exitwith {systemchat "Face a weapon on the ground to use this";};
DS_doingStuff = true;
deleteVehicle _target;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4;
DS_doingStuff = false;