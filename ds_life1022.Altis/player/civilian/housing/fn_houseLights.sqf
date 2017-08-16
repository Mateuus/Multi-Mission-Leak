/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Turns off or on a houses lights
*/

private ["_tinyHouses","_smallHouses","_medHouses","_bigHouses","_hugeHouses","_lights","_lightSource"];

params [["_house",objNull,[objNull]]];

if(isNull _house)exitWith{};
if(!(_house isKindOf "House_F"))exitWith{};

_tinyHouses = ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"];
_smallHouses = ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"];
_medHouses = ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"];
_bigHouses = ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"];
_hugeHouses = ["Land_i_House_Small_03_V1_F"];

_lights = _house getVariable ["lights",false];

if(!_lights)then {
	_lightPos = switch(true) do {
		case ((typeOf _house) in _bigHouses): {[0,-2,3.8]};
		case ((typeOf _house) in _medHouses): {[2,0,3.5]};
		case ((typeOf _house) in _smallHouses): {[-1.5,0,2]};
		case ((typeOf _house) in _tinyHouses): {[2,0,2.4]};
		case ((typeOf _house) in _hugeHouses): {[-3.3,1,2.5]};
		default {[]};
	};
	if(_lightPos isEqualTo [])exitWith{};

	_lightSource = "#lightpoint" createVehicleLocal [0,0,0];
	_lightSource lightAttachObject [_house,_lightPos];
	_lightSource setLightColor [250,150,50];
	_lightSource setLightAmbient [1,1,0.2];
	_lightSource setLightAttenuation [1,0,0,0];
	_lightSource setLightIntensity 10;
	_lightSource setLightUseFlare true;
	_lightSource setLightFlareSize 0.2;
	_lightSource setLightFlareMaxDistance 50;

	_house setVariable ["lightSource",_lightSource];
	_house setVariable ["lights",true,true];
} else {
	if(isNull (_house getVariable ["lightSource",objNull]))exitWith{};
	deleteVehicle (_house getVariable ["lightSource",objNull]);
	_house setVariable ["lights",false,true];
};