/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Updates the gang members list
*/

private ["_base","_player"];

_player = player;
_base = 0;

switch(true)do {
	case (_player distance baseClan1 < 100): {
		_base = 1;
	};
	case (_player distance baseClan2 < 100): {
		_base = 2;
	};
	case (_player distance baseClan3 < 100): {
		_base = 3;
	};
	case (_player distance baseClan4 < 100): {
		_base = 4;
	};
	case (_player distance baseClan5 < 100): {
		_base = 5;
	};
	case (_player distance baseClan6 < 100): {
		_base = 6;
	};
	case (_player distance baseClan7 < 100): {
		_base = 7;
	};
	case (_player distance baseClan8 < 100): {
		_base = 8;
	};
	case (_player distance baseClan9 < 100): {
		_base = 9;
	};
	case (_player distance baseClan10 < 100): {
		_base = 10;
	};
	case (_player distance baseClan11 < 100): {
		_base = 11;
	};
	case (_player distance baseClan12 < 100): {
		_base = 12;
	};
	case (_player distance baseClan21 < 100): {
		_base = 21;
	};
};

if(_base == 0)then {
	false;
} else {
	true;
};