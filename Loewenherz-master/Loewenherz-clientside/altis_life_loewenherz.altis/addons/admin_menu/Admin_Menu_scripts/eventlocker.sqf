/*
	File: eventlocker.sqf
	Author: Bloodwyn

	Description:
	Spawns a row of Eventlockers in front of the player.
*/

for [{_i=1},{_i<=15},{_i=_i+2.5}] do {
	_veh="Box_NATO_Wps_F" createVehicle [0,0,0];
	_veh setPosATL (player modelToWorld [_i-7.5,4,0]);
	_veh setDir direction player,
	_veh allowDamage false;
	_veh setVectorUp [0,0,1];
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
};