/*
    File: fn_medicLights.sqf
    Author: [GSN] Pager & [GSN] Paronity
    Website: GSNGaming.com
    Date Created: 2.24.2015
    Date Modified: 2.25.2015 v1.2
*/

private ["_veh","_lightblue","_lightWhite","_lightblue","_lightsOn","_brightnessHigh","_brightnessLow","_attach","_leftLights","_rightLights","_type","_attenuation"];
if (isNil "BlaulichtMedic") then { BlaulichtMedic = false; };
_veh = (_this select 0);
_type = typeOf _veh;
_sun = (sunOrMoon < 1);

if (isNil "_veh" || isNull _veh || !(_veh getVariable "lights")) exitWith {};

_lightBlue = [0, 0, 255];
_lightWhite = [255, 255, 255];

if (_sun) then
{
    _brightnessLow = 0;
    _brightnessHigh = 60;
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
    _light setLightIntensity 1500;
    _light setLightFlareSize 1;
    _light setLightFlareMaxDistance 150;
    _light setLightUseFlare true;
    _light setLightDayLight true;

    switch (_color) do
    {
        case "blue": { _light setLightColor _lightBlue; };
        case "white": { _light setLightColor _lightWhite; };
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
    
    case "B_Quadbike_01_F":
    {
        [true, "blue", [-0.07, 1, -0.7]] call _attach;
        [false, "blue", [0.07, 1, -0.7]] call _attach;
    };
    
    case "C_Van_01_box_F":
    {
        If (BlaulichtMedic) then { [] spawn ES_fnc_blaulicht_medic; };
        sleep 0.2;
        [true, "blue", [-0.7, 0, 0.85]] call _attach;
        [false, "blue", [0.7, 0, 0.85]] call _attach;
        [true, "blue", [0.85, -3.37, 1.59]] call _attach;

    };
    
    case "C_Offroad_01_F":
    {
        [false, "blue", [-0.44, 0, 0.525]] call _attach;
        [true, "blue", [0.345, 0, 0.525]] call _attach;
        [false, "blue", [0.575, -2.95, -0.77]] call _attach;
        [true, "blue", [-0.645, -2.95, -0.77]] call _attach;
        [false, "white", [0.61, 2.2825, -0.355]] call _attach;
        [true, "white", [-0.695, 2.2825, -0.355]] call _attach;
    };

    case "C_SUV_01_F":
    {
        [false, "blue", [-0.39, 2.28, -0.52]] call _attach;
        [true, "blue", [0.38, 2.28, -0.52]] call _attach;
        [false, "blue", [-0.86, -2.75, -0.18]] call _attach;
        [true, "blue", [0.86, -2.75, -0.18]] call _attach;
        [false, "white", [0.8, 1.95, -0.48]] call _attach;
        [true, "white", [-0.8, 1.95, -0.48]] call _attach;

    };

    case "B_Heli_Light_01_F":
    {
        [true, "blue", [-0.37, 0.0, 0.56]] call _attach;
        [false, "blue", [0.37, 0.0, 0.56]] call _attach;
    };
    
    case "B_Heli_Transport_01_F":
    {
        [true, "blue", [-0.5, 0.0, 0.96]] call _attach;
        [false, "blue", [0.5, 0.0, 0.96]] call _attach;
    };

    case "B_Truck_01_mover_F":
    {
        If (BlaulichtMedic) then { [] spawn ES_fnc_blaulicht_medic; };
        sleep 0.2;
        [false, "blue", [-0.77, 4.55, -0.18]] call _attach;
        [true, "blue", [0.77, 4.55, -0.18]] call _attach;
        [true, "blue", [1, 4, 0.85]] call _attach;
        [false, "blue", [-1, 4, 0.85]] call _attach;
        [true, "blue", [-0.66, -1.35, -0.09]] call _attach;
        [true, "blue", [0.66, -1.35, -0.09]] call _attach;
        [false, "blue", [-0.66, -1.35, -0.09]] call _attach;
        [false, "blue", [0.66, -1.35, -0.09]] call _attach;
        [true, "white", [-0.95, 4.55, -0.18]] call _attach;
        [false, "white", [0.95, 4.55, -0.18]] call _attach;
    };

    case "I_Truck_02_box_F":
    {
        If (BlaulichtMedic) then { [] spawn ES_fnc_blaulicht_medic; };
        sleep 0.2;
        [true, "blue", [0.87, 3.1, 0.55]] call _attach;
        [false, "blue", [-0.87, 3.1, 0.55]] call _attach;
        [true, "blue", [-0.8, -3.5, 1]] call _attach;
        [false, "blue", [0.8, -3.5, 1]] call _attach;
        [true, "white", [-0.8, 3.7, -0.85]] call _attach;
        [false, "white", [0.8, 3.7, -0.85]] call _attach;
    };

    case "I_G_Van_01_fuel_F":
    {
        sleep 0.2;
        [false, "blue", [0.7,0.5,0.8]] call _attach;
        [true, "blue", [0.7,0.5,0.8]] call _attach;
        sleep 0.2;
        [false, "blue", [-0.7,0.5,0.8]] call _attach;
        [true, "blue", [-0.7,0.5,0.8]] call _attach;
    };
    
    case "B_Truck_01_transport_F":
    {
        If (BlaulichtMedic) then { [] spawn ES_fnc_blaulicht_medic; };
        sleep 0.2;
        [true, "blue", [1, 4, 0.55]] call _attach;
        [false, "blue", [-1, 4, 0.55]] call _attach;
        [true, "white", [-0.9, 4.95, -0.45]] call _attach;
        [false, "white", [1, 4.95, -0.45]] call _attach;
    };
    
    case "B_Heli_Transport_03_unarmed_F":
    {
        [true, "blue", [0.4, -5.58, 1.62]] call _attach;
        [false, "blue", [-0.55, -5.58, 1.62]] call _attach;
        [true, "blue", [-0.2, 6, -2.2]] call _attach;
        [false, "blue", [0.1, 6, -2.2]] call _attach;
        [true, "white", [-0.05, -5.5, 0.85]] call _attach;
        [false, "white", [-0.05, -5.4, 0.4]] call _attach;
    };
    
    case "O_Heli_Light_02_unarmed_F":
    {
        [true, "blue", [-0.5, 0, 1.05]] call _attach;
        [false, "blue", [0.5, 0, 1.05]] call _attach;
        [true, "blue", [0.15, 2.45, -1.95]] call _attach;
        [false, "blue", [-0.15, 2.45, -1.95]] call _attach;
    };
    
    case "O_Heli_Transport_04_ammo_black_F":
    {
        [true, "blue", [-3.8, -0.3, -0.7]] call _attach;
        [false, "blue", [3.645, -0.3, -0.7]] call _attach;
        [true, "blue", [-0.2, 3.5, -1.95]] call _attach;
        [false, "blue", [0, 3.5, -1.95]] call _attach;
    };

    case "O_Heli_Transport_04_F":
    {
        [true, "blue", [-3.8, -0.3, -0.7]] call _attach;
        [false, "blue", [3.645, -0.3, -0.7]] call _attach;
        [true, "blue", [-0.2, 3.5, -1.95]] call _attach;
        [false, "blue", [0, 3.5, -1.95]] call _attach;
    };
    
    case "I_Heli_light_03_unarmed_F":
    {
        [true, "blue", [-0.37, 0.0, 0.56]] call _attach;
        [false, "blue", [0.37, 0.0, 0.56]] call _attach;
    };
    
    case "C_Hatchback_01_sport_F":
    {
        [false, "blue", [-0.03, -0, 0.2]] call _attach;
        [true, "blue", [-0.03, -0, 0.2]] call _attach;
        [false, "blue", [-0.8, -2.25, -0.3]] call _attach;
        [true, "blue", [0.78, -2.25, -0.3]] call _attach;
        [false, "white", [0.75, 1.615, -0.52]] call _attach;
        [true, "white", [-0.8, 1.615, -0.525]] call _attach;
    };

    case "C_Hatchback_01_F":
    {
        [false, "blue", [-0.03, -0, 0.2]] call _attach;
        [true, "blue", [-0.03, -0, 0.2]] call _attach;
        [false, "blue", [-0.8, -2.25, -0.3]] call _attach;
        [true, "blue", [0.78, -2.25, -0.3]] call _attach;
        [false, "white", [0.75, 1.615, -0.52]] call _attach;
        [true, "white", [-0.8, 1.615, -0.525]] call _attach;
    };
    
    case "I_MRAP_03_F":
    {
        [false, "blue", [-0.87, 2.2, -0.75]] call _attach;
        [true, "blue", [0.87, 2.2, -0.75]] call _attach;
        [false, "blue", [-0.725, -3.15, 0.025]] call _attach;
        [true, "blue", [0.725, -3.25, 0.025]] call _attach;
        [false, "white", [1.05, 2.25, -0.3]] call _attach;
        [true, "white", [-1.05, 2.25, -0.3]] call _attach;
    };

    case "C_Offroad_02_unarmed_F":
    {
        [false, "blue", [0.48,2.0,-0.6]] call _attach;
        [true, "blue", [-0.55,2.0,-0.6]] call _attach;
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