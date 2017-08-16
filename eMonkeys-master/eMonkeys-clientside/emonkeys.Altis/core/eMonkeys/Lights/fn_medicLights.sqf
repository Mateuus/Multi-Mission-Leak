/*
	@Version: 1.0
	@Author: Tonic
	@Edited: 28.08.2013
*/

private ["_vehicle","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed","_brightness","_attach"];

if(!hasInterface && isServer) exitWith {};
_vehicle = _this select 0;


if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};
switch (typeOf _vehicle) do {
	case "C_Offroad_01_F":{_attach = [[-0.37, 0.0, 0.56],[0.37, 0.0, 0.56]];};
	case "C_SUV_01_F": {_attach = [[1.1,0.4,-0.05],[-1.1,0.4,-0.05]];};
	case "O_Truck_03_medical_F":{_attach = [[-1.2, 3.28, -0.9],[1.35, 3.28, -0.9]];};
	case "I_Truck_02_medical_F":{_attach = [[-1.2, 3.73, -0.6],[0.98, 3.73, -0.6]];};
	case "B_Truck_01_medical_F":{_attach = [[-1.35, 4.9, -0.45],[1.06, 4.9, -0.45]];};
	case "C_Hatchback_01_sport_F":{_attach = [[-0.62, 1.87, -0.52],[0.62, 1.87, -0.52]];};
	case "O_Heli_Light_02_unarmed_F":{_attach = [[-1, 3.2, -2],[1, 3.2, -2]];};
	case "B_Heli_Light_01_F":{_attach = [[-0.75, 1.7, -0.95],[0.75, 1.7, -0.95]];};
	case "C_Van_01_box_F":{_attach =  [[-0.7, -0.25, 1.5],[0.7, -0.25, 1.5]];};
};

_lightRed = [20, 0.1, 0.1];
_lightBlue = [0.1, 0.1, 20];

_lightleft = "#lightpoint" createVehiclelocal (getPos _vehicle);
uisleep 0.2;
_lightleft setLightColor _lightRed;
_lightleft setLightBrightness 0;
_lightleft lightAttachObject [_vehicle, _attach select 0];
_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.05;
_lightleft setLightFlareMaxDistance 120;
_lightleft setLightUseFlare false;
_lightleft setLightDayLight true;


_lightright = "#lightpoint" createVehiclelocal (getPos _vehicle);
uisleep 0.2;
_lightright setLightColor _lightBlue;
_lightright setLightBrightness 0;
_lightright lightAttachObject [_vehicle, _attach select 1];
_lightright setLightAttenuation [0.181, 0, 1000, 130];
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.05;
_lightright setLightFlareMaxDistance 120;
_lightright setLightUseFlare false;
_lightright setLightDayLight true;

if (sunOrMoon < 1) then {
	_brightness = 3;
} else {
	_brightness = 30;
};

_leftRed = true;  
while{ (alive _vehicle)} do  {  

	waitUntil {(player distance _vehicle < 130) OR !(_vehicle getVariable "lights")};
	if(!(_vehicle getVariable "lights")) exitWith {};

	if(_leftRed) then  {  
				_leftRed = false;  
				
				_lightright setLightBrightness 0;
				uisleep 0.1;
				_lightleft setLightBrightness _brightness;  

			}  
			else  
			{  
		_leftRed = true;  
		_lightleft setLightBrightness 0;  
		uisleep 0.05;
		_lightright setLightBrightness _brightness;  

			};  
	uisleep 0.22;
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;