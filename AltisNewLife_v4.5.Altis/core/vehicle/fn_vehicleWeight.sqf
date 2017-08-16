private["_vehicle","_weight","_used"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;
_weight = [(typeOf _vehicle)] call life_fnc_vehicleWeightCfg;
if(isNil "_used") then {_used = 0};
[_weight,_used];