/*
	File: fn_MP.sqf
*/

_target = [_this,2,true,[false,objNull,grpNull,civilian,[],1,""]] call BIS_fnc_param;
_isPersistent = [_this,3,false,[false]] call BIS_fnc_param;
_isCall = [_this,4,false,[false]] call BIS_fnc_param;
if (typeName _target == "BOOL") then
{
	if (!_target && !isNil "HC1") exitWith { _target = HC1 };
	if (_target) then { _target = allPlayers; };
};

[_this select 0,_this select 1, _target, _isPersistent, _isCall] spawn BIS_fnc_MP;