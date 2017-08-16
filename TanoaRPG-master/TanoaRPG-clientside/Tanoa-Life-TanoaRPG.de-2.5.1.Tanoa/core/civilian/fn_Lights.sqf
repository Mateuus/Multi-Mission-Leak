/*
    File: fn_Lights.sqf
    Author: CooliMC
    
    Description:
    Adds the light effect to the cart!
*/
Private ["_vehicle","_lightmid"];
_vehicle = _this select 0;
    
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};

_lightmid = "#lightpoint" createVehicle getpos _vehicle; 

sleep 0.2;

_lightmid setLightColor [1,1,1]; 
_lightmid setLightBrightness 2.2;  
_lightmid attachTo [_vehicle, [0.0, 1.9, -0.8]];

_lightmid setLightDayLight true;

while{ (alive _vehicle)} do  
{  
    if(!(_vehicle getVariable "lights")) exitWith {};
    sleep (_this select 1);  
};
deleteVehicle _lightmid;