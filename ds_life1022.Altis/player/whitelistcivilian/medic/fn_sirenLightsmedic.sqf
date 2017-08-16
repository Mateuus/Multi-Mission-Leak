/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Handles medic vehicle lights
*/

private ["_vehicle","_lightPositions","_lights","_targets"];

_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _vehicle)exitwith{};
if(_vehicle getVariable ["sirens",FALSE])exitwith{_vehicle setVariable ["sirens",false,true]};
if(!(typeOf _vehicle in ["C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F"]))exitwith{};

_lightPositions = [
	//Vehicle Class || Left Light Pos || Right Light Pos
	["C_Offroad_01_F",[-0.37, 0.0, 0.56],[0.37,0.0,0.95]],
	["C_SUV_01_F",[-0.37,-1.2,0.42],[0.37,-1.2,0.42]],
	["C_Van_01_box_F",[-0.37,0.0,0.82],[0.37,0.0,0.82]]
];

//Turn on the medic lights
_vehicle setVariable ["sirens",true,true];

_lights = _lightPositions select {(_x select 0) isEqualTo (typeOf _vehicle)} select 0;
_targets = allPlayers select {(_x distance player) < 1000};
[_vehicle,_lights] remoteExec ["DS_fnc_medicLights",_targets];

DS_usedMedicLights = true;

[] spawn
	{
	sleep 0.5;
	DS_usedMedicLights = false;
	};