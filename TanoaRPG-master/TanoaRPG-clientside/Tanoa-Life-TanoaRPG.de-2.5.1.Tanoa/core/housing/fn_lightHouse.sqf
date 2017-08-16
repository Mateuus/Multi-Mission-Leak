/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells clients to either turn the lights on for that house
	or off.
	
	Edited:
	By CooliMC for Apex
	Restricted are now only used positions
*/
private["_house","_mode","_lightSource","_exit"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = [_this,1,false,[true]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
_exit = false;
if(_mode) then {
	_lightSource = "#lightpoint" createVehicleLocal [0,0,0];
	
	switch(true) do {
		case ((typeOf _house) in ["Land_Slum_03_F"]): {_lightSource lightAttachObject [_house,[0.5,2,2]];};
		case ((typeOf _house) in ["Land_Hotel_02_F"]): {_lightSource lightAttachObject [_house,[-0.25,0.8,0]];};
		case ((typeOf _house) in ["Land_House_Big_02_F"]): {_lightSource lightAttachObject [_house,[-2.5,4.4,1]];};
		case ((typeOf _house) in ["Land_School_01_F"]): {_lightSource lightAttachObject [_house,[-0.1,0.75,1.65]];};
		case ((typeOf _house) in ["Land_House_small_05_F"]): {_lightSource lightAttachObject [_house,[-1.12,2,1.67]];};
		case ((typeOf _house) in ["Land_House_Small_06_F"]): {_lightSource lightAttachObject [_house,[-1.12,-1.5,2.7]];};
		case ((typeOf _house) in ["Land_House_Small_02_F"]): {_lightSource lightAttachObject [_house,[-1.8,0,1.5]];};
		case ((typeOf _house) in ["Land_House_Small_04_F"]): {_lightSource lightAttachObject [_house,[1,0,2.5]];};
		case ((typeOf _house) in ["Land_House_Big_01_F"]): {_lightSource lightAttachObject [_house,[3.68,2.35,1.75]];};
		case ((typeOf _house) in ["Land_House_Small_03_F"]): {_lightSource lightAttachObject [_house,[-1.05,1.6,1.3]];};
		case ((typeOf _house) in ["Land_House_Big_04_F"]): {_lightSource lightAttachObject [_house,[-2,0,3]];};
		case ((typeOf _house) in ["Land_Addon_04_F"]): {_lightSource lightAttachObject [_house,[0.4,-1.75,3]];};
		case ((typeOf _house) in ["Land_FuelStation_01_workshop_F"]): {_lightSource lightAttachObject [_house,[0.1,-2.55,1.7]];};
		case ((typeOf _house) in ["Land_House_Big_03_F"]): {_lightSource lightAttachObject [_house,[4,-0.25,1.1]];};
		case ((typeOf _house) in ["Land_GarageShelter_01_F"]): {_lightSource lightAttachObject [_house,[0,0.25,1.1]];};
		case ((typeOf _house) in ["Land_Slum_01_F"]): {_lightSource lightAttachObject [_house,[2,-0.05,3]];};
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