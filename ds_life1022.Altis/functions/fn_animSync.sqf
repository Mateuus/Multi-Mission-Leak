/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Broadcasts an animation to a player
*/

params [
    ["_unit",objNull,[objNull]],
    ["_anim","",[""]]
];

if(isNull _unit)exitWith{};
_unit switchMove _anim;