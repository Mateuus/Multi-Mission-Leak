#include "..\..\macros.hpp"
/*
	Author: Sink(Al Morise)	Modified by: Division Wolf e.V. Description: Security house webcam. 
*/
private["_robber","_action","_camera","_timetoWait","_building","_target"];
_building = param [0,ObjNull,[ObjNull]];
_robber = param [1,ObjNull,[ObjNull]];
_target = param [2,ObjNull,[ObjNull]];

if(isNull _robber OR isNull _building) exitWith {};
_timetoWait = (time + 30);
_action = [format ["Akzeptierst du das Live-Video?"],"Live-Video","Ja","Nein"] call BIS_fnc_guiMessage;

if(_action) then
{
	if(time >= _timetoWait) exitWith {hint "Du wartest zu lang, um das Video zu sehen!";};
	hint "Verarbeite das Video...";
	disableSerialization;
	_camera = "CAMERA" camCreate (getPos _robber);
	showCinemaBorder TRUE;
	_camera cameraEffect ["Internal","Back"];
	_camera camSetTarget _robber;
	if(_target == _building) then
	{
		_camera camSetRelPos [0,-11,8];
	}
	else
	{
		_camera camSetRelPos [0,11,8];
	};
	_camera camSetFOV 1;
	_camera camSetFocus [50,0];
	_camera camCommit 0;
	sleep 10;
	_camera cameraEffect ["TERMINATE","BACK"];
	camDestroy _camera;
	hint "Live-Video beendet.";
};