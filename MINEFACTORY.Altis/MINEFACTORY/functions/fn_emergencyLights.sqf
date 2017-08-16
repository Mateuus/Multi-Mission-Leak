/*
	File: fn_copLights.sqf
	Author: Vincent H. aka AGPHeaddikilla aka Yoghurt aka Yogurette
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	Original Author: mindstorm, modified by Adanteh
    
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
private [];
_vehicle = _this select 0;
_sendUnit = _this select 1;
/*[
    status(bool),
    color(array),
    ambientColor(array),
    brightnessMin(scalar/integer),
    brightnessMax(scalar/integer),
    position(array),
    attenuation(array)
]*/
_defaultAttenuation = [0.181, 0, 1000, 130];
_lights = [];

switch (side _sendUnit) do {
    case west: {
        switch (typeOf _vehicle) do {
            case "C_Offroad_01_F": {
                _lights = [
                    [false,[0.0863, 0.5137, 0.9412],[0.1,0.1,1],0.05,20,[0.34,0,0.57],[]],
                    [true,[0.0863, 0.5137, 0.9412],[0.1,0.1,1],0.05,20,[-0.42,0,0.57],[]],
                    [false,[0.0863, 0.5137, 0.9412],[0.1,0.1,1],0.05,20,[-0.26,2.59,-0.48],[0.1, 0, 1000, 130]],
                    [true,[0.0863, 0.5137, 0.9412],[0.1,0.1,1],0.05,20,[0.175,2.59,-0.48],[0.1, 0, 1000, 130]]
                ];
            };
            case "C_SUV_01_F": {
                _lights = [
                    [false,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[-0.5,0,0.22],[0.3, 0, 100, 130]],
                    [true,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[0.5,0,0.22],[0.3, 0, 100, 130]]
                ];
            };
            case "C_Hatchback_01_F": {
                _lights = [
                    [false,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[-0.39,0,0.16],[0.3, 0, 100, 130]],
                    [true,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[0.34,0,0.16],[0.3, 0, 100, 130]]
                ];
            };
            case "B_Quadbike_01_F": {
                _lights = [
                    [false,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[0.27,1,-0.65],[0.07, 0, 1000, 130]],
                    [true,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[-0.28,1,-0.65],[0.07, 0, 1000, 130]]
                ];
            };
        };
    };
    case independent: {
        switch (typeOf _vehicle) do {
            case "C_Offroad_01_F": {
                _lights = [
                    [true,[0.0863, 0.5137, 0.9412],[0.1,0.1,1],0.05,20,[0.34,0,0.57],[]],
                    [false,[0.0863, 0.5137, 0.9412],[0.1,0.1,1],0.05,20,[-0.42,0,0.57],[]],
                    [false,[0.0863, 0.5137, 0.9412],[0.1,0.1,1],0.05,20,[-0.26,2.59,-0.48],[0.1, 0, 1000, 130]],
                    [true,[0.0863, 0.5137, 0.9412],[0.1,0.1,1],0.05,20,[0.175,2.59,-0.48],[0.1, 0, 1000, 130]]
                ];
            };
            case "C_SUV_01_F": {
                _lights = [
                    [false,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[-0.5,0,0.22],[0.3, 0, 100, 130]],
                    [true,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[0.5,0,0.22],[0.3, 0, 100, 130]]
                ];
            };
            case "C_Van_01_box_F": {
                _lights = [
                    [true,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[0.56,2.15,-0.8],[0.07, 0, 1000, 130]],
                    [false,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[-0.59,2.15,-0.8],[0.07, 0, 1000, 130]],
                    [false,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[0.72,0.68,0.65],[0.17, 0, 1000, 130]],
                    [true,[0.0863, 0.5137, 0.9412],[0.0863, 0.5137, 0.9412],0.05,20,[-0.72,0.68,0.65],[0.17, 0, 1000, 130]]
                ];
            };
        };
    };
};

if ((count _lights) <= 0) exitWith {};

/*[
    status(bool),
    color(array),
    ambientColor(array),
    brightnessMin(scalar/integer),
    brightnessMax(scalar/integer),
    position(array),
    attenuation(array)
]*/

_lightObjects = [];
{
    _light = "#lightpoint" createVehicle getpos _vehicle;
    _light setLightColor (_x select 1);
    _light setLightAmbient (_x select 2);
    _light lightAttachObject [_vehicle, (_x select 5)];
    
    if ((_x select 0)) then {
        _light setLightBrightness (_x select 4);
    } else {
        _light setLightBrightness (_x select 3);
    };
    
    if ((count (_x select 6)) <= 0) then {
        _light setLightAttenuation _defaultAttenuation;
    } else {
        _light setLightAttenuation (_x select 6);
    };
    
    _light setLightIntensity 10;
    _light setLightFlareSize 0.38;
    _light setLightFlareMaxDistance 150;
    _light setLightUseFlare true;
    _light setLightDayLight true;
    _lightObjects pushBack [_light, (_x select 0)];
} forEach _lights;

_light = ObjNull;
while {(alive _vehicle)} do  
{  
	if(!(_vehicle getVariable "lights")) exitWith {};
    {
        _light = (_x select 0);
        
        if ((_x select 1)) then {
            _minBrightness = ((_lights select _forEachIndex) select 3);
            _light setLightBrightness _minBrightness;
        } else {
            _maxBrightness = ((_lights select _forEachIndex) select 4);
            _light setLightBrightness _maxBrightness;
        };
        
        _active = ((_lightObjects select _forEachIndex) select 1);
        
        _lightObjects set [_forEachIndex, [
                ((_lightObjects select _forEachIndex) select 0),
                ( !_active )
            ]
        ];
    } forEach _lightObjects;
    
    if (isEngineOn _vehicle) then {
	   sleep 0.18;
    } else {
        sleep 0.3;
    };
};

{
    deleteVehicle (_x select 0);
} forEach _lightObjects;
