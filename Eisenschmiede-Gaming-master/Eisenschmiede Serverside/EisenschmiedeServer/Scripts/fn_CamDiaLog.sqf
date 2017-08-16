ES_CamTa = _this select 0;
ES_StartDia = true;
_radius = 300;
_angle = (getDir player);
_altitude = 400;
_dir = 0;
_speed = 0.4;

_coords = [ES_CamTa, _radius, _angle] call BIS_fnc_relPos;
_coords set [2, _altitude];
_camera = "camera" camCreate _coords;
_camera cameraEffect ["INTERNAL","BACK"];
_camera camPrepareFOV 0.700;
_camera camPrepareTarget ES_CamTa;
_camera camCommitPrepared 0;
_pos = ES_CamTa;
cutText ["","BLACK IN"];

while {ES_StartDia} do {
	_coords = [ES_CamTa, _radius, _angle] call BIS_fnc_relPos;
	_coords set [2, _altitude];

	_camera camPreparePos _coords;
	_camera camCommitPrepared _speed;

	waitUntil {camCommitted _camera || !(ES_StartDia)};
	if (!(ES_StartDia)) then {
		_camera cameraEffect ["terminate","back"];
		camDestroy _camera;
	};
	if !(_pos isEqualTo ES_CamTa) then {
		_pos = ES_CamTa;
		_camera camPrepareTarget ES_CamTa;
		cutText ["","BLACK IN",7];
	};
	_camera camPreparePos _coords;
	_camera camCommitPrepared 0;
	_angle = if (_dir == 0) then {_angle - 1} else {_angle + 1};
};