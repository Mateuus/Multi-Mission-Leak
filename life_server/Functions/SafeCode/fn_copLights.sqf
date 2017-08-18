/*
	File: fn_copLights.sqf
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
private ["_vehicle", "_quadbike", "_offroad", "_SUV", "_hatchback", "_hunter", "_hummingbird", "_huron", "_hellcat", "_orca", "_ghosthawk", "_lightRed", "_lightBlue", "_lightBrightRed", "_lightBrightBlue", "_lightHighBrightness", "_lightLowBrightness", "_lightAttenuation", "_lightFlareSize", "_lightFlareMaxDistance", "_numStrobes", "_strobeTimeOn", "_strobeTimeOff", "_offsetMultiplier", "_emergencyLights", "_extraLights", "_lightBrightWhite", "_lightWhite", "_lightIntensity", "_lightIntensityDay", "_lightFlareSizeDay", "_lightIntensityNight", "_lightFlareSizeNight","_lightUseFlare"];

_vehicle = (_this select 0);
if(_vehicle getVariable ["lights", false]) exitWith {};

_vehicle setVariable ["lights", true, false];

_modeChanged = true;

while {_modeChanged && !isNil "_vehicle" && !isNull _vehicle && _vehicle getVariable ["lights",false]} do {

    _emergencyLights = _vehicle getVariable ["emergencyLights", false];

    _quadbike = typeOf _vehicle == "B_Quadbike_01_F";
    _offroad = typeOf _vehicle == "C_Offroad_01_F";
    _SUV = typeOf _vehicle == "C_SUV_01_F";
    _hatchback = typeOf _vehicle == "C_Hatchback_01_sport_F";
    _hunter = typeOf _vehicle == "B_MRAP_01_F";

    _hummingbird = typeof _vehicle == "B_Heli_Light_01_F";
    _huron = typeof _vehicle == "B_Heli_Transport_03_F";
    _hellcat = typeof _vehicle == "I_Heli_light_03_unarmed_F";
    _orca = typeof _vehicle == "O_Heli_Light_02_unarmed_F";
    _ghosthawk = typeof _vehicle == "B_Heli_Transport_01_F";

    if(!(_quadbike || _offroad || _SUV || _hatchback || _hunter || _hummingbird || _huron || _hellcat || _orca || _ghosthawk)) exitWith{};

    _extraLights = _emergencyLights && !_quadbike;

    _lightBrightRed = [1, 0, 0];
    _lightBrightBlue = [0, 0, 1];
    _lightBrightWhite = [1, 1, 1];
    _lightRed = [7.5, 0, 0];
    _lightBlue = [0, 0, 7.5];
    _lightWhite = [1, 1, 1];

    _lightHighBrightness = 10;
    _lightLowBrightness = 0.01;
    _lightAttenuation = [0.01, 0, 0, 130];
    _lightIntensityDay = 10;
    _lightIntensityNight = 10;
    _lightFlareSizeDay = 0.38;
    _lightFlareSizeNight = 0.38;
    _lightFlareMaxDistance = 150;
    _lightUseFlare = true;
    _offsetMultiplier = 0.07;

    if (sunOrMoon < 1) then {
        _lightIntensity = _lightIntensityNight;
        _lightFlareSize = _lightFlareSizeNight;
    } else {
        _lightIntensity = _lightIntensityDay;
        _lightFlareSize = _lightFlareSizeDay;
    };

    _numStrobes = 3;
    _strobeTimeOn = 0.1;
    _strobeTimeOff = 0.06;

    _alphaLights = [];
    _betaLights = [];

    _attachLight = {
        _isAlpha = _this select 0;
        _colour = _this select 1;
        _position = _this select 2;
        _light = "#lightpoint" createVehicleLocal [100000,100000,100000];
        _light setLightDayLight true;
        _light setLightAttenuation _lightAttenuation;
        _light setLightIntensity _lightIntensity;
        _light setLightFlareSize _lightFlareSize;
        _light setLightFlareMaxDistance _lightFlareMaxDistance;
        _light setLightUseFlare _lightUseFlare;

        switch (_colour) do {
            case "blue": {
                _light setLightColor _lightBrightBlue;
                _light setLightColor _lightBlue;
            };
            case "red": {
                _light setLightColor _lightBrightRed;
                _light setLightColor _lightRed;
            };
            case "white": {
                _light setLightColor _lightBrightWhite;
                _light setLightColor _lightWhite;
            };
        };

        if(_isAlpha) then {
            _alphaLights = _alphaLights + [[_light, _position]];
        } else {
            _betaLights = _betaLights + [[_light, _position]];
        };
        _light attachTo [_vehicle, _position];
    };

    if(_quadbike) then {
        _offsetMultiplier = 0.07;
        [true, "blue", [-0.07, 1, -0.7]] call _attachLight;
        [false, "red", [0.07, 1, -0.7]] call _attachLight;
    };

    if(_offroad) then {
        _offsetMultiplier = 0.069;
        if(_extraLights) then {
            [false, "red", [-0.45, 0.0, 0.56]] call _attachLight;
            [true, "blue", [0.35, 0.0, 0.56]] call _attachLight;

            [true, "blue", [0.17, 2.655, -0.49]] call _attachLight;
            [false, "red", [-0.25, 2.655, -0.49]] call _attachLight;

            [false, "white", [0.67, 2.175, -0.35]] call _attachLight;
            [true, "white", [-0.77, 2.175, -0.355]] call _attachLight;

            [false, "red", [-0.875, -2.875, -0.31]] call _attachLight;
            [true, "blue", [0.825, -2.875, -0.30]] call _attachLight;

            [true, "blue", [-0.645, -2.95, -0.77]] call _attachLight;
            [false, "red", [0.575, -2.95, -0.77]] call _attachLight;
        } else {
            [false, "red", [0.35, 0.0, 0.56]] call _attachLight;
        };
    };

    if(_SUV) then {
        _offsetMultiplier = 0.067;
        [true, "white", [0.79, 1.95, -0.48]] call _attachLight;
        [false, "white", [-0.80, 1.95, -0.48]] call _attachLight;
        if(_extraLights) then {
            [true, "red", [-0.39, 2.28, -0.52]] call _attachLight;
            [false, "blue", [0.38, 2.28, -0.52]] call _attachLight;

            [false, "blue", [-0.6, -2.925, -0.24]] call _attachLight;
            [true, "red", [0.59, -2.925, -0.24]] call _attachLight;

            [true, "red", [-0.86, -2.75, -0.18]] call _attachLight;
            [false, "blue", [0.86, -2.75, -0.18]] call _attachLight;
        } else {
            [true, "red", [-0.5, -1, 0.37]] call _attachLight;
        };
    };

    if(_hatchback) then {
        _offsetMultiplier = 0.072;
        [true, "blue", [-0.03, -0, 0.2]] call _attachLight;
        [false, "red", [-0.03, -0, 0.2]] call _attachLight;
        if(_extraLights) then {
            [false, "white", [0.75, 1.615, -0.52]] call _attachLight;
            [true, "white", [-0.8, 1.615, -0.525]] call _attachLight;

            [true, "blue", [0.20, 2.15, -0.61]] call _attachLight;
            [false, "red", [-0.25, 2.15, -0.61]] call _attachLight;

            [true, "blue", [0.78, -2.25, -0.3]] call _attachLight;
            [false, "red", [-0.8, -2.25, -0.3]] call _attachLight;

            [true, "blue", [-0.55, -2.46, -0.3]] call _attachLight;
            [false, "red", [0.48, -2.46, -0.3]] call _attachLight;
        };
    };

    if(_hunter) then {
        _offsetMultiplier = 0.072;
        [true, "blue", [-0.5, 1.5, -0.7]] call _attachLight;
        [false, "red", [0.5, 1.5, -0.7]] call _attachLight;

        [false, "blue", [-0.4, -1.2, 0.55]] call _attachLight;
        [true, "red", [0.4, -1.2, 0.55]] call _attachLight;

        if(_extraLights) then {
            [true, "red", [-0.8, -0.6, -1.3]] call _attachLight;
            [false, "blue", [0.8, -0.6, -1.3]] call _attachLight;

            [false, "red", [0.8, -2.5, -1.3]] call _attachLight;
            [true, "blue", [-0.8, -2.5, -1.3]] call _attachLight;

            [true, "red", [-0.95, -4.25, -0.75]] call _attachLight;
            [false, "blue", [0.95, -4.25, -0.75]] call _attachLight;
        };
    };

    if(_hummingbird) then {
        [true, "red", [-0.3, 1.82, -0.6]] call _attachLight;
        [false, "blue", [0.3, 1.82, -0.6]] call _attachLight;

        if(_extraLights) then {
            [false, "blue", [-0.8, 1.25, -1]] call _attachLight;
            [true, "red", [0.8,  1.25, -1]] call _attachLight;

            [true, "blue", [0.8, -0.2, -1]] call _attachLight;
            [false, "red", [-0.8, -0.2, -1]] call _attachLight;

            [false, "blue", [0.08, -4.55, 1.25]] call _attachLight;
            [true, "red", [0.14, -4.55, 1.25]] call _attachLight;

            [true, "blue", [0.07, -4.05, -0.1]] call _attachLight;
            [false, "red", [0.14, -4.05, -0.1]] call _attachLight;
        };
    };

    if(_huron) then {
        [true, "red", [-0.4, 8.5, -1.85]] call _attachLight;
        [false, "blue", [0.4, 8.5, -1.85]] call _attachLight;

        if(_extraLights) then {
            [false, "red", [-2.05, 3.5, -1.9]] call _attachLight;
            [true, "blue", [1.9,  3.5, -1.9]] call _attachLight;

            [true, "blue", [-2.05, -1, -1.9]] call _attachLight;
            [false, "red", [1.9, -1, -1.9]] call _attachLight;

            [false, "red", [-1.65, -3.85, -1]] call _attachLight;
            [true, "red", [0.8, -5.33, -0.1]] call _attachLight;

            [true, "blue", [-0.9, -5.33, -0.1]] call _attachLight;
            [false, "blue", [1.55, -3.85, -1]] call _attachLight;
        };
    };

    if(_hellcat) then {
        [true, "blue", [-0.37, 6.25, -0.93]] call _attachLight;

        if(_extraLights) then {
            [false, "blue", [0.37, 6.25, -0.93]] call _attachLight;

            [false, "red", [-1.2, 3.85, -1.5]] call _attachLight;
            [true, "blue", [1.2, 3.85, -1.5]] call _attachLight;

            [true, "blue", [0.5, -0.26, -0.17]] call _attachLight;
            [false, "red", [-0.5, -0.26, -0.17]] call _attachLight;

            [false, "red", [-1.26, -4.35, -0.05]] call _attachLight;
            [true, "red", [1.25, -4.35, -0.05]] call _attachLight;

            [true, "blue", [-1.26, -3.95, -0.64]] call _attachLight;
            [false, "blue", [1.25, -3.95, -0.64]] call _attachLight;
        } else {
            [false, "red", [0.37, 6.25, -0.93]] call _attachLight;
        };
    };

    if(_orca) then {
        [true, "blue", [-0.37, 5.2, -1.7]] call _attachLight;

        if(_extraLights) then {
            [false, "blue", [0.37, 5.2, -1.7]] call _attachLight;

            [false, "red", [-0.9, 3, -1.5]] call _attachLight;
            [true, "red", [0.9, 3, -1.5]] call _attachLight;

            [true, "blue", [0.8, -1, 0.4]] call _attachLight;
            [false, "blue", [-0.8, -1, 0.4]] call _attachLight;

            [true, "red", [-1.35, -4.9, 0]] call _attachLight;
            [false, "red", [1.35, -4.9, 0]] call _attachLight;

            [false, "blue", [-1.35, -4.64, -0.77]] call _attachLight;
            [true, "blue", [1.35, -4.64, -0.77]] call _attachLight;
        } else {
            [false, "red", [0.37, 5.2, -1.7]] call _attachLight;
        };
    };

    if(_ghosthawk) then {
        [true, "blue", [0.7, 6.85, -1.25]] call _attachLight;

        if(_extraLights) then {
            [false, "blue", [-0.7, 6.85, -1.25]] call _attachLight;

            [false, "red", [-1.1, 2.9, -1.56]] call _attachLight;
            [true, "red", [1.2, 2.9, -1.56]] call _attachLight;

            [true, "blue", [0.65, -0.7, -0.2]] call _attachLight;
            [false, "blue", [-0.55, -0.7, -0.2]] call _attachLight;

            [false, "red", [-0.04, -7.1, 0.7]] call _attachLight;
            [true, "blue", [0.19, -7.1, 0.7]] call _attachLight;

            [true, "blue", [-0.15, -6, -0.85]] call _attachLight;
            [false, "red", [0.25, -6, -0.85]] call _attachLight;
        } else {
            [false, "red", [-0.7, 6.85, -1.25]] call _attachLight;
        };
    };

    _modeChanged = false;

    while{(alive _vehicle && _vehicle getVariable ["lights",false] && !_modeChanged)} do
    {
        // turn on the first set, strobe them if desired
        for [{_i=0}, {_i<_numStrobes}, {_i=_i+1}] do {
            {
                (_x select 0) setLightBrightness _lightHighBrightness;
            } forEach _alphaLights;
            sleep _strobeTimeOn;
            {
                (_x select 0) setLightBrightness _lightLowBrightness;
            } forEach _alphaLights;
            sleep _strobeTimeOff;
        };
        {
            (_x select 0) setLightBrightness 0;
        } forEach _alphaLights;


        // turn on the second set, strobe them if desired
        for [{_i=0}, {_i<_numStrobes}, {_i=_i+1}] do {
            {
                (_x select 0) setLightBrightness _lightHighBrightness;
            } forEach _betaLights;
            sleep _strobeTimeOn;
            {
                (_x select 0) setLightBrightness _lightLowBrightness;
            } forEach _betaLights;
            sleep _strobeTimeOff;
        };
        {
            (_x select 0) setLightBrightness 0;
        } forEach _betaLights;

        // has someone changed our lighting mode?
        _modeChanged = (_vehicle getVariable ["emergencyLights",false] && !_emergencyLights) || (!(_vehicle getVariable ["emergencyLights", false]) && _emergencyLights);
    };

    {
        deleteVehicle (_x select 0);
    } forEach _alphaLights;
    {
        deleteVehicle  (_x select 0);
    } forEach _betaLights;
    _alphaLights = [];
    _betaLights = [];
};