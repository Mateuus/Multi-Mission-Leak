/*
	fn_broadcastCheck.sqf
*/

params ["_obj","_var","_value"];

if(isNull _obj) exitWith {};

if(isNil {_value}) exitWith {
	if!(isNil {_obj getVariable _var}) then {
		_obj setVariable [_var,nil,true];
	};
};

if!(_obj getVariable "_var" isEqualTo _value) then {
	_obj setVariable [_var,_value,true];
};