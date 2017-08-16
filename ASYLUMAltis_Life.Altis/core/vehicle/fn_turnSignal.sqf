/*
	File: fn_turnSignal.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Adds/remove light objects for turn signal display
*/
Private ["_vehicle","_state","_brightness","_lightfront","_lightback"];
_vehicle = _this select 0;
_state = _this select 1;
	
if(isNil "_vehicle" OR isNull _vehicle) exitWith {};

if (_state < 1) exitWith {};
waitUntil {_state == _vehicle getVariable ["signal",0]};

_lightfront = "#lightpoint" createVehicleLocal getPos _vehicle;   
_lightfront setLightColor [1, 0.5, 0]; 
_lightfront setLightDayLight true;
_lightfront setLightBrightness 0.2;  
_lightfront setLightAmbient [1, 0.5, 0]; 
_lightfront setLightAttenuation [0.181, 0, 1000, 50]; 
_lightfront setLightIntensity 10;
_posfront = switch (typeOf _vehicle) do
{
	case "B_G_Offroad_01_F";
	case "B_G_Offroad_01_armed_F";
	case "C_Offroad_01_F": { [0.85, 2.1, -0.35] };
	case "C_Hatchback_01_F";
	case "C_Hatchback_01_sport_F": { [0.75, 1.8, -0.55] };
	case "C_Van_01_box_F";
	case "C_Van_01_transport_F": { [0.7, 2, -0.5] };
	case "C_SUV_01_F": { [0.9, 2, -0.5]; };
};
if (_state == 1) then { _posfront set [0, (_posfront select 0) * (-1)] };
_lightfront lightAttachObject [_vehicle, _posfront];

_lightback = "#lightpoint" createVehicleLocal getPos _vehicle;   
_lightback setLightColor [1, 0, 0]; 
_lightback setLightDayLight true;
_lightback setLightBrightness 0.2;  
_lightback setLightAmbient [1, 0, 0]; 
_lightback setLightAttenuation [0.181, 0, 1000, 50]; 
_lightback setLightIntensity 10;
_posback = switch (typeOf _vehicle) do
{
	case "B_G_Offroad_01_F";
	case "B_G_Offroad_01_armed_F";
	case "C_Offroad_01_F": { [0.9, -2.95, -0.2] };
	case "C_Hatchback_01_F";
	case "C_Hatchback_01_sport_F": { [0.75, -2.3, -0.3] };
	case "C_Van_01_box_F";
	case "C_Van_01_transport_F": { [0.7, -3.3, -0.9] };
	case "C_SUV_01_F": { [0.9, -2.8, -0.2]; };
};
if (_state == 1) then { _posback set [0, (_posback select 0) * (-1)] };
_lightback lightAttachObject [_vehicle, _posback];

_brightness = 0;
while{ (alive _vehicle) && _vehicle getVariable ["signal",-1] == _state } do  
{
	_brightness = if (_brightness == 0) then { 4 } else { 0 };
	_lightfront setLightBrightness _brightness;  
	_lightback setLightBrightness _brightness; 
	if (vehicle player == _vehicle) then { PlaySound "signal"; };
	sleep 0.8;  
};  
deleteVehicle _lightfront;
deleteVehicle _lightback;