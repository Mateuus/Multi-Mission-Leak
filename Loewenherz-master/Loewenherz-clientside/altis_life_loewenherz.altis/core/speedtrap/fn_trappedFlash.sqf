/*
	File: fn_trappedFlash.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	speedtrap is a speedtrap and sometimes a speedtrap
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/
private["_trap_object","_light","_brightness"];

_trap_object   = param [0,ObjNull,[ObjNull]];
if(isNull _trap_object) exitwith {};

//_light = createVehicleLocal ["#lightpoint", getPos _trap_object, [], 0, "CAN_COLLIDE"];
_light = "#lightpoint" createVehicleLocal getPos _trap_object;

//sleep 0.1;
_light setLightColor [20, 20, 20];
_light lightAttachObject [_trap_object, [0.0, 0.0, 0.5]];
_light setLightAttenuation [0.181, 0, 100, 130];
_light setLightIntensity 40;
_light setLightFlareSize 0.38;
_light setLightFlareMaxDistance 150;
_light setLightUseFlare true;
_light setLightDayLight true;

if (sunOrMoon < 1) then {
    _brightness = 6;
} else {
    _brightness = 50;
};
_light setLightBrightness _brightness;
sleep 0.1;
deleteVehicle _light;


