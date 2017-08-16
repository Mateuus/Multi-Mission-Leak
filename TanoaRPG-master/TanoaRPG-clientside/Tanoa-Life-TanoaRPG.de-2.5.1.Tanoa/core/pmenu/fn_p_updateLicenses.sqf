#include <macro.h>
/*
	File: fn_p_updateLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_dialog","_lic","_side","_struct"];
disableSerialization;

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

_dialog = findDisplay 84532;
_lic = _dialog displayCtrl 2014;
lbClear _lic;
_struct = "";

{
	if((_x select 1) == _side) then
	{
		_str = [_x select 0] call tanoarpg_fnc_varToStr;
		_val = missionNamespace getVariable (_x select 0);
		if(_val) then
		{
			_lic lbAdd _str;
			_struct = _struct + format["%1<br/>",_str];
		};
	};
} foreach life_licenses;

if(_struct == "") then
{
	_lic lbAdd "No Licenses";
};