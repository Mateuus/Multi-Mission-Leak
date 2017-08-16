/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Handles mechanic vehicle lights
*/

private ["_vehicle","_lightPositions","_lights"];

_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _vehicle)exitwith{};
if(_vehicle getVariable ["sirens",false])exitwith{_vehicle setVariable ["sirens",false,true]};
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_Truck_01_mover_F"]))exitwith{};

_lightPositions = [
	//Vehicle Class || Left Light Pos || Right Light Pos
	["C_Offroad_01_F",[-0.37,0.0,0.56],[0.37,0.0,0.56]],
	["B_Truck_01_mover_F",[-0.678,3.706,0.841],[0.738,3.706,0.841]]
];

//Toggle the mechanic lights
_vehicle setVariable ["sirens",true,true];

_lights = _lightPositions select {(_x select 0) isEqualTo (typeOf _vehicle)} select 0;
_targets = allPlayers select {(_x distance player) < 1000};
[_vehicle,_lights] remoteExec ["DS_fnc_mechLights",_targets];

DS_usedMechLights = true;

[] spawn
	{
	sleep 0.5;
	DS_usedMechLights = false;
	};