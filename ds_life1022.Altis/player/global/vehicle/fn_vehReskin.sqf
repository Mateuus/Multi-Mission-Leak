/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Reskins vehicles for JIP players
*/
private ["_vehicle","_index","_className","_side","_textureList"];

_vehicle = _this select 0;
_index = _this select 1;
_className = (typeOf _vehicle);
_side = nil;

if(_vehicle getVariable ["wlcivVehicle",false])then{_side = independent};
if(_vehicle getVariable ["policeVehicle",false])then{_side = west};
if(isNil "_side")then{_side = civilian};

_textureList = [_className,true,_side] call DS_fnc_vehicleTextures;
_textureList = (_textureList select _index);
if(count(_textureList) > 1)then
	{
	_vehicle setObjectTexture [0,(_textureList select 0)];
	_vehicle setObjectTexture [1,(_textureList select 1)];
	}
	else
	{
	_vehicle setObjectTexture [0,(_textureList select 0)];
	};