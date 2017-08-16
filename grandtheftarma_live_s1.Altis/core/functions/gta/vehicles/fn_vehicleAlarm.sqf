/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_vehicle", "_alarm" ];
_vehicle = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
if (_vehicle getVariable ["alarm", false]) exitWith {};
_vehicle setVariable ["alarm", true];
_alarm = 0;

while { _alarm < 48 } do {

	if ( ( _alarm / 4 ) % 1 == 0 ) then {

		if ( player distance _vehicle < 300 ) then {

			_vehicle say3D "AlarmCar"

		};

	};

	if ( local _vehicle ) then {

		player action [ "LightOn", _vehicle ];
		sleep 0.25;

		player action [ "LightOff", _vehicle ];
		sleep 0.22;

	} else {

		sleep 0.5;

	};

	_alarm = _alarm + 1;

};

_vehicle setVariable ["alarm", false];
