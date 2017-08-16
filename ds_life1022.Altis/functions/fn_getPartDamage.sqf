/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Returns the damage of a given selection
*/

private ["_damage","_index"];

params [
    ["_unit",objNull,[objNull]],
    ["_selection","",[""]]
];

if(isNull _unit)exitwith{};

_damage = 0;
_index = (_unit getVariable ["selections",[]]) find _selection;

if(_index >= 0)then {
    _damage = (_unit getVariable "getHit") select _index;
};

_damage