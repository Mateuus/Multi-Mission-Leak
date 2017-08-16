 
 
 
 
 
 
 
 
private["_value"]; 
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_value = [_this,1,true,[true]] call BIS_fnc_param; 
 
if (isNull _vehicle) exitWith {}; 
 
_vehicle setVariable ["insured", _value];