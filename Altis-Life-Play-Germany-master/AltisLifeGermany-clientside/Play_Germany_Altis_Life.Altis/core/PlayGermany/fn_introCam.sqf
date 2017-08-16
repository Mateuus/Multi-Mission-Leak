/*
	File: fn_introCam.sqf
	Author: RafiQuak for Play Germany http://play-germany.de

	Description:
	Creates an intro cam
*/
private ["_camera", "_camDistance","_randCamX","_randCamY","_camTime","_sp"];
_camDistance = 100;
_randCamX = 75 - floor(random 150);
_randCamY = 75 - floor(random 150);
_camTime = 4;
_camTimeBetween = 5;
_camTimeFly = 10;

for "_x" from 0 to 20 do
{
   _x cutRsc ["introLife","PLAIN"];
};

_flyPos1 = switch (life_spawn_point select 0) do {
	case ("civ_spawn_1") : {[3089.5,12385.9,227.96];};
	case ("civ_spawn_2") : {[16735,14284,-30.8081];};
	case ("civ_spawn_3") : {[14758.7,16952.3,295.087];};
	case ("civ_spawn_4") : {[25031.6,22171.2,48.2877];};
	case ("reb_spawn_hq_1") : {[10626.1,8862.44,48.8315];};
	case ("bm_spawn_1") : {[10725,8575.66,67.9671];};
	case ("donator_spawn") : {[14871.7,20371.7,243.465];};
	case ("cop_spawn_1") : {[3089.5,12385.9,227.96];};
	case ("cop_spawn_2") : {[16735,14284,-30.8081];};
	case ("cop_spawn_3") : {[14041.9,15636.6,257.216];};
	case ("cop_spawn_5") : {[23422.3,17647.7,508.54];};
	case ("medic_spawn_1") : {[3089.5,12385.9,227.96];};
	case ("medic_spawn_2") : {[14041.9,15636.6,257.216];};
	case ("medic_spawn_3") : {[16735,14284,-30.8081];};
	case ("ASF_spawn") : {[15202.1,16825.8,425.196];};
	case ("cop_jail_spawn") : {[22396.2,13822,4.69275];};
	default {[(position player select 0) + 4 * _randCamX, (position player select 1) + 5 * _randCamY, (position player select 2) + 150];};
};

_flyPos2 = switch (life_spawn_point select 0) do {
	case ("civ_spawn_1") : {[3688.41,13476.3,230.226];};
	case ("civ_spawn_2") : {[16792.3,12573,685.777];};
	case ("civ_spawn_3") : {[14501.3,19092.9,267.428];};
	case ("civ_spawn_4") : {[26073.6,20863.2,267.638];};
	case ("reb_spawn_hq_1") : {[9840.4,8237.44,22.2116];};
	case ("bm_spawn_1") : {[11995.1,8801.64,217.173];};
	case ("donator_spawn") : {[14198,21683.9,131.156];};
	case ("cop_spawn_1") : {[3685.73,12506.9,50.9904];};
	case ("cop_spawn_2") : {[16792.3,12573,685.777];};
	case ("cop_spawn_3") : {[15202.1,16825.8,250];};
	case ("cop_spawn_5") : {[23156.6,20091,155.31];};
	case ("medic_spawn_1") : {[3688.41,13476.3,230.226];};
	case ("medic_spawn_2") : {[15202.1,16825.8,250.196];};
	case ("medic_spawn_3") : {[16792.3,12573,685.777];};
	case ("ASF_spawn") : {[14041.9,15636.6,427.216];};
	case ("cop_jail_spawn") : {[22205.3,14328.2,62.2974];};
	default {[(position player select 0) - 5 * _randCamX, (position player select 1) - 4 * _randCamY, (position player select 2) + 150];};
};

_flyTarget = switch (life_spawn_point select 0) do {
	case ("civ_spawn_1") : {[3616.4,13113.6,0];};
	case ("civ_spawn_2") : {[16805.5,12747.9,0];};
	case ("civ_spawn_3") : {[14027.5,18800,0];};
	case ("civ_spawn_4") : {[25701.8,21373.2,33.6524];};
	case ("reb_spawn_hq_1") : {[9673.51,8918.79,30.689];};
	case ("bm_spawn_1") : {[12293.8,8900.76,0];};
	case ("donator_spawn") : {[14192,21221.4,0];};
	case ("cop_spawn_1") : {[3271.18,12953.4,2];};
	case ("cop_spawn_2") : {[16805.5,12747.9,0];};
	case ("cop_spawn_3") : {[15750.7,17535.6,0];};
	case ("cop_spawn_5") : {[23000.6,19439.6,0];};
	case ("medic_spawn_1") : {[3754.43,12997.5,0];};
	case ("medic_spawn_2") : {[15579.2,17209.5,2];};
	case ("medic_spawn_3") : {[16805.5,12747.9,0];};
	case ("ASF_spawn") : {[12810,16692,0];};
	case ("cop_jail_spawn") : {[22158.6,14470.9,0];};
	default {position player;};
};

// intro move
showCinemaBorder true;
camUseNVG false;

//load Terrain
//waitUntil {preloadCamera _flyPos1};

// intro music
player say2D "pgintrork";

//create
_camera = "camera" camCreate _flyPos1;
_camera cameraEffect ["internal","back"];
_camera camSetTarget _flyTarget;
_camera camSetFOV 0.7;
_camera camCommit 0;
waitUntil {camCommitted _camera};

//fly over
_camera camSetPos _flyPos2;
_camera camCommit _camTimeFly;
waitUntil {camCommitted _camera};

//transition
_camera camSetPos [(position player select 0)+_randCamX, (position player select 1)+_randCamY,(position player select 2)+_camDistance];
_camera camSetTarget vehicle player;
_camera camSetFOV 2.000;
_camera camCommit _camTimeBetween;
waitUntil {camCommitted _camera};

//zoom down
_camera camSetRelPos [0,0,2];
_camera camCommit _camTime;
waitUntil {camCommitted _camera};

//clean up
_camera cameraEffect ["terminate","back"];
camDestroy _camera;

life_firstSpawn = false;
//[] call life_fnc_hudSetup;
[] call life_fnc_welcomeNotification;