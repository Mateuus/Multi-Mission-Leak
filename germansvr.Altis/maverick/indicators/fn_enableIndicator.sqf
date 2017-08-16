scriptName "fn_enableIndicator";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_enableIndicator.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_enableIndicator.sqf"

_vehicle  	= param[0,objNull,[objNull]];
_ind 		= param[1,"",[""]];

// Ex
if (isNull _vehicle || _ind == "") exitWith {};

// Check if the wanted indicator status is the same as the running one, if yes just turn the indicators off
if ((_vehicle getVariable ["indicator_mode",""]) == _ind) exitWith {
	[_vehicle] call mav_indicator_fnc_disableIndicator;
};

// Disable indicators first before setting up a new one
[_vehicle] call mav_indicator_fnc_disableIndicator;

// Get vehicle offsets
_offsets = [typeOf _vehicle] call mav_indicator_fnc_getVehicleIndicatorOffsets;

// Expception
if ((_offsets select 0) isEqualTo [0,0,0]) exitWith {};

// Give vehicle var
_vehicle setVariable ["indicator_mode",_ind];

// Var for later use
_lights = [];

// Enable indicator
if (_ind == "left") then {
	_left_front_offset = _offsets select 0;
	_left_back_offset = _offsets select 2;

	_light_front_left = "#lightpoint" createVehicle [1,1,1];
	_light_front_left setLightColor [0.9,0.41,0];
	_light_front_left setLightBrightness 2;
	_light_front_left setLightAmbient [0.9,0.41,0];
	_light_front_left setLightIntensity 10;
	_light_front_left setLightFlareSize 0.38;
	_light_front_left setLightFlareMaxDistance 150;
	_light_front_left setLightUseFlare true;
	_light_front_left setLightDayLight true;
	_light_front_left lightAttachObject [_vehicle, _left_front_offset];

	_light_back_left = "#lightpoint" createVehicle [1,1,1];
	_light_back_left setLightColor [0.9,0.41,0];
	_light_back_left setLightBrightness 2;
	_light_back_left setLightAmbient [0.9,0.41,0];
	_light_back_left setLightIntensity 10;
	_light_back_left setLightFlareSize 0.38;
	_light_back_left setLightFlareMaxDistance 150;
	_light_back_left setLightUseFlare true;
	_light_back_left setLightDayLight true;
	_light_back_left lightAttachObject [_vehicle, _left_back_offset];


	_lights pushBack _light_back_left;
	_lights pushBack _light_front_left;
	_vehicle setVariable ["indicator_left_objects", [_light_front_left, _light_back_left]];
};

if (_ind == "right") then {
	_right_front_offset = _offsets select 1;
	_right_back_offset = _offsets select 3;

	_light_front_right = "#lightpoint" createVehicle [1,1,1];
	_light_front_right setLightColor [0.9,0.41,0];
	_light_front_right setLightBrightness 2;
	_light_front_right setLightAmbient [0.9,0.41,0];
	_light_front_right setLightIntensity 10;
	_light_front_right setLightFlareSize 0.38;
	_light_front_right setLightFlareMaxDistance 150;
	_light_front_right setLightUseFlare true;
	_light_front_right setLightDayLight true;
	_light_front_right lightAttachObject [_vehicle, _right_front_offset];

	_light_back_right = "#lightpoint" createVehicle [1,1,1];
	_light_back_right setLightColor [0.9,0.41,0];
	_light_back_right setLightBrightness 2;
	_light_back_right setLightAmbient [0.9,0.41,0];
	_light_back_right setLightIntensity 10;
	_light_back_right setLightFlareSize 0.38;
	_light_back_right setLightFlareMaxDistance 150;
	_light_back_right setLightUseFlare true;
	_light_back_right setLightDayLight true;
	_light_back_right lightAttachObject [_vehicle, _right_back_offset];

	_lights pushBack _light_back_right;
	_lights pushBack _light_front_right;
	_vehicle setVariable ["indicator_right_objects", [_light_front_right, _light_back_right]];
};

if (_ind == "warn") then {
	_left_front_offset = _offsets select 0;
	_left_back_offset = _offsets select 2;
	_right_front_offset = _offsets select 1;
	_right_back_offset = _offsets select 3;

	_light_front_left = "#lightpoint" createVehicle [1,1,1];
	_light_front_left setLightColor [0.9,0.41,0];
	_light_front_left setLightBrightness 2;
	_light_front_left setLightAmbient [0.9,0.41,0];
	_light_front_left setLightIntensity 10;
	_light_front_left setLightFlareSize 0.38;
	_light_front_left setLightFlareMaxDistance 150;
	_light_front_left setLightUseFlare true;
	_light_front_left setLightDayLight true;
	_light_front_left lightAttachObject [_vehicle, _left_front_offset];

	_light_back_left = "#lightpoint" createVehicle [1,1,1];
	_light_back_left setLightColor [0.9,0.41,0];
	_light_back_left setLightBrightness 2;
	_light_back_left setLightAmbient [0.9,0.41,0];
	_light_back_left setLightIntensity 10;
	_light_back_left setLightFlareSize 0.38;
	_light_back_left setLightFlareMaxDistance 150;
	_light_back_left setLightUseFlare true;
	_light_back_left setLightDayLight true;
	_light_back_left lightAttachObject [_vehicle, _left_back_offset];

	_light_front_right = "#lightpoint" createVehicle [1,1,1];
	_light_front_right setLightColor [0.9,0.41,0];
	_light_front_right setLightBrightness 2;
	_light_front_right setLightAmbient [0.9,0.41,0];
	_light_front_right setLightIntensity 10;
	_light_front_right setLightFlareSize 0.38;
	_light_front_right setLightFlareMaxDistance 150;
	_light_front_right setLightUseFlare true;
	_light_front_right setLightDayLight true;
	_light_front_right lightAttachObject [_vehicle, _right_front_offset];

	_light_back_right = "#lightpoint" createVehicle [1,1,1];
	_light_back_right setLightColor [0.9,0.41,0];
	_light_back_right setLightBrightness 2;
	_light_back_right setLightAmbient [0.9,0.41,0];
	_light_back_right setLightIntensity 10;
	_light_back_right setLightFlareSize 0.38;
	_light_back_right setLightFlareMaxDistance 150;
	_light_back_right setLightUseFlare true;
	_light_back_right setLightDayLight true;
	_light_back_right lightAttachObject [_vehicle, _right_back_offset];

	_lights pushBack _light_back_left;
	_lights pushBack _light_front_left;
	_lights pushBack _light_back_right;
	_lights pushBack _light_front_right;
	_vehicle setVariable ["indicator_warn_objects", [_light_front_left, _light_back_left, _light_front_right, _light_back_right]];
};

// Check if its day and make the light brither
if (sunOrMoon > 0.75) then {
	{
        _x setLightBrightness 10;
    } forEach _lights;
} else {
	{
		_x setLightBrightness 2;
	} forEach _lights;
};

{
	_x setLightAttenuation [0.181, 0, 1000, 250];
} forEach _lights;

// Script to power lights
mav_indicators_enginethread = [_lights, getNumber(missionConfigFile >> "Maverick_Indicators" >> "IndicatorVehicle_Base" >> "blinkInterval"),_vehicle] spawn {
	while {alive (_this select 2) AND !isNull (_this select 2)} do {
		sleep (_this select 1);
		{
			_x setLightBrightness 0;
		} forEach (_this select 0);
		sleep (_this select 1);
		{
			if (sunOrMoon > 0.75) then {
        		_x setLightBrightness 10;
		    } else {
		        _x setLightBrightness 2;
		    };
			//_x setLightBrightness 0.07;
		} forEach (_this select 0);
	};

	// Vehicle destroyed, delete indicators
	{
		deleteVehicle _x;
	} forEach (_this select 0);
};