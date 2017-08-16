/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the selected vehicle, if a vehicle is already on the spawn point
	then it deletes the vehicle from the spawn point.
*/
disableSerialization;
private["_position","_direction","_className","_displayName","_spCheck","_cfgInfo","_vehclass","_pos","_dir","_uid","_side","_color"];
if(lnbCurSelRow 38101 == -1) exitWith {hint "You did not select a vehicle to spawn!"};

_className = lnbData[38101,[(lnbCurSelRow 38101),0]];
_displayName = lnbData[38101,[(lnbCurSelRow 38101),1]];

_position = getposATL player;
_direction = getdir player;
_uid = getplayerUID player;
_side = playerSide;
_color = round random 5;
_namespawner = player;

_cfgInfo = [_className] call VVS_fnc_cfgInfo;

[[_className,_position,_direction,_uid,_side,_color,VVS_Checkbox,_namespawner],"lhm_fnc_spawnVehicle",false,false] call lhm_fnc_mp;

hint format["You have spawned a %1",_displayName];
closeDialog 0;
