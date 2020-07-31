/*
	fn_seatBelt.sqf
*/
playSound "seatbelt";
if(!life_seatbelt) then {
	life_seatbelt = true;
} else {
	life_seatbelt = false;
};