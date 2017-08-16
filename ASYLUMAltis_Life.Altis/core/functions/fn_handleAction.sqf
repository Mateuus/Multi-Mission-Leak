/*
	File: fn_addAction.sqf
	Author: Alan
	
	FLAGS:
	TRUE = Add;
	FALSE = Remove;
*/
private ["_flag","_unit","_msg","_func","_actionID","_args","_dist"];
_flag = [_this,0,true,[true]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;


if(_flag) then {
	_msg = [_this,2,"",[""]] call BIS_fnc_param;
	_func = _this select 3;
	_args = [_this,4,"",[""]] call BIS_fnc_param;
	_dist = [_this,5,5,[5]] call BIS_fnc_param;
	//hint format["%1 ||| %2",_msg, _func];
	_unit addAction [_msg, _func, _args,-1,false,false,"",'(_this distance _target) < 2'];
} else {
	//_actionID = [_this,2,0,[0]] call BIS_fnc_param;
	removeAllActions _unit;
};

