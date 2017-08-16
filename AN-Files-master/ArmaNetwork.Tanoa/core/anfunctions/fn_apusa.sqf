/*
	fn_pushVehicle.sqf
*/
private ["_vehicle", "_vel", "_dir", "_speed"];
params [["_pushNumber",0,[0]]];

_vehicle = life_vInact_curTarget;
if!(local _vehicle) exitWith {};
_vehicle allowdamage false;
_vel = velocity _vehicle;
_dir = direction player;
_speed = 0;

switch (_pushNumber) do {
	case 1: {_speed = 5};
	case 2: {_speed = 9};
	case 3: {_speed = 18};
};

_vehicle setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)  ];
_vehicle allowdamage true;
