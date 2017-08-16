/*
	File: fn_yaguthazest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Receive an item from a player.
*/
params [
	["_unit",objNull,[objNull]],
	["_val",0,[0]],
	["_item","",[""]],
	["_from",objNull,[objNull]]
];

if !(_unit isEqualTo player) exitWith {};
if (isNull _from) exitWith {};
if (_item isEqualTo "") exitWith {};
if (_val isEqualTo 0) exitWith {};

if ([_item,_val] call life_fnc_virtualItemAdd) then
{
	private _type = localize getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName");
	hintSilent format ["You were given %1 %2",_val,_type];
}
else
{
	[_from,_item,_val,_unit] remoteExecCall ["life_fnc_spafraprubu",_from];
};
