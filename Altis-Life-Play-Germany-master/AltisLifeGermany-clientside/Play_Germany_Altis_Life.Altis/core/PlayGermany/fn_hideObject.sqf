private["_obj","_visible"];

_obj = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_visible = [_this,1,true,[true]] call BIS_fnc_param;

if (isNull _obj) exitWith {};

 _obj hideObject _visible; 