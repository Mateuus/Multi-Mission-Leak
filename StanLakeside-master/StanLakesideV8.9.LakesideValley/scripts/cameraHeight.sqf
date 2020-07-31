 
private ["_camera", "_camDistance"];
  
_camDistance = 4500;
waitUntil {!deadPlayer};
 
showCinemaBorder true;
camUseNVG false;
 
for "_x" from 0 to 20 do 
{
   _x cutRsc ["introLife","PLAIN"];
};
 
_camera = "camera" camCreate [(position player select 0)+5, position player select 1,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];
_camera camSetTarget vehicle player;
_camera camSetFOV 1.000;
_camera camCommit 2;
 
waitUntil {camCommitted _camera};
 
_camera camSetFOV 4.000;
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,-10,20];
_camera camCommit 5;
 
waitUntil {camCommitted _camera};
 
_camera camSetFOV 2.000;
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,-1.5,2];
_camera camCommit 1;
 
waitUntil {camCommitted _camera};
 
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,-1,1.85];
_camera camCommit 2;
 
waitUntil {camCommitted _camera};
 
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,-0.05,1.85];
_camera camCommit 0.15;
 
waitUntil {camCommitted _camera};
 
_camera cameraEffect ["terminate","back"];
 
camDestroy _camera;
