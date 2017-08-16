/*
	File: fn_colorVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	modyfied by MarkusSR1984
	
	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_texture","_texture2","_texture3"];
_vehicle = param [0,ObjNull,[ObjNull]];
_index = param [1,-1,[0]];
if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.


//Fetch texture from our present array.
_texture = [(backpack _vehicle)] call DWEV_fnc_clothesColorCfg;
if(isNil "_texture") exitWith {};
if(count _texture == 0) exitWith {};
if(count (_texture select _index) > 2) then {_texture2 = (_texture select _index) select 2;};
if(count (_texture select _index) > 3) then {_texture3 = (_texture select _index) select 3;};
_texture = _texture select _index;
if(typeName _texture == "ARRAY") then { _texture = _texture select 0;};

//Local to us? Set it's color.
if(local _vehicle) then
{
	(unitBackpack _vehicle) setVariable["DWEV_Clothes_color",_index,true];
};

waitUntil{!isNil {(unitBackpack _vehicle) getVariable "DWEV_Clothes_color"};sleep 0.3};

(unitBackpack _vehicle) setObjectTexture[0,_texture];
if(!isNil "_texture2") then
{
	(unitBackpack _vehicle) setObjectTexture[1,_texture2];
};
if(!isNil "_texture3") then
{
	(unitBackpack _vehicle) setObjectTexture[2,_texture3];
};