/*
    File: fn_medicLights.sqf
    Author: IxDeShina
*/

private ["_veh","_lightRed","_lightWhite","_lightBlue","_lightsOn","_brightnessHigh","_brightnessLow","_attach","_leftLights","_rightLights","_type","_attenuation"];

_veh = (_this select 0);
_type = typeOf _veh;
_sun = (sunOrMoon < 1);

if (isNil "_veh" || isNull _veh || !(_veh getVariable "lights")) exitWith {};

_lightRed = [255, 0, 0];
_lightWhite = [255, 255, 255];
_lightBlue = [255, 255, 0];

if (_sun) then
{
    _brightnessLow = 0;
    _brightnessHigh = 10;
    _attenuation = [0.001, 3000, 0, 125000];
} else {
    _brightnessLow = 0;
    _brightnessHigh = 60;
    _attenuation = [0.001, 3000, 0, 400000];
};

_flashes = 2;
_flashOn = 0.1;
_flashOff = 0.001;

_leftLights = [];
_rightLights = [];

_attach =
{
    _isLight = _this select 0;
    _color = _this select 1;
    _position = _this select 2;
    _light = "#lightpoint" createVehicleLocal getPos _veh;
    _light setLightBrightness 0;
    _light setLightAmbient [0,0,0];
    _light setLightAttenuation _attenuation;
    _light setLightIntensity 1000;
    _light setLightFlareSize 1;
    _light setLightFlareMaxDistance 150;
    _light setLightUseFlare true;
    _light setLightDayLight true;

    switch (_color) do
    {
        case "red": { _light setLightColor _lightRed; };
        case "white": { _light setLightColor _lightWhite; };
        case "blue": { _light setLightColor _lightBlue; };
    };

    if (_isLight) then
    {
        _leftLights pushBack [_light, _position];
    } else {
        _rightLights pushBack [_light, _position];
    };

    _light lightAttachObject [_veh, _position];
};

switch (_type) do
{
    case "C_Offroad_01_F":
    {
        [false, "red", [-.5,0,.45]] call _attach;
        [true, "red", [.5,0,.45]] call _attach;
        [false, "red", [-.5,0,.45]] call _attach;
        [true, "red", [.5,0,.45]] call _attach;
        [false, "white", [-.8,2.3,-.4]] call _attach;
        [true, "white", [.8,2.3,-.4]] call _attach;
    };

	case "C_Hatchback_01_F":
    {
        [false, "red", [.6,1.9,-.9]] call _attach;
        [true, "red", [-.7,1.9,-.95]] call _attach;
        [false, "red", [.6,1.9,-.9]] call _attach;
        [true, "red", [-.7,1.9,-.95]] call _attach;
        [false, "white", [.7,1.7,-.5]] call _attach;
        [true, "white", [-.8,1.7,-.5]] call _attach;
    };
	
	case "C_Hatchback_01_sport_F":
    {
        [false, "red", [.6,1.9,-.9]] call _attach;
        [true, "red", [-.7,1.9,-.95]] call _attach;
        [false, "red", [.6,1.9,-.9]] call _attach;
        [true, "red", [-.7,1.9,-.95]] call _attach;
        [false, "white", [.7,1.7,-.5]] call _attach;
        [true, "white", [-.8,1.7,-.5]] call _attach;
    };
	
    case "C_SUV_01_F":
    {
        [false, "red", [.75,1.95,-.45]] call _attach;
        [true, "red", [-.8,1.9,-.45]] call _attach;
        [false, "red", [.75,1.95,-.45]] call _attach;
        [true, "red", [-.8,1.9,-.45]] call _attach;
        [false, "white", [.4,2.2,-.53]] call _attach;
        [true, "white", [-.4,2.2,-.53]] call _attach;
    };
	
	case "C_Offroad_02_unarmed_F":
    {
        [false, "red", [.5,-.6,0.45]] call _attach;
        [true, "red", [-.6,-.65,0.45]] call _attach;
        [false, "red", [.5,-.6,0.45]] call _attach;
        [true, "red", [-.6,-.65,0.45]] call _attach;
        [false, "white", [.4,2,-0.4]] call _attach;
        [true, "white", [-.5,2,-0.4]] call _attach;
    };
	
	case "I_MRAP_03_F":
    {
        [false, "red", [.6,-.2,.5]] call _attach;
        [false, "red", [1,-3,.3]] call _attach;
		[true, "red", [-.6,-.2,.5]] call _attach;
        [true, "red", [-1,-3,.3]] call _attach;
		[false, "red", [.6,-.2,.5]] call _attach;
        [false, "red", [1,-3,.3]] call _attach;
		[true, "red", [-.6,-.2,.5]] call _attach;
        [true, "red", [-1,-3,.3]] call _attach;
        [false, "white", [.9,2.4,-.3]] call _attach;
        [true, "white", [-.9,2.4,-.3]] call _attach;
    };
};

_lightsOn = true;
while {(alive _veh)} do
{
    if (!(_veh getVariable "lights")) exitWith {};
    if (_lightsOn) then
    {
        for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
        {
            { (_x select 0) setLightBrightness _brightnessHigh; } forEach _leftLights;
            uiSleep _flashOn;
            { (_x select 0) setLightBrightness _brightnessLow; } forEach _leftLights;
            uiSleep _flashOff;
        };
        { (_x select 0) setLightBrightness 0; } forEach _leftLights;

        for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
        {
            { (_x select 0) setLightBrightness _brightnessHigh; } forEach _rightLights;
            uiSleep _flashOn;
            { (_x select 0) setLightBrightness _brightnessLow; } forEach _rightLights;
            uiSleep _flashOff;
        };
        { (_x select 0) setLightBrightness 0; } forEach _rightLights;
    };
};

{ deleteVehicle (_x select 0) } foreach _leftLights;
{ deleteVehicle (_x select 0) } foreach _rightLights;

_leftLights = [];
_rightLights = [];