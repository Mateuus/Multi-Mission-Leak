// by ALIAS
// nul = [_poz_end] execvm "Katastrophen\meteor_end_blast.sqf";
// Tutorial: WIP

_poz = _this select 0;

_bolovani = "#particlesource" createVehicleLocal _poz;
_bolovani setParticleCircle [0, [0, 0, 0]];
_bolovani setParticleRandom [3, [0.25, 0.25, 0], [100, 100, 100], 0, 1, [0, 0, 0, 0.1], 0, 0];
_bolovani setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 10, [0, 0, 0], [5, 5, 100], 2, 200, 5, 3, [2, 1, 1], [[0, 0, 0, 1], [0, 0, 0, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _poz];
_bolovani setDropInterval 0.01;

_fum = "#particlesource" createVehicleLocal _poz;
_fum setParticleCircle [0, [0, 0, 0]];
_fum setParticleRandom [0, [0.25, 0.25, 0], [100, 100, 100], 0, 0, [0, 0, 0, 0.1], 0, 0];
_fum setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 20, [0, 0, 0], [7, 7, 30], 2, 50, 5, 3, [20, 30, 40], [[0, 0, 0, 1], [0, 0, 0, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _poz,0,true,0.5,[[0,0,0,0]]];
_fum setDropInterval 0.01;

_li_end = "#lightpoint" createVehicleLocal _poz;
_li_end setLightIntensity 5000;
_li_end setLightDayLight true;	
_li_end setLightAttenuation [/*start*/ 800, /*constant*/100, /*linear*/ 100, /*quadratic*/ 0, /*hardlimitstart*/5,/* hardlimitend*/800]; 
_li_end setLightUseFlare true;
_li_end setLightFlareSize 100;
_li_end setLightFlareMaxDistance 2000;	
_li_end setLightAmbient[1, 0.5, 0];
_li_end setLightColor[1, 0.5, 0];
sleep 0.5;
playSound "earthquakes";
deleteVehicle _bolovani;
sleep 0.3;
deleteVehicle _fum;	
sleep 1.5;
deleteVehicle _li_end;