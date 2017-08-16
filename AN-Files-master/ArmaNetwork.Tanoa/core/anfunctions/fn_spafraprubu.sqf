/*
  ArmA.Network
  Author: Rathbone
  Copyright (c) ArmA.Network 2015 - 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/

params [
	["_unit",objNull,[objNull]],
	["_item","",[""]],
	["_val",0,[0]],
	["_from",objNull,[objNull]]
];

if !(_unit isEqualTo player) exitWith {};
if (_item isEqualTo "") exitWith {};
if (_val isEqualTo 0) exitWith {};

private _type = getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName");

if ([_item,_val] call life_fnc_virtualItemAdd) then 
{
	hintSilent format["You gave too much of %1 and was given it back",localize _type];
}
else 
{
	hintSilent format["You gave too much of %1 but also didn't have enough space",localize _type];
};
