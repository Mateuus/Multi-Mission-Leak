/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightBlue","_lightleft","_lightright","_leftRed","_lightRed"];
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightBlue = [0.1, 0.1, 20];
_lightRed = [20, 0.1, 0.1];

_lightleft = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_lightleft setLightColor _lightBlue;
_lightleft setLightBrightness 0.2;  
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
	case "B_T_LSV_01_unarmed_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.75, 0.59, -0.15]];
	};
	
	case "I_C_Offroad_02_unarmed_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.74, 0.5, 0.46]];
	};
	
	case "C_Offroad_02_unarmed_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.74, 0.5, 0.46]];
	};

	case "C_Offroad_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
	};
	
	case "C_Van_01_box_F":
	{
		_lightleft lightAttachObject [_vehicle, [1.00,-0.30, 1.400]];
	};
	
	case "B_MRAP_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
	};
	
	case "C_SUV_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37,-1.2,0.42]];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.6, 2, -0.95]];
	};
	
	case "I_MRAP_03_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
	};
	
	case "C_Hatchback_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.6, 2, -0.95]];
	};
	
	case "B_Truck_01_mover_F":
	{
		_lightleft lightAttachObject [_vehicle, [-1.2, 4.85, -0.45]];
	};
};

_lightleft setLightAttenuation [0.181, 0, 1000, 130]; 
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.05;
_lightleft setLightFlareMaxDistance 125;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_lightright setLightColor _lightRed; 
_lightright setLightBrightness 0.2;  
_lightright setLightAmbient [0.1,0.1,1]; 

switch (typeOf _vehicle) do
{
	case "B_T_LSV_01_unarmed_F":
	{
		_lightright lightAttachObject [_vehicle, [0.82, 0.59, -0.15]];
	};
	
	case "I_C_Offroad_02_unarmed_F":
	{
		_lightright lightAttachObject [_vehicle, [0.65, 0.5, 0.46]];
	};
	
	case "C_Offroad_02_unarmed_F":
	{
		_lightright lightAttachObject [_vehicle, [0.65, 0.5, 0.46]];
	};
	
	case "C_Offroad_01_F":
	{
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
	};
	
	case "C_Van_01_box_F":
	{
		_lightright lightAttachObject [_vehicle, [1.00,-0.30, 1.400]];
	};
	
	case "B_MRAP_01_F":
	{
		_lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
	};
	
	case "C_SUV_01_F":
	{
		_lightright lightAttachObject [_vehicle, [0.37,-1.2,0.42]];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_lightright lightAttachObject [_vehicle, [0.6, 2, -0.95]];
	};
	
	case "I_MRAP_03_F":
	{
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
	};
	
	case "C_Hatchback_01_F":
	{
		_lightright lightAttachObject [_vehicle, [0.6, 2, -0.95]];
	};
	
	case "B_Truck_01_mover_F":
	{
		_lightright lightAttachObject [_vehicle, [1.25, 4.85, -0.45]];
	};
};
  
_lightright setLightAttenuation [0.181, 0, 1000, 130]; 
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.05;
_lightright setLightFlareMaxDistance 125;
_lightright setLightUseFlare true;

//ARE YOU ALL HAPPY?!?!?!?!?!?!?!?!?%#?@WGD?TGD?BN?ZDHBFD?GA
_lightleft setLightDayLight true;
_lightright setLightDayLight true;

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