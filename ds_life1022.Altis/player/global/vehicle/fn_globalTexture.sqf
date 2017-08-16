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

if(_double == 3)then
	{
	_vehicle setObjectTextureGlobal[0,(_texture select 0)];
	if(count(_texture) > 1)then
		{
		_vehicle setObjectTextureGlobal[1,(_texture select 1)];
		if(count(_texture) > 2)then
			{
			_vehicle setObjectTextureGlobal[2,(_texture select 2)];
			};
		}
		else
		{
		_vehicle setObjectTextureGlobal[1,(_texture select 0)];
		_vehicle setObjectTextureGlobal[2,(_texture select 0)];
		_vehicle setObjectTextureGlobal[3,(_texture select 0)];
		_vehicle setObjectTextureGlobal[4,(_texture select 0)];
		_vehicle setObjectTextureGlobal[5,(_texture select 0)];
		};
	}
	else
	{
	if(_double == 2)then
		{
		_vehicle setObjectTextureGlobal[0,(_texture select 0)];
		if(count(_texture) > 1)then
			{
			_vehicle setObjectTextureGlobal[1,(_texture select 1)];
			}
			else
			{
			_vehicle setObjectTextureGlobal[1,(_texture select 0)];
			};
		}
		else
		{
		_vehicle setObjectTextureGlobal[0,(_texture select 0)];
		};
	};
