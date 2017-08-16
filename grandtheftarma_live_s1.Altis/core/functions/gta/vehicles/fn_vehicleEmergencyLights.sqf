/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#define VAR_LOOP #GTA_fnc_vehicleEmergencyLights_loop
#define VAR_LIGHTS #GTA_fnc_vehicleEmergencyLights_lights

if (!hasInterface) exitWith {};

params [
  ["_vehicle", objNull, [objNull]],
  ["_active", true, [true]]
];

//--- Terminate existing script
terminate (_vehicle getVariable [VAR_LOOP, scriptNull]);

//--- Delete existing lights
{
  deleteVehicle _x;
} forEach (_vehicle getVariable [VAR_LIGHTS, []]);

if (_active) then {
  //--- Enable
  _vehicle setVariable ["emergencyLights", true];

  //--- Light colors (TODO: Config based solution)
  private _lightColors = switch true do {
    case ([driver _vehicle] call GTA_fnc_isHATO): {[[1, 0.3, 0], [1, 0.4, 0], 20]}; //--- HATO lights
    default {[[0.1, 0.1, 1], [1, 0.1, 0.1], 6]};
  };

  //--- Extract to private variables
  _lightColors params ["_leftColor", "_rightColor", "_brightness"];

  //--- Create lights
  private _lightLeft = "#lightpoint" createVehicleLocal [0, 0, 0];
  private _lightRight = "#lightpoint" createVehicleLocal [0, 0, 0];
  _vehicle setVariable [VAR_LIGHTS, [_lightLeft, _lightRight]];

  //--- Setup lights
  {
    _x setLightBrightness 0;
    _x setLightAttenuation [0, 0, 1000, 130];
    _x setLightIntensity 10;
    _x setLightFlareSize 0.38;
    _x setLightFlareMaxDistance 150;
    _x setLightUseFlare true;
    _x setLightDayLight true;
  } forEach [_lightLeft, _lightRight];

  //--- Set light colors
  _lightLeft setLightColor _leftColor;
  _lightLeft setLightAmbient _leftColor;
  _lightRight setLightColor _rightColor;
  _lightRight setLightAmbient _rightColor;

  //--- Attach lights to vehicle (TODO: Config based solution)
  switch (typeOf _vehicle) do {
    case "B_G_Offroad_01_F";
    case "B_G_Offroad_01_armed_F": {
      _lightLeft lightAttachObject [_vehicle, [-0.25, 2.45, -0.45]];
      _lightRight lightAttachObject [_vehicle, [0.25, 2.45, -0.45]];
    };

    case "C_Offroad_01_repair_F";
    case "C_Offroad_01_F": {
      _lightLeft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
      _lightRight lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };

    case "C_Van_01_fuel_F";
    case "C_Van_01_box_F";
    case "C_Van_01_transport_F": {
      _lightLeft lightAttachObject [_vehicle, [-0.6, 0, 0.77]];
      _lightRight lightAttachObject [_vehicle, [0.6, 0, 0.77]];
    };

    case "I_Truck_02_box_F": {
      _lightLeft lightAttachObject [_vehicle, [-0.6, 1.3, 0.55]];
      _lightRight lightAttachObject [_vehicle, [0.6, 1.3, 0.55]];
    };

    case "B_MRAP_01_F": {
      _lightLeft lightAttachObject [_vehicle, [-0.50, 1.5, -0.68]];
      _lightRight lightAttachObject [_vehicle, [0.50, 1.5, -0.68]];
    };

    case "C_SUV_01_F": {
      _lightLeft lightAttachObject [_vehicle, [-0.37,-1.2,0.42]];
      _lightRight lightAttachObject [_vehicle, [0.37,-1.2,0.42]];
    };

    case "C_Hatchback_01_F": {
      _lightLeft lightAttachObject [_vehicle, [-0.6, 2.0, -0.95]];
      _lightRight lightAttachObject [_vehicle, [0.6, 2.0, -0.95]];
    };

    case "C_Hatchback_01_sport_F": {
      _lightLeft lightAttachObject [_vehicle, [-0.6, 2.0, -0.95]];
      _lightRight lightAttachObject [_vehicle, [0.6, 2, -0.95]];
    };

    case "I_MRAP_03_F": {
      _lightLeft lightAttachObject [_vehicle, [-0.9, 2.1, -0.8]];
      _lightRight lightAttachObject [_vehicle, [0.9, 2.1, -0.8]];
    };
  };

  //--- Loop
  private _loop = [_vehicle, _lightLeft, _lightRight, _brightness] spawn {
    params ["_vehicle", "_lightLeft", "_lightRight", "_brightness"];

    while {
      !isNull _vehicle
      && {!isNull _lightLeft}
      && {!isNull _lightRight}
      && {alive _vehicle}
      && {_vehicle getVariable ["emergencyLights", false]}
    } do {
      _lightRight setLightBrightness 0;
      _lightLeft setLightBrightness _brightness;
      sleep 0.22;
      _lightLeft setLightBrightness 0;
      _lightRight setLightBrightness _brightness;
      sleep 0.22;
    };

    //--- Delete lights if vehicle is null
    if (isNull _vehicle) then {
      {
        deleteVehicle _x;
      } forEach [_lightLeft, _lightRight];
    };
  };

  //--- Store loop handle
  _vehicle setVariable [VAR_LOOP, _loop];
} else {
  //--- Disable
  _vehicle setVariable ["emergencyLights", false];
};
