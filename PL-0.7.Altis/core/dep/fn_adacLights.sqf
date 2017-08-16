/*---------------------------------------------------------------------------
	File: fn_copLights.sqf
	Author: Skrow & Skyfezzer
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
---------------------------------------------------------------------------*/

private ["_vehicle","_adaclightRed","_adaclightBlue","_adaclightleft","_adaclightright","_leftRed","_brightness","_attach"];

_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "adaclights")) exitWith {};

switch (typeOf _vehicle) do {
	case "C_Offroad_01_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; };
	case "C_SUV_01_F": { _attach = [[-0.4, 2.3, -0.55], [0.4, 2.3, -0.55]]; };
	case "B_Truck_01_mover_F": { _attach = [[-0.5, 5, -0.25], [0.5, 5, -0.25]]; };
};

_adaclightRed = [255, 174, 7];
_adaclightBlue = [255, 174, 7];

_adaclightleft = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_adaclightleft setLightColor _adaclightRed;
_adaclightleft setLightBrightness 0;
_adaclightleft lightAttachObject [_vehicle, _attach select 0];
_adaclightleft setLightAttenuation [0.181, 0, 1000, 130];
_adaclightleft setLightIntensity 10;
_adaclightleft setLightFlareSize 0.38;
_adaclightleft setLightFlareMaxDistance 50;
_adaclightleft setLightUseFlare true;
_adaclightleft setLightDayLight true;

_adaclightright = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_adaclightright setLightColor _adaclightBlue;
_adaclightright setLightBrightness 0;
_adaclightright lightAttachObject [_vehicle, _attach select 1];
_adaclightright setLightAttenuation [0.181, 0, 1000, 130];
_adaclightright setLightIntensity 10;
_adaclightright setLightFlareSize 0.38;
_adaclightright setLightFlareMaxDistance 50;
_adaclightright setLightUseFlare true;
_adaclightright setLightDayLight true;

if (sunOrMoon < 1) then {
	_brightness = 1;
} else {
	_brightness = 10;
};

_leftRed = true;  
while {(alive _vehicle)} do { 
	if (!(_vehicle getVariable "adaclights")) exitWith {};
	if (_leftRed) then {  
		_leftRed = false;  
		_adaclightright setLightBrightness 0;  
		sleep 0.08;
		_adaclightleft setLightBrightness _brightness;
	} else {  
		_leftRed = true;  
		_adaclightleft setLightBrightness 0;  
		sleep 0.08;
		_adaclightright setLightBrightness _brightness;
	};
	sleep 0.22;  
};  
deleteVehicle _adaclightleft;
deleteVehicle _adaclightright;