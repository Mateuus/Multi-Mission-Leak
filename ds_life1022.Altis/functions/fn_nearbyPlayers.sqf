/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Returns if there are players nearby the player
*/

private ["_return"];

params [
	["_position",player,[[],objNull]],
	["_distance",100,[0]],
	["_side",sideUnknown,[sideUnknown]],
	["_noVehicle",false,[false]]
];

_return = false;

if(_noVehicle)then {
	_return = ({(!(_x isEqualTo player))&&((side _x) isEqualTo _side)&&(alive _x)&&(isNull objectParent _x)&&(_position distance _x < _distance)} count allPlayers) > 0;
} else {
	_return = ({(!(_x isEqualTo player))&&((side _x) isEqualTo _side)&&(alive _x)&&(_position distance _x < _distance)} count allPlayers) > 0;
};

_return;