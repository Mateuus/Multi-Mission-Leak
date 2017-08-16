#include "../script_macros.hpp"

if(FETCH_CONST(ES_adminlevel) >= 5) exitWith {hint "Wilkommen Boss!"; ES_firstDia = false; ES_firstSpawn = false; [] call ES_fnc_hudSetup; 	if(ES_NachrichtDialog) then { createDialog "ES_NachrichtenDialog"; };};

[] call SOCK_fnc_updateRequest;

private ["_camera", "_camDistance","_randCamX","_randCamY","_camTime"];
_camDistance = 399;
_randCamX = 75 - floor(random 150);
_randCamY = 75 - floor(random 150);

_camTime = 5;

showCinemaBorder true;
camUseNVG false;

_camera = "camera" camCreate [(position player select 0)+_randCamX, (position player select 1)+_randCamY,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 1.0;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
ES_firstDia = false;
[] call ES_fnc_hudSetup;
if(ES_NachrichtDialog) then { createDialog "ES_NachrichtenDialog"; };
sleep 11;
ES_firstSpawn = false;