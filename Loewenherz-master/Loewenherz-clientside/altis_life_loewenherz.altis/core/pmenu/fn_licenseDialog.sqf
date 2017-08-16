#include <macro.h>
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the player menu (Virtual Interaction Menu)
*/


private ["_dialog","_lic","_struct","_side","_str","_val"];
disableSerialization;

createDialog "licenses";
waitUntil {dialog};
_dialog = findDisplay 2780;
ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];
_lic = _dialog displayCtrl 2014;
_struct = "";
_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"}; case east:{"sec"};};

{
	if((_x select 1) == _side) then
	{
		_str = [_x select 0] call lhm_fnc_varToStr;
		_val = missionNamespace getVariable (_x select 0);
		if(_val) then
		{
			_struct = _struct + format["%1<br/>",_str];
		};
	};
} foreach lhm_licenses;

if(_struct == "") then
{
	_struct = localize"STR_PM_NoLicenses";
};

_lic ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];