/*
	File: fn_sirenLights.sqf
	Author: Blackd0g

	Description:
	checks and enables vehicle lights
*/
private ["_vehicle","_side","_vehicleCheck","_vehclass","_allowedSides","_lightpos","_lightposleft","_lightposright","_lightcolor","_lightcolorleft","_lightcolorright","_vehType"];
_side = param [0,sideUnknown,[sideUnknown]];
_vehicle = param [1,ObjNull,[ObjNull]];
_vehType = TypeOf _vehicle;
if(_side == sideUnknown) exitWith {}; // unknown side!
if(isNull _vehicle) exitWith {}; //Bad entry!

_vehicleCheck = [_vehType] call lhm_fnc_sirenLightsConfig;
if(isNil "_vehicleCheck") exitWith {};
if(count _vehicleCheck == 0) exitWith {};

// process sirenLights config...
_vehclass = _vehicleCheck select 0;
_allowedSides = _vehicleCheck select 1;
_lightpos = _vehicleCheck select 2;
_lightposleft = _lightpos select 0;
_lightposright = _lightpos select 1;
_lightcolor = _vehicleCheck select 3;
_lightcolorleft = _lightcolor select 0;
_lightcolorright = _lightcolor select 1;

if(!(playerSide IN _allowedSides)) exitWith {};
if(_vehclass != (typeOf (vehicle player))) exitWith {};

if(_vehicle getVariable["lights",false]) then {
	_vehicle setVariable["lights",false,true];
	titleText ["Warnlicht aus","PLAIN"];
} else {
	_vehicle setVariable["lights",true,true];
	titleText ["Warnlicht an","PLAIN"];
	[[_vehicle,_lightpos,_lightcolor],"lhm_fnc_sirenLightsEx",true,false] call lhm_fnc_mp;
};