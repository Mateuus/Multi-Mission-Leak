/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns the nearest base to the player
*/

private ["_base"];

params [["_distance",100,[0]]];

_base = objNull;

switch(true)do {
    case (player distance baseClan1 < _distance): {_base = baseClan1;};
    case (player distance baseClan2 < _distance): {_base = baseClan2;};
    case (player distance baseClan3 < _distance): {_base = baseClan3;};
    case (player distance baseClan4 < _distance): {_base = baseClan4;};
    case (player distance baseClan5 < _distance): {_base = baseClan5;};
    case (player distance baseClan6 < _distance): {_base = baseClan6;};
    case (player distance baseClan7 < _distance): {_base = baseClan7;};
    case (player distance baseClan8 < _distance): {_base = baseClan8;};
    case (player distance baseClan9 < _distance): {_base = baseClan9;};
    case (player distance baseClan10 < _distance): {_base = baseClan10;};
    case (player distance baseClan11 < _distance): {_base = baseClan11;};
    case (player distance baseClan12 < _distance): {_base = baseClan12;};
    case (player distance baseClan21 < _distance): {_base = baseClan21;};
};

_base;