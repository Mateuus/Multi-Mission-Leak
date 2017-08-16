/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	For police getting out of MCU rear gun
*/
private ["_gun"];
_gun = (nearestobjects [getpos player, ["B_HMG_01_high_F"],  10] select 0);

player allowDamage false;
player action ["getOut", _gun];
_gun = (nearestobjects [getpos player, ["O_Truck_03_covered_F"],  10] select 0);
sleep 1;
player moveInCargo _gun;
player allowDamage true;
DS_inGunner = false;
player removeAction DS_action_gunExit;


