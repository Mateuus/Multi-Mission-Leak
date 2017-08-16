// by ALIAS
// nul = [delay] execvm "Katastrophen\alias_fallingstar_ini.sqf";
// Tutorial: WIP

_delay_fall_star = _this select 0;

while {true} do {
	[] execvm "Katastrophen\alias_fallingstar.sqf";
	sleep _delay_fall_star;
};