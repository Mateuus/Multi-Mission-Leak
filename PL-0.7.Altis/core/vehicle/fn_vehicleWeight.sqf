/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starting to lose track on shit I wrote a year ago..
*/
private["_vehicle","_weight","_used","_trunklevel"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;
_trunklevel = _vehicle getVariable ["trunklevel",0];
_trunklevel = 1 + (_trunklevel/20);
_weight = [(typeOf _vehicle)] call life_fnc_vehicleWeightCfg;
_weight = round(_trunklevel * _weight);

if(isNil "_used") then {_used = 0};
[_weight,_used];