/*
		fn_addaction.sqf
		Author: G00golplexian
		
		Description: Returns an addaction to every player online.
*/

private["_obj","_name","_fnc","_player"];

_obj = _this select 0;
_name = _this select 1;
_fnc = _this select 2;
_arg = _this select 3;
_arg2 = _this select 4;
_player = _this select 5;

_obj addaction [_name,_fnc,[_arg,_arg2,_player]];