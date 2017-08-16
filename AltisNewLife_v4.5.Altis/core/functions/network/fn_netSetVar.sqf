disableSerialization;
private["_varName","_ns","_value"];
_varName = [_this,0,"",[""]] call BIS_fnc_param;
_value = [_this,1,-9999,[sideUnknown,"",[],{},false,0,ObjNull,GrpNull,displayNull]] call BIS_fnc_param;
_ns = [_this,2,missionNamespace,[missionNamespace]] call BIS_fnc_param;
if(_varName == "") exitWith {};
_ns setVariable[_varName,_value];