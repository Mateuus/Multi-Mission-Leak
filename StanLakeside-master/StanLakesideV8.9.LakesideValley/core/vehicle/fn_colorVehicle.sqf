/*
	File: fn_colorVehicle.sqf
	
	
	Description:
	Reskins the vehicle
*/

params [["_vehicle", Objnull, [Objnull]], ["_index", -1, [0]], "_texture", "_texture2", "_texture3"];

if(isNull _vehicle OR !alive _vehicle OR _index isEqualTo -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.

if(local _vehicle) then {
	if(typeOf _vehicle isEqualTo "C_Van_01_transport_F") then {
		_vehicle setVariable["color",1];	
	};
};

//Fetch texture from our present array.
_texture = [(typeOf _vehicle)] call life_fnc_vehicleColorCfg;
if(isNil "_texture") exitWith {};
if(count _texture isEqualTo 0) exitWith {};
if(count (_texture select _index) > 2) then {_texture2 = (_texture select _index) select 2;};
if(count (_texture select _index) > 3) then {_texture3 = (_texture select _index) select 3;};
_texture = _texture select _index;
if(typeName _texture isEqualTo "ARRAY") then { _texture = _texture select 0;};

_vehicle setVariable["Life_VEH_color",_index,true];

waitUntil{!isNil {_vehicle getVariable "Life_VEH_color"}};

_vehicle setObjectTextureGlobal [0,_texture];
if(!isNil "_texture2") then
{
	_vehicle setObjectTextureGlobal [1,_texture2];
};
if(!isNil "_texture3") then
{
	_vehicle setObjectTextureGlobal [2,_texture3];
};

