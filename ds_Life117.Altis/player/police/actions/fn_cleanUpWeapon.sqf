/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Script for cops removing weapons from the ground
*/

private ["_target"];

if(DS_doingStuff) exitwith {};
_target = cursorTarget;
if(typeOf _target != "GroundWeaponHolder") exitwith {systemchat "Face a weapon on the ground to use this";};
DS_doingStuff = true;

hint 'Picking up evidence';
deletevehicle _target;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4;
hint 'You were paid $500 for removing evidence';
[500,true,true] call DS_fnc_handleMoney;

DS_doingStuff = false;