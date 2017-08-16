/*
	Author: Bryan "Tonic" Boardwine
	Description:
	Reskins the vehicle
*/
params [
	["_vehicle",objNull,[objNull]],
	["_index","",[""]]
];
if(isNull _vehicle OR {!alive _vehicle}) exitWith {};
_textures = [_index,typeOf _vehicle] call life_fnc_joefrluchoucrl;
_vehicle setVariable["Life_VEH_color",_index,true];
player reveal _vehicle;
if(count _textures isEqualTo 0) exitWith {};
_textures = _textures select 1;
{
	_vehicle setObjectTextureGlobal[_forEachIndex,_x];
} forEach _textures;
