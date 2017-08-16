//https://forums.bistudio.com/topic/176943-360%C2%B0-camera-rotation-cam-scripting/
cameratarget = _this select 0;
if(Camrunning) exitWith {};
Camrunning = true; // set to false to stop the camera
_radius = 300; // circle radius
_angle = (getDir player); // starting angle
_altitude = 200; // camera altitude
_dir = 0; //Direction of camera movement 0: anti-clockwise, 1: clockwise
_speed = 0.4; //lower is faster
_coords = [cameratarget, _radius, _angle] call BIS_fnc_relPos;
_coords set [2,_altitude];
_camera = "camera" camCreate _coords;
_camera cameraEffect ["INTERNAL","BACK"];
_camera camPrepareFOV 0.700;
_camera camPrepareTarget cameratarget;
_camera camCommitPrepared 0;
_pos = cameratarget;
cutText ["","BLACK IN"];
/*
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[1];
"DynamicBlur" ppEffectCommit 0;
*/
while {Camrunning} do {
	_coords = [cameratarget, _radius, _angle] call BIS_fnc_relPos;
	_coords set [2, _altitude];
	_camera camPreparePos _coords;
	_camera camCommitPrepared _speed;
	waitUntil {camCommitted _camera || !(Camrunning)};
	if (!(Camrunning)) then {
		//cutText["","BLACK OUT"];
		_camera cameraEffect ["terminate","back"];
		camDestroy _camera;
	};
	if !(_pos isEqualTo cameratarget) then {
		_pos = cameratarget;
		_camera camPrepareTarget cameratarget;
	};
	_camera camPreparePos _coords;
	_camera camCommitPrepared 0;
	_angle = if(_dir isEqualTo 0) then {_angle - 1} else {_angle + 1};
};
