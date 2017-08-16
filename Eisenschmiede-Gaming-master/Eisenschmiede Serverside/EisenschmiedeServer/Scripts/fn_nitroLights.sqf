
    _vehicle = _this select 0;
    if (!isNil {_vehicle getVariable "nitroLights"}) then {
        _lightback = "#lightpoint" createVehicle getpos _vehicle;
        _lightback setLightDayLight true;
        _lightback setLightColor [0.5, 0.5, 5];
        _lightback setLightBrightness 10;
        _lightback setLightAmbient [0.5, 0.5, 5];
        _lightback lightAttachObject [_vehicle, [0, -7, 0]];
        _lightback setLightAttenuation [3, 0, 0, 0.6];

        waitUntil {isNil {_vehicle getVariable "nitroLights"}};
        deleteVehicle _lightback;
    } else {
    };
