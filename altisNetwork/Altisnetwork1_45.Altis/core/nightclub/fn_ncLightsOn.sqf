/* 
	File: fn_ncLightsOn.sqf
	Author: TinyBigJacko
	Date: Unknown
	Desc: Runs through all our lights and creates them, then proceeds to make them flash. Afterwards it deletes the lights when disabled.
*/
private ["_obj","_lightRd","_lightB","_lightL","_lightR","_leftRed","_lumens","_attach"];

_obj = _this select 0;
if (isNil "_obj" || isNull _obj || !(_obj getVariable "nclights")) exitWith {};

_attach = [[5, 0, 2], [-5, 0, 2],[0,5,2],[0,-5,2],[0,0,3]];

//Red
_lightRd = [255,45,30];
//Blue x
_lightB = [21, 0, 255];
//Yellow
_lightY = [234,255,0];
//Purple x
_lightPr = [170,15,170];
//Orange
_lightOr = [255,168,5];
//Lime Green x
_lightLg = [121,255,97];
//Pink
_lightPk = [234, 0, 255];
//Teal-ish x
_lightG = [0,255,181];

//_lightL = createVehicle ["#lightpoint", getPos _obj, [], 0, "CAN_COLLIDE"];
_lightL = "#lightpoint" createVehicleLocal (getPos _obj);
sleep 0.2;
_lightL setLightColor _lightRd;
_lightL setLightBrightness 0;
_lightL lightAttachObject [_obj, _attach select 0];
_lightL setLightAttenuation [0.181, 0, 1000, 130];
_lightL setLightIntensity 10;
_lightL setLightFlareSize 0.38;
_lightL setLightFlareMaxDistance 150;
_lightL setLightUseFlare true;
_lightL setLightDayLight true;
_lightL setLightAmbient [0.1,0.1,1];


//_lightR = createVehicle ["#lightpoint", getPos _obj, [], 0, "CAN_COLLIDE"];
_lightR = "#lightpoint" createVehicleLocal (getPos _obj);
sleep 0.2;
_lightR setLightColor _lightOr;
_lightR setLightBrightness 0;
_lightR lightAttachObject [_obj, _attach select 1];
_lightR setLightAttenuation [0.181, 0, 1000, 130];
_lightR setLightIntensity 10;
_lightR setLightFlareSize 0.38;
_lightR setLightFlareMaxDistance 150;
_lightR setLightUseFlare true;
_lightR setLightDayLight true;
_lightR setLightAmbient [0.1,0.1,1];

//_lightFw = createVehicle ["#lightpoint", getPos _obj, [], 0, "CAN_COLLIDE"];
_lightFw = "#lightpoint" createVehicleLocal (getPos _obj);
sleep 0.2;
_lightFw setLightColor _lightY;
_lightFw setLightBrightness 0;
_lightFw lightAttachObject [_obj, _attach select 2];
_lightFw setLightAttenuation [0.181, 0, 1000, 130];
_lightFw setLightIntensity 10;
_lightFw setLightFlareSize 0.38;
_lightFw setLightFlareMaxDistance 150;
_lightFw setLightUseFlare true;
_lightFw setLightDayLight true;
_lightFw setLightAmbient [0.1,0.1,1];

//_lightBk = createVehicle ["#lightpoint", getPos _obj, [], 0, "CAN_COLLIDE"];
_lightBk = "#lightpoint" createVehicleLocal (getPos _obj);
sleep 0.2;
_lightBk setLightColor _lightPk;
_lightBk setLightBrightness 0;
_lightBk lightAttachObject [_obj, _attach select 3];
_lightBk setLightAttenuation [0.181, 0, 1000, 130];
_lightBk setLightIntensity 10;
_lightBk setLightFlareSize 0.38;
_lightBk setLightFlareMaxDistance 150;
_lightBk setLightUseFlare true;
_lightBk setLightDayLight true;
_lightBk setLightAmbient [0.1,0.1,1];

//_lightUp = createVehicle ["#lightpoint", getPos _obj, [], 0, "CAN_COLLIDE"];
_lightUp = "#lightpoint" createVehicleLocal (getPos _obj);
sleep 0.2;
_lightUp setLightColor _lightB;
_lightUp setLightBrightness 0;
_lightUp lightAttachObject [_obj, _attach select 4];
_lightUp setLightAttenuation [0.181, 0, 1000, 130];
_lightUp setLightIntensity 10;
_lightUp setLightFlareSize 0.38;
_lightUp setLightFlareMaxDistance 150;
_lightUp setLightUseFlare true;
_lightUp setLightDayLight true;
_lightUp setLightAmbient [0.1,0.1,1];


if (sunOrMoon < 1) then {
	_lumens = 2;
} else {
	_lumens = 5;
};

_offset = 0.45; //seconds between
//L, Up, Fw, Up, R, Up, Bk, Up
while {(alive _obj)} do
 {
	if (!(_obj getVariable "nclights")) exitWith {};	
	_lightUp setLightBrightness 0;
	sleep 0.03;
	_lightL setLightBrightness _lumens;
	sleep _offset;
	_lightL setLightBrightness 0;
	sleep 0.03;
	_lightUp setLightColor _lightB;
	_lightUp setLightBrightness _lumens;
	sleep _offset;
	_lightUp setLightBrightness 0;
	sleep 0.03;
	_lightFw setLightBrightness _lumens;
	sleep _offset;
	_lightFw setLightBrightness 0;
	sleep 0.03;
	_lightUp setLightColor _lightPr;
	_lightUp setLightBrightness _lumens;
	sleep _offset;
	_lightUp setLightBrightness 0;
	sleep 0.03;
	_lightR setLightBrightness _lumens;
	sleep _offset;
	_lightR setLightBrightness 0;
	sleep 0.03;
	_lightUp setLightColor _lightLg;
	_lightUp setLightBrightness _lumens;
	sleep _offset;
	_lightUp setLightBrightness 0;
	sleep 0.03;
	_lightBk setLightBrightness _lumens;
	sleep _offset;
	_lightBk setLightBrightness 0;
	sleep 0.03;
	_lightUp setLightColor _lightG;
	_lightUp setLightBrightness _lumens;
	sleep _offset;
};
deleteVehicle _lightL;
deleteVehicle _lightR;
deleteVehicle _lightFw;
deleteVehicle _lightBk;
deleteVehicle _lightUp;