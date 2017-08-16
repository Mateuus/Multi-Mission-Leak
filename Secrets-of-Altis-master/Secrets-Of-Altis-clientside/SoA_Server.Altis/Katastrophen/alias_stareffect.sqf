// by ALIAS
// nul = [_fall_star] execvm "Katastrophen\alias_stareffect.sqf;
// Tutorial: WIP

_fall_star_smoke = _this select 0;

_psmoke = "#particlesource" createVehicleLocal getPosATL _fall_star_smoke;
_psmoke setParticleCircle [0, [0, 0, 0]];
_psmoke setParticleRandom [3, [0.25, 0.25, 0.25], [0, 0, 0], 0, 0.25, [0, 0, 0, 0.5], 0, 0];	
_psmoke setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0.75], 30, 10, 7.9, 0, [1.2, 4, 1], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5]], [0.08], 1, 0, "", "", _fall_star_smoke];
_psmoke setDropInterval 0.002;