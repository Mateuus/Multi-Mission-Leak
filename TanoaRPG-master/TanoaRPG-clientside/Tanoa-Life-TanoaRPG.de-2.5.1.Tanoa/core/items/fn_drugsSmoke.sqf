/*
	By CooliMC
*/

_smoke = "SmokeShell" createVehicle position player;
if (vehicle player != player) then {
	_smoke attachTo [vehicle player, [0,-1,0]];
} else {
	_smoke attachTo [player, [0,0,1]];
};