scriptName "fn_enableLight";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_enableLight.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_enableLight.sqf"

_vehicle = param[0,objNull,[objNull]];

// Ex
if (isNull _vehicle) exitWith {};

// Disable light
[_vehicle] call mav_tuning_fnc_disableLight;

// Var for later use
_light = [];

// Enable light
if (true) then {
	_light = "#lightpoint" createVehicle [1,1,1];
	_light setLightColor ((_vehicle getVariable "mav_tuning") select 4);
	_light setLightIntensity 30;
	_light setLightFlareSize 0.38;
	_light setLightFlareMaxDistance 150;
	_light setLightUseFlare false;
	_light setLightDayLight true;
	_light lightAttachObject [_vehicle, [0,0,-1.5]];
	_light setLightAmbient ((_vehicle getVariable "mav_tuning") select 4);

	_vehicle setVariable ["mav_tuning_light", _light];
};

// Check if its day and make the light brither
//if (dayTime < 19.16 AND dayTime > 5.12) then {
if (dayTime < 19.16 AND dayTime > 5.12) then {
    _light setLightBrightness 6;
} else {
	_light setLightBrightness 0.3;
};

//_light setLightAttenuation [0.181, 0, 1000, 250];

// Script to power lights
[_light,_vehicle] spawn {
	while {!isNull (_this select 0) AND !isNull (_this select 1)} do {
		sleep 1;
		if (dayTime < 19.16 AND dayTime > 5.12) then {
        	(_this select 0) setLightBrightness 6;
		} else {
		    (_this select 0) setLightBrightness 0.3;
		};
	};

	deleteVehicle (_this select 0);
};