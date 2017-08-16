/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Handles mechanic vehicle lights
*/

private ["_vehicle","_lightArray","_lightPos","_counter","_isDaytime","_light","_lightLeft","_lightRight","_leftRed","_brightness"];

_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_lightArray = [_this,1,["",[0,0,0],[0,0,0]],[[]]] call BIS_fnc_param;

_counter = 0;

//Daytime check
_isDaytime = false;
if((daytime > 7.2)&&(daytime < 17.2))then{_isDaytime = true;};

//Creates a light
_DS_fnc_createLight =
    {
        _lightPos = [_this,0,[0,0,0],[[]]] call BIS_fnc_param;

    	_light = "#lightpoint" createVehicle (getPosATL _vehicle);
    	_light setLightBrightness 3;
    	_light setLightFlareSize 0.38;
        _light setLightColor [20,20,0.1];
        _light setLightAttenuation [0.181,0,1000,130];
		_light setLightAmbient [0.1,0.1,1];
    	_light setLightIntensity 7;
    	_light setLightFlareMaxDistance 150;
    	_light setLightUseFlare true;
    	_light setLightDayLight true;
    	_light lightAttachObject [_vehicle,_lightPos];

    	_light
    };

//Create the lights
_lightLeft = [_lightArray select 1] call _DS_fnc_createLight;
_lightRight = [_lightArray select 2] call _DS_fnc_createLight;

//Lights loop
_leftRed = true;
_brightness = 3;
if(_isDaytime)then{_brightness = 6;};

while {alive _vehicle} do
    {
	if(!(_vehicle getVariable ["sirens",false]))exitwith{};

	if (_leftRed) then
        {
		_leftRed = false;
		_lightRight setLightBrightness 0;
		sleep 0.05;
		_lightLeft setLightBrightness _brightness;
	    }
        else
        {
		_leftRed = true;
		_lightLeft setLightBrightness 0;
		sleep 0.05;
		_lightRight setLightBrightness _brightness;
	};

	if(count crew _vehicle == 0)then{_counter = _counter + 1;};
	if(_counter > 200)exitwith{_vehicle setVariable ["sirens",false,true]};

	sleep 0.22;
    };

//Remove the lights
deleteVehicle _lightLeft;
deleteVehicle _lightRight;