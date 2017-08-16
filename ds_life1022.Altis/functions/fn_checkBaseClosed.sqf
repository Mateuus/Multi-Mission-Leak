/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks whether or not a base is closed
*/

private ["_return","_base","_basePos"];

params [
	["_type",0,[0]],
	["_marker","",[""]]
];

_return = true;

if(!(playerSide isEqualTo civilian))exitWith{};

if(_type isEqualTo 0)then {
	switch(true)do {
		case (player distance baseClan1 < 200): {_base = baseClan1;};
		case (player distance baseClan2 < 200): {_base = baseClan2;};
		case (player distance baseClan3 < 200): {_base = baseClan3;};
		case (player distance baseClan4 < 200): {_base = baseClan4;};
		case (player distance baseClan5 < 200): {_base = baseClan5;};
		case (player distance baseClan6 < 200): {_base = baseClan6;};
		case (player distance baseClan7 < 200): {_base = baseClan7;};
		case (player distance baseClan8 < 200): {_base = baseClan8;};
		case (player distance baseClan9 < 200): {_base = baseClan9;};
		case (player distance baseClan10 < 200): {_base = baseClan10;};
		case (player distance baseClan11 < 200): {_base = baseClan11;};
		case (player distance baseClan12 < 200): {_base = baseClan12;};
		case (player distance baseClan21 < 200): {_base = baseClan21;};
	};

	if(isNil "_base")exitWith{};

	if(_base getVariable ["baseClosed",false])then {
		hint "This base has been shut down by the police. Bases remain closed for 1 hour";
		closeDialog 0;
	};
} else {
	_basePos = (getMarkerPos _marker);

	switch(true)do {
		case (_basePos distance baseClan1 < 200): {_base = baseClan1;};
		case (_basePos distance baseClan2 < 200): {_base = baseClan2;};
		case (_basePos distance baseClan3 < 200): {_base = baseClan3;};
		case (_basePos distance baseClan4 < 200): {_base = baseClan4;};
		case (_basePos distance baseClan5 < 200): {_base = baseClan5;};
		case (_basePos distance baseClan6 < 200): {_base = baseClan6;};
		case (_basePos distance baseClan7 < 200): {_base = baseClan7;};
		case (_basePos distance baseClan8 < 200): {_base = baseClan8;};
		case (_basePos distance baseClan9 < 200): {_base = baseClan9;};
		case (_basePos distance baseClan10 < 200): {_base = baseClan10;};
		case (_basePos distance baseClan11 < 200): {_base = baseClan11;};
		case (_basePos distance baseClan12 < 200): {_base = baseClan12;};
		case (_basePos distance baseClan21 < 200): {_base = baseClan21;};
	};

	if(isNil "_base")exitWith{};

	_return = !(_base getVariable ["baseClosed",false]);
};

_return;