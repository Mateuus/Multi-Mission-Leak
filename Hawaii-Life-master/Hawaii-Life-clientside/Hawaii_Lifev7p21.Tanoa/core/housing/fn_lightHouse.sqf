/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells clients to either turn the lights on for that house
	or off.
*/
private["_lightSource","_exit"];
params [
	["_house",objNull,[objNull]],
	["_mode",false,[false]]
];


if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

_exit = false;
if(_mode) then {
	_lightSource = "#lightpoint" createVehicleLocal [0,0,0];
	
	switch(true) do {
		case ((typeOf _house) in ["Land_House_Big_03_F"]): {_lightSource lightAttachObject [_house,[1.65, 0, 2.7]];};
		case ((typeOf _house) in ["Land_Slum_03_F"]): {_lightSource lightAttachObject [_house,[1.65, 0, 2.7]];};
		case ((typeOf _house) in ["Land_House_Small_03_F"]): {_lightSource lightAttachObject [_house,[-2, 1.6, 2.9]]};
		case ((typeOf _house) in ["Land_House_Small_04_F"]): {_lightSource lightAttachObject [_house,[2, 1, 2]]};
		case ((typeOf _house) in ["Land_House_Small_06_F"]): {_lightSource lightAttachObject [_house,[1.1, -1.5, 2.9]];};
		case ((typeOf _house) in ["Land_House_Small_02_F"]): {_lightSource lightAttachObject [_house,[-1.8, 0, 2.4]];};
		case ((typeOf _house) in ["Land_House_Small_05_F"]): {_lightSource lightAttachObject [_house,[1, 2, 2.7]];};
		case ((typeOf _house) in ["Land_Slum_01_F"]): {_lightSource lightAttachObject [_house,[0, 0, 3.2]];};
		default {_exit = true;};
	};
	if(_exit) exitWith {deleteVehicle _lightSource;};
	
	_lightSource setLightColor [250,150,50];
	_lightSource setLightAmbient [1,1,0.2];
	_lightSource setLightAttenuation [1,0,0,0];
	_lightSource setLightIntensity 10;
	_lightSource setLightUseFlare true;
	_lightSource setLightFlareSize 0.2;
	_lightSource setLightFlareMaxDistance 50;
	_house setVariable["lightSource",_lightSource];
} else {
	if(isNull (_house getVariable["lightSource",ObjNull])) exitWith {};
	deleteVehicle (_house getVariable["lightSource",ObjNull]);
};