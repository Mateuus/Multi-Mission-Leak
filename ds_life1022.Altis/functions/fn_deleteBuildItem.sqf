/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Delete's the player's target build item
*/

params [["_target",objNull,[objNull]]];

if(isNull _target)exitWith{};

if((_target getVariable ["buildItem",false])||{_target getVariable ["buildItemCiv",false]})then{
    deleteVehicle _target;
};