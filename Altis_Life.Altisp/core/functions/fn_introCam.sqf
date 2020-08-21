/*
	File: fn_introCam.sqf
	Author: Dexter
*/
private ["_camera", "_camDistance","_randCamX","_randCamY","_camTime"];
_camDistance = 1000;
_randCamX = 75 - floor(random 150);
_randCamY = 75 - floor(random 150);
_camTime = 5;// you can change the time for sure, I adjusted mine to the intro music

// the one below basically says that if you already joined the server once the time of the camera movement will be faster, else it might get annoying

if(!life_firstSpawn) then {
	_camTime = 10;
};
//intro move
playSound ["welcome",false];
showCinemaBorder true;
camUseNVG false;

_camera = "camera" camCreate [(position player select 0)+_randCamX, (position player select 1)+_randCamY,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 0.7;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
life_firstSpawn = false;
[] call life_fnc_welcomeNotification;
