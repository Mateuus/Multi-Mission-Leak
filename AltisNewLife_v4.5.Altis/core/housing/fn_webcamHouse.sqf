#include <macro.h>
/*
	Author: Sink (Al Morise) - ALI Server
	
	Description:
	Security house webcam
	
*/
private["_robber","_action","_camera","_timetoWait","_building","_target"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_target = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _robber OR isNull _building) exitWith {}; // nope
_timetoWait = time + 30;
_action = [format ["Voulez vous regarder la video ?"],"Webcam video","Oui","Non"] call BIS_fnc_guiMessage;
if(_action) then {
	if(time >= _timetoWait) exitWith {hint "Vous avez attendu trop longtemps avant de regarder la video !";};
	hint "Mise en cache de la video...";
	disableSerialization;
	_camera = "CAMERA" camCreate (getPos _robber);
	showCinemaBorder TRUE;
	_camera cameraEffect ["Internal","Back"];
	_camera camSetTarget _robber;
	if(_target == _building) then {
		_camera camSetRelPos [0,-11,8];
	} else {
		_camera camSetRelPos [0,11,8];
	};
	_camera camSetFOV 1;
	_camera camSetFocus [50,0];
	_camera camCommit 0;
	uiSleep 10;
	_camera cameraEffect ["TERMINATE","BACK"];
	camDestroy _camera;
	hint "Fin de la video.";
};