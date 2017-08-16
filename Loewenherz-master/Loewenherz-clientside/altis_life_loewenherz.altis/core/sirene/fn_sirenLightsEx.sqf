
/*
    Author: Blackd0g
    File: fn_sirenLightsEx.sqf

    Description:
    New version of vehicle siren lights (without performance issues)

    Parameters:
    vehicle object _this 1
    _lightpos Array  _this 2
    _lightcolor Array _this 3

    Returns:
    Nothing
*/
private ["_lightpos","_lightcolor","_lightColorRight","_lightColorLeft","_vehicle","_lightLeftPos","_lightLeft","_lightRightPos","_lightRight","_brightness"];
_vehicle = param [0,objNull,[objNull]];
_lightpos = param [1,[],[[]]];
_lightcolor = param [2,[],[[]]];

if (count _lightpos == 0 || count _lightcolor == 0) exitWith {};
if (isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};

//hint format ["_lightpos %1\n _lightcolor %2",_lightpos,_lightcolor];

_lightColorLeft = _lightcolor select 0;
_lightColorRight = _lightcolor select 1;

_lightLeftPos = _lightpos select 0;
_lightLeft = "#lightpoint" createVehicleLocal getPos _vehicle;
waitUntil {!isNil "_lightLeft"};
_lightLeft setLightColor _lightColorLeft;
_lightLeft setLightBrightness 0;
_lightLeft lightAttachObject [_vehicle,_lightLeftPos];
_lightLeft setLightAttenuation [0.181, 0, 1000, 130];
_lightLeft setLightIntensity 25;
_lightLeft setLightFlareSize 0.58;
_lightLeft setLightFlareMaxDistance 150;
_lightLeft setLightUseFlare true;
_lightLeft setLightDayLight true;

_lightRightPos = _lightpos select 1;
_lightRight = "#lightpoint" createVehicleLocal getPos _vehicle;
waitUntil {!isNil "_lightRight"};
_lightRight setLightColor _lightColorRight;
_lightRight setLightBrightness 0;
_lightRight lightAttachObject [_vehicle, _lightRightPos];
_lightRight setLightAttenuation [0.181, 0, 1000, 130];
_lightRight setLightIntensity 25;
_lightRight setLightFlareSize 0.58;
_lightRight setLightFlareMaxDistance 150;
_lightRight setLightUseFlare true;
_lightRight setLightDayLight true;

_brightness = 50;
if (sunOrMoon < 1) then {
	_brightness = 5;
};

// looping lights
[_lightLeft,_lightRight,_vehicle,_brightness,0.32] call lhm_fsm_fnc_sirenLightsLoop;
