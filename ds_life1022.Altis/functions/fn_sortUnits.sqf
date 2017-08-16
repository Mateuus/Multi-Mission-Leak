/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Sorts an array of units alphabetically
*/

params [
    ["_array",[],[[]]],
    ["_order",true,[false]]
];

_array = _array apply {[name _x,_x]};
_array sort _order;
_array = _array apply {_x select 1};

_array;