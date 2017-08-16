/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Script for cops removing weapons and briefcases from the ground
*/

private ["_target","_briefcases","_removed"];

if(DS_doingStuff) exitwith {};
_target = cursorTarget;
if(!((typeOf _target) in ["GroundWeaponHolder","WeaponHolderSimulated"])) exitwith {systemchat "Face a weapon on the ground to use this";};
DS_doingStuff = true;
deleteVehicle _target;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4;
hint "You were paid $500 for removing evidence";
DS_doingStuff = false;