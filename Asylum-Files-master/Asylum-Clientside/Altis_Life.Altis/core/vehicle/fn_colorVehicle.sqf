/*
	File: fn_colorVehicle.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_texture","_texture2","_texture3"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_texture2 = "";
_texture3 = "";
if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.
/*if (typeOf _vehicle in ["B_G_Offroad_01_armed_F","C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F"]) then
{
	waitUntil {!isNil {_vehicle getVariable "BIS_randomSeed1"}};
};*/

//Fetch texture from our present array.
//_shopIndex = [(typeOf _vehicle), life_vehicleInfo] call life_fnc_index;
//if (_shopIndex < 0) exitWith {}; // Nothing to do, color done by config

_texture = [(typeOf _vehicle)] call life_fnc_vehicleColorCfg;
if(isNil "_texture") exitWith {};
if(count _texture == 0) exitWith {};
if(count (_texture select _index) > 2) then {_texture2 = (_texture select _index) select 2;};
if(count (_texture select _index) > 3) then {_texture3 = (_texture select _index) select 3;};
_texture = _texture select _index;
if(typeName _texture == "ARRAY") then { _texture = _texture select 0;};

//Local to us? Set it's color.
if(local _vehicle) then
{
	_vehicle setVariable["Life_VEH_color",_index,true];
};

if(typeName _texture == "ARRAY") then
{
	_vehicle setVariable ["Red", _texture select 0]; 
	_vehicle setVariable ["Green", _texture select 1]; 
	_vehicle setVariable ["Blue", _texture select 2]; 
}
else
{
	if (_texture == "CONFIG") then
	{
		[_vehicle, _texture2, nil] call BIS_fnc_initVehicle;
	}
	else
	{
		if (_texture == "CHROME") then
		{
			_vehicle setObjectMaterial [0,"\A3\data_f\chrome_enviro.rvmat"];
			_vehicle setObjectTexture [0,'#(argb,8,8,3)color(0,0.7,0.7,0.01)']
		}
		else
		{
			_vehicle setObjectTexture[0,_texture];
		};
		if(!isNil "_texture2" && {_texture2 != ""}) then
		{
			if (_texture2 == "CHROME") then
			{
				_vehicle setObjectMaterial [1,"\A3\data_f\chrome_enviro.rvmat"];
				_vehicle setObjectTexture [1,'#(argb,8,8,3)color(0,0.7,0.7,0.01)']
			}
			else
			{
				_vehicle setObjectTexture[1,_texture2];
			};
		};
		if(!isNil "_texture3" && {_texture3 != ""}) then
		{
			if (_texture3 == "CHROME") then
			{
				_vehicle setObjectMaterial [2,"\A3\data_f\chrome_enviro.rvmat"];
				_vehicle setObjectTexture [2,'#(argb,8,8,3)color(0,0.7,0.7,0.01)']
			}
			else
			{
				_vehicle setObjectTexture[2,_texture3];
			};
		};
	};
};