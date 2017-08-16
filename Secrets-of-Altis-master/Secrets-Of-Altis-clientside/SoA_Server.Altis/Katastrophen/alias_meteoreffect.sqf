// by ALIAS
// nul = [_falling_meteor_main] execvm "Katastrophen\alias_stareffect.sqf;
// Tutorial: WIP

_fall_meteor_smoke = _this select 0;

// creeaza lumina variabila
_li2 = "#lightpoint" createVehicleLocal getpos _fall_meteor_smoke;
_li2 setLightBrightness 100;
_li2 setLightDayLight true;
_li2 setLightAmbient[1,0.5,0];
_li2 setLightColor[1, 0.5, 0];
_li2 lightAttachObject [_fall_meteor_smoke, [0,0,0.1]];

_meteor_smoke  = "#particlesource" createVehicleLocal getPosATL _fall_meteor_smoke;
_meteor_smoke  setParticleCircle [0, [0, 0, 0]];
_meteor_smoke  setParticleRandom [5, [0.1, 0.1, 0], [0.2, 0.2, 0.5], 0.3, 0.5, [0, 0, 0, 0.5], 0, 0];
_meteor_smoke  setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7,48,1], "", "Billboard", 1, 20, [0, 0, 0], [0, 0, 0.5], 0, 10.1, 7.9, 0.01, [7, 3, 1], [[0.1,0.1,0.1,0.9], [0.6,0.6,0.6,0.6], [0.8,0.8,0.8,0.4],[0.9,0.9,0.9,0.3],[1,1,1,0.1]], [0.125], 1, 0, "", "", _fall_meteor_smoke];
_meteor_smoke  setDropInterval 0.01;

_ps2 = "#particlesource" createVehicleLocal getPosATL _fall_meteor_smoke;
_ps2 setParticleCircle [0, [0, 0, 0]];
_ps2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ps2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 1, 0, 1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0], 0, 10, 7.9, 0.075, [5, 1.5, 2], [[0.4,0.4,0.4,0],[0.4,0.4,0.4,0.5],[0.4,0.4,0.4,0.25],[0.6,0.6,0.6,0.12],[1,1,1,0]], [0.08], 1, 0, "", "", _fall_meteor_smoke];
_ps2 setDropInterval 0.01;

waitUntil {isNull _fall_meteor_smoke};
deleteVehicle _li2;