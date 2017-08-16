/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns the nearest gang hideout to the player
*/

private ["_hideout"];

_hideout = objNull;

switch(true)do {
	case (player distance gangFlag1 < 100): {_hideout = gangFlag1;};
	case (player distance gangFlag2 < 100): {_hideout = gangFlag2;};
	case (player distance gangFlag3 < 100): {_hideout = gangFlag3;};
	case (player distance gangFlag4 < 100): {_hideout = gangFlag4;};
};

_hideout;