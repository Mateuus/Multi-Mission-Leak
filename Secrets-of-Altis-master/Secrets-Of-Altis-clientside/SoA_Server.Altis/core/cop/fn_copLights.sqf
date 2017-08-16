/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightBlue","_lightleft","_lightright","_leftRed"];
_vehicle = _this select 0;

if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightBlue = [0, 0, 22];

_lightleft = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_lightleft setLightColor _lightBlue; 
_lightleft setLightBrightness 0.2;  
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F":				{			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];	};	
	case "C_SUV_01_F":					{			_lightleft attachTo [_vehicle, [-0.4, 2.3, -0.55]];	};
	case "B_MRAP_01_F": 				{			_lightleft attachTo [_vehicle, [-1, -2.8, 0.55]]; 		};
	case "C_Hatchback_01_F": 			{			_lightleft attachTo [_vehicle, [-0.6, 2, -0.95]]; 		};		
	case "C_Hatchback_01_sport_F":		{			_lightleft attachTo [_vehicle, [-0.6, 2, -0.95]]; 		};
	case "B_Heli_Light_01_F": 			{ 			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];	};
	case "B_Heli_Transport_01_F": 		{			_lightleft attachTo [_vehicle, [-0.5, 0.0, 0.96]]; 	};
	case "I_MRAP_03_F":					{			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]]; 	};	
	

};

_lightleft setLightAttenuation [0.181, 0, 1000, 130]; 
_lightleft setLightIntensity 15;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare false;

_lightright = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_lightright setLightColor _lightBlue; 
_lightright setLightBrightness 0.2;  
_lightright setLightAmbient [0.1,0.1,1]; 

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F":				{			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];	};	
	case "C_SUV_01_F":					{			_lightright attachTo [_vehicle, [0.4, 2.3, -0.52]];	};
	case "B_MRAP_01_F": 				{			_lightright attachTo [_vehicle, [1, -2.8, 0.55]]; 		};
	case "C_Hatchback_01_F": 			{			_lightright attachTo [_vehicle, [0.6, 2, -0.95]]; 		};	
	case "C_Hatchback_01_sport_F":		{			_lightright attachTo [_vehicle, [0.6, 2, -0.95]]; 		};
	case "B_Heli_Light_01_F": 			{ 			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];	};
	case "B_Heli_Transport_01_F": 		{			_lightright attachTo [_vehicle, [0.5, 0.0, 0.96]]; 	};
	case "I_MRAP_03_F":					{			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]]; 	};	
};
  
_lightright setLightAttenuation [0.181, 0, 1000, 130]; 
_lightright setLightIntensity 15;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare false;

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
		sleep 0.10;
		_lightleft setLightBrightness 6;  
	}  
		else  
	{  
		_leftRed = true;  
		_lightleft setLightBrightness 0.0;  
		sleep 0.10;
		_lightright setLightBrightness 6;  
	};  
	sleep (_this select 1);  
};

deleteVehicle _lightleft;
deleteVehicle _lightright;