/*
	File: fn_gatherZone.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Spawns up objects to be gathered.
*/

private ["_className","_obj","_center","_radius","_max","_asset","_sprite","_enable","_item","_total","_objects"];

_center = [_this,0,[],[[]]] call BIS_fnc_param;
_radius = [_this,1,250,[250]] call BIS_fnc_param;
_max = [_this,2,30,[30]] call BIS_fnc_param;
_asset = [_this,3,"",[""]] call BIS_fnc_param;
_sprite = [_this,4,false,[false]] call BIS_fnc_param;
_enable = [_this,5,true,[true]] call BIS_fnc_param;
_item = [_this,6,"",[""]] call BIS_fnc_param;

if(_enable && !life_gather_spawned) then
{
	life_gather_spawned = true;
	[_center, _radius, _max, _asset, _sprite, _item] spawn
	{
		_center = [_this,0,[],[[]]] call BIS_fnc_param;
		_radius = [_this,1,250,[250]] call BIS_fnc_param;
		_max = [_this,2,30,[30]] call BIS_fnc_param;
		_asset = [_this,3,"",[""]] call BIS_fnc_param;
		_sprite = [_this,4,false,[false]] call BIS_fnc_param;
		_item = [_this,5,"",[""]] call BIS_fnc_param;
		_className = if (_sprite) then { "UserTexture_1x2_F" } else { _asset };
		while {life_gather_spawned} do
		{
			_spawned = count (nearestObjects [_center, [_className], _radius]);
			_total = _max - _spawned;
			if (time - life_gather_spawned_time > 120) then
			{
				for "_i" from 1 to _total do
				{
					_pos = [_center, [1,_radius] call BIS_fnc_randomInt, [0,359] call BIS_fnc_randomInt] call BIS_fnc_relPos;
					if (!_sprite) then
					{
						_obj = _asset createVehicleLocal (_pos);
						_obj enableSimulation false;
						_obj allowDamage false;
						_obj setVectorUp [0,0,1];
						player reveal _obj;
					}
					else
					{
						for "_s" from 0 to 3 do
						{
							_obj = "UserTexture_1x2_F" createVehicleLocal (_pos);
							_obj setPos [getPos _obj select 0,getPos _obj select 1,0.2];
							_obj setObjectTexture [0, _asset];
							_obj setDir ((_s * 90) + 45);
							_obj enableSimulation false;
							_obj allowDamage false;
							_obj setVectorUp [0,0,1];
						}
					};
				};
				life_gather_spawned_time = time;
			};
			sleep 121;
		};
	};
}
else
{
	_className = if (_sprite) then { "UserTexture_1x2_F" } else { _asset };
	_objects = nearestObjects [_center, [_className], _radius];
	{
		deleteVehicle _x;
	} forEach _objects;
	
	life_gather_spawned = false;
	life_gather_spawned_time = -1000;
};