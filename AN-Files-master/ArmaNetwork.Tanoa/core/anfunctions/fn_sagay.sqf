/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer

	Description: Enables God mode for Admin
*/
if((call life_adminlevel) < 4) exitWith {call life_fnc_brefr;};
call life_fnc_brefr;
if(life_god) then {
	life_god = false;
	hintSilent "God mode disabled";
	player allowDamage true;
} else {
	life_god = true;
	hintSilent "God mode enabled";
	player allowDamage false;

	while {!isTouchingGround player} do {
	player setOxygenRemaining 100;
};

};
