// by ALIAS
// nul = [delay] execvm "Katastrophen\alias_meteor_ini.sqf";
// Tutorial: WIP

_delay = _this select 0;

while {true} do {
	[] execvm "Katastrophen\alias_meteor.sqf";
	sleep _delay;
};