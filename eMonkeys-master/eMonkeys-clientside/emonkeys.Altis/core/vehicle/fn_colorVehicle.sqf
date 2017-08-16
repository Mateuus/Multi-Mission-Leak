/*
	File: fn_colorVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_vehicleClass","_textureNumber","_texture0","_texture1","_texture2","_texture3"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.
if(local _vehicle) then {
	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F": {_vehicle setVariable["color",3];};
		case "C_Hatchback_01_F": {_vehicle setVariable["color",1];};
		case "C_Hatchback_01_sport_F": {_vehicle setVariable["color",1];};
		case "C_SUV_01_F": {_vehicle setVariable["color",1];};
		case "C_Van_01_box_F": {_vehicle setVariable["color",1];};
		case "C_Van_01_transport_F": {_vehicle setVariable["color",1];};
	};
};

//Fetch texture from our present array.
_index = format["%1",_index];
_vehicleClass = TypeOf _vehicle;
_textureNumber = getNumber (missionConfigFile >> "CfgVehicleColor" >> _vehicleClass >> _index >> "fileNr");
if(_textureNumber >= 1) then {_texture0 = getText (missionConfigFile >> "CfgVehicleColor" >> _vehicleClass >> _index >> "file1")};
if(_textureNumber >= 2) then {_texture1 = getText (missionConfigFile >> "CfgVehicleColor" >> _vehicleClass >> _index >> "file2")};
if(_textureNumber >= 3) then {_texture2 = getText (missionConfigFile >> "CfgVehicleColor" >> _vehicleClass >> _index >> "file3")};
if(_textureNumber >= 4) then {_texture3 = getText (missionConfigFile >> "CfgVehicleColor" >> _vehicleClass >> _index >> "file4")};

//Local to us? Set it's color.
if(local _vehicle) then
{
	_vehicle setVariable["EMonkeys_VEH_color",_index,true];
};

waitUntil{!isNil {_vehicle getVariable "EMonkeys_VEH_color"}};
if(!isNil "_texture0") then
{
	_vehicle setObjectTexture[0,_texture0];
};
	
if(!isNil "_texture1") then
{
	_vehicle setObjectTexture[1,_texture1];
};

if(!isNil "_texture2") then
{
	_vehicle setObjectTexture[2,_texture2];
};

if(!isNil "_texture3") then
{
	_vehicle setObjectTexture[3,_texture3];
};