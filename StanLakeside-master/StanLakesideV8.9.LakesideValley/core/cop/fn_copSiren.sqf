/*
	copsiren
	cop siren
	fn_copSiren.sqf
*/

params [["_vehicle", objNull, [objNull]]];

if(!hasInterface) exitWith {};
if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "sirenUC"}) exitWith {};
if(life_nospampls == 1) exitWith {};

life_nospampls = 1;

_lightRed = [20, 0.1, 0.1];
_lightBlue = [0.1, 0.1, 20];

_lightleft = "#lightpoint" createVehicle getpos _vehicle;   
uiSleep 0.2;
_lightleft setLightColor _lightRed; 
_lightleft setLightBrightness 0.2;  
_lightleft setLightAmbient [20, 0.1, 0.1];

_lightleft lightAttachObject [_vehicle, [-0.02, 0.0, -2.82]];

_lightleft setLightAttenuation [0.1, 0, 1000, 130]; 
_lightleft setLightIntensity 5;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 120;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicle getpos _vehicle;   
uiSleep 0.2;
_lightright setLightColor _lightBlue; 
_lightright setLightBrightness 0.2;  
_lightright setLightAmbient [0.1, 0.1, 20]; 

_lightright lightAttachObject [_vehicle, [0.02, 0.0, -2.82]];

_lightright setLightAttenuation [0.1, 0, 1000, 130]; 
_lightright setLightIntensity 5;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 120;
_lightright setLightUseFlare true;

_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;  

while {(_vehicle getVariable "sirenUC")} do
{
	if(!(_vehicle getVariable "sirenUC")) exitWith { uiSleep 3; life_nospampls = 0;  };
	if(count (crew (_vehicle)) == 0) exitwith { uiSleep 3; life_nospampls = 0; };
	if(!alive _vehicle) exitWith { uiSleep 3; life_nospampls = 0; };
	if(isNull _vehicle) exitWith { uiSleep 3; life_nospampls = 0; };
		_vehicle say3D "SirenLong";
	
		_leftRed = false;  
		_lightright setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightleft setLightBrightness 2;  
		uiSleep 0.45;

		_leftRed = true;  
		_lightleft setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightright setLightBrightness 2;  
		uiSleep 0.5;

		_leftRed = false;  
		_lightright setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightleft setLightBrightness 2;  
		uiSleep 0.5;

		_leftRed = true;  
		_lightleft setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightright setLightBrightness 2;  
		uiSleep 0.5;

		_leftRed = false;  
		_lightright setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightleft setLightBrightness 2;  
		uiSleep 0.5;

		_leftRed = true;  
		_lightleft setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightright setLightBrightness 2;  
		uiSleep 0.45;

		_leftRed = false;  
		_lightright setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightleft setLightBrightness 2;  
		uiSleep 0.5;

		_leftRed = true;  
		_lightleft setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightright setLightBrightness 2;  
		uiSleep 0.5;

		_leftRed = false;  
		_lightright setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightleft setLightBrightness 2;  
		uiSleep 0.5;

		_leftRed = true;  
		_lightleft setLightBrightness 0.5;  
		uiSleep 0.05;
		_lightright setLightBrightness 2;  
		uiSleep 0.45;

	if(life_nospampls == 1) then {
		life_nospampls = 0;
	};
	if(!(_vehicle getVariable "sirenUC")) exitWith { uiSleep 3; life_nospampls = 0; };
};

deleteVehicle _lightleft;
deleteVehicle _lightright;