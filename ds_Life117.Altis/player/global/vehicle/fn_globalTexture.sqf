/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Textures a vehicle globally
*/

private ["_vehicle","_double","_texture"];

_vehicle = _this select 0;
_double = _this select 1;
_texture = _this select 2;

if((isNull _vehicle)||(!alive _vehicle))exitwith{};//Opps?

if(_double)then
	{
	_vehicle setObjectTextureGlobal[0,(_texture select 0)];
	_vehicle setObjectTextureGlobal[1,(_texture select 1)];
	_vehicle setObjectTextureGlobal[2,(_texture select 1)];
	}
	else
	{
	_vehicle setObjectTextureGlobal[0,(_texture select 0)];
	};
