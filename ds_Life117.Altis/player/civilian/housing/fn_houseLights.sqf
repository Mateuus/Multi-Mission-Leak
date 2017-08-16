/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Turns off or on a houses lights
*/
private["_house","_lights","_lightSource","_exit","_smallHouses1","_smallHouses2","_stoneHouses","_largeHouses1","_largeHouses2","_largeHouses3"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_lights = _house getVariable ["lights",false];
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

_smallHouses1 = ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"];
_smallHouses2 = ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"];
_stoneHouses = ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"];
_largeHouses1 = ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"];
_largeHouses2 = ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"];
_largeHouses3 = ["Land_i_House_Small_03_V1_F"];
_exit = false;
if(!_lights) then 
	{
	_lightSource = "#lightpoint" createVehicleLocal [0,0,0];
	_house setVariable ["lights",true,true];
	switch(true) do 
		{
		case ((typeOf _house) in _largeHouses2): {_lightSource lightAttachObject [_house,[0,-2,3.8]];};
		case ((typeOf _house) in _largeHouses1): {_lightSource lightAttachObject [_house,[2,0,3.5]];};
		case ((typeOf _house) in _smallHouses1): {_lightSource lightAttachObject [_house,[-1.5,0,2]]};
		case ((typeOf _house) in _smallHouses2): {_lightSource lightAttachObject [_house,[2,0,2.4]]};
		case ((typeOf _house) in _largeHouses3): {_lightSource lightAttachObject [_house,[-3.3,1,2.5]];};
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
	} 
	else 
	{
	if(isNull (_house getVariable["lightSource",ObjNull])) exitWith {};
	deleteVehicle (_house getVariable["lightSource",ObjNull]);
	_house setVariable ["lights",false,true];
	};