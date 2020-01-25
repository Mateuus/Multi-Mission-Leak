/*
	File: fn_stretcherpls
*/

if ( (side player == independent) && (life_stretcher == 1) ) then {
	life_stretcher = 0;
	["Stretcher spawned - You have reached your maximum of 1", false] spawn domsg;
	_location = getpos player;
	_stretcher = "cg_Stretcher" createvehicle _location;
};