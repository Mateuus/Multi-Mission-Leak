/*
	File: fn_crateAction.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Adds interaction to specified crate.
*/

_crate = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNull _crate) exitWith {};

if (_crate getVariable["containerId", -1] > -1) then
{
	removeAllActions _crate;
	_crate addAction["Item Storage",{[nil,nil,nil,_this select 0] call life_fnc_openInventory},"",0,false,false,"",' (_this distance _target) < 4 && (_target getVariable["containerId", -1] > -1) && (((_target getVariable["house", objNull]) getVariable["life_locked", 1]) == 0 || (_target getVariable["house", objNull] in life_houses || [_target getVariable["house", objNull]] call life_fnc_getBuildID == life_gang)) '];
	_crate addAction["<t color='#FF0000'>Destroy Container</t>",{ [(_this select 0)] call life_fnc_storageSell; },"",0,false,false,"",' (_this distance _target) < 4 && (_target getVariable["containerId", -1] > -1) && ((_target getVariable ["house",objNull]) in life_houses) '];
};