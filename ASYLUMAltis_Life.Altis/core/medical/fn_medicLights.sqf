/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh and John "Paratus" VanderZwet
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad (suv added by Asylum).
*/
Private ["_vehicle","_lightYellow","_lightWhite","_lightleft","_lightright","_leftRed","_lightleft2","_lightright2"];
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightYellow = [20, 20, 0.1];
_lightWhite = [20, 20, 20];

_lightleft = "#lightpoint" createVehicleLocal getpos _vehicle;   
sleep 0.2;
_lightleft setLightColor _lightYellow; 
_lightleft setLightDayLight true;
_lightleft setLightBrightness 0.2;  
_lightleft setLightAmbient [0.1,0.1,1]; 

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F": { _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]]; };
	case "C_SUV_01_F": { _lightleft lightAttachObject [_vehicle, [-0.55, 0.6, -0.1]]; };
};

_lightleft setLightAttenuation [0.181, 0, 1000, 130]; 
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicleLocal getpos _vehicle;

sleep 0.2;
_lightright setLightColor _lightWhite; 
_lightright setLightDayLight true;
_lightright setLightBrightness 0.2;  
_lightright setLightAmbient [0.1,0.1,1]; 

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F": { _lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]]; };
	case "C_SUV_01_F": { _lightright lightAttachObject [_vehicle, [0.55, 0.6, -0.1]]; };
};

_lightright setLightAttenuation [0.181, 0, 1000, 130]; 
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;

_leftRed = true;  
while{ (alive _vehicle)} do  
{  
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then  
	{  
		_leftRed = false;  
		_lightright setLightBrightness 0.0;
		sleep 0.05;
		_lightleft setLightBrightness 6;  
	}  
		else  
	{  
		_leftRed = true;  
		_lightleft setLightBrightness 0.0;  
		sleep 0.05;
		_lightright setLightBrightness 6;  
	};  
	sleep (_this select 1);  
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;