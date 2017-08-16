#include <macro.h>
/*
	File: fn_vShopCam.sqf
	Author: RafiQuak for PlayGermany
	
	Description:
	Handles the cam in the car shop
*/
private["_key","_camPos","_handled","_moveSpeed","_newNum","_hint"];
if (PG_vShop_camMove) exitWith {};
PG_vShop_camMove = true;
_handled = false;
_key = _this select 1;
_camPos = getPos PG_vShop_cam;
_moveSpeed = 0.1;
if(_shift) then {_moveSpeed = _moveSpeed * 2;};
_hint = false;

switch (_key) do {
	case 17: {
		_newNum = (_camPos select 1) - _moveSpeed;
		if (_newNum < 1900) then {_newNum = 1901; _hint = true;};
		_camPos set [1,_newNum];
		_handled = true;
	};
	case 30: {
		_newNum = (_camPos select 0) + _moveSpeed;
		if (_newNum > 2100) then {_newNum = 2099; _hint = true;};
		_camPos set [0,_newNum];
		_handled = true;
	};
	case 31: {
		_newNum = (_camPos select 1) + _moveSpeed;
		if (_newNum > 2100) then {_newNum = 2099; _hint = true;};
		_camPos set [1,_newNum];
		_handled = true;
	};
	case 32: {
		_newNum = (_camPos select 0) - _moveSpeed;
		if (_newNum < 1900) then {_newNum = 1901; _hint = true;};
		_camPos set [0,_newNum];
		_handled = true;
	};
	case 16: {
		_newNum = (_camPos select 2) - _moveSpeed;
		if (_newNum < 9800) then {_newNum = 9801; _hint = true;};
		_camPos set [2,_newNum];
		_handled = true;		
	};
	case 18: {
		_newNum = (_camPos select 2) + _moveSpeed;
		if (_newNum > 10100) then {_newNum = 10099; _hint = true;};
		_camPos set [2,_newNum];
		_handled = true;
	};
};

if(_hint) then {["Wo willst du hin?", -1, 0.7, 2, 0, 0, 11126] spawn BIS_fnc_dynamicText;};

PG_vShop_cam camSetPos _camPos;
PG_vShop_cam camCommit 0;
PG_vShop_camMove = false;

_handled