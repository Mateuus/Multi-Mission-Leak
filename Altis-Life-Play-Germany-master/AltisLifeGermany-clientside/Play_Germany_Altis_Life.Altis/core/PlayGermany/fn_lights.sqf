/*
	File: fn_lights.sqf
	Author: RafiQuak
	
	Description:
	Adds the single light effect to cop and medic vehicles.
	
	@Params:
	0: vehicle
	1: speed (phase time)
	2: color array
	3: lightpoint pos array
	4: (optional) brightness
*/
private ["_vehicle","_speed","_color","_position","_light","_lightOn"];
_vehicle = _this select 0;
_speed = _this select 1;
_color = _this select 2;
_position = _this select 3;
_brightness = [_this, 4, 6] call BIS_fnc_param;

if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};

//Create and ajust
_light = "#lightpoint" createVehicle getPos _vehicle;   
waitUntil {!(isNull _light)};
_light setLightColor _color; 
_light setLightBrightness _brightness;  
_light setLightAmbient [0.1,0.1,1];
_light lightAttachObject [_vehicle, _position];
_light setLightAttenuation [0.181, 0, 1000, 130]; 
_light setLightIntensity 10;
_light setLightFlareSize 0.01;
_light setLightFlareMaxDistance 150;
_light setLightUseFlare true;
_light setLightDayLight true;

//Do blink
_lightOn = false;  
while{(_vehicle getVariable "lights") && {alive _vehicle} } do  
{  
	if(_lightOn) then  
	{  
		_lightOn = false;
		_light setLightBrightness 0.0;
	}  
		else  
	{  
		_lightOn = true;
		_light setLightBrightness _brightness;
	};  
	sleep _speed;  
}; 

deleteVehicle _light;
