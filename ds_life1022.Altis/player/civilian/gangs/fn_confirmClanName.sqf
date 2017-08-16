/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Checks a gangs name and returns true if they are not allowed to use it (Because it belongs to a clan they are not apart of)
*/

private ["_return"];

_return = false;

switch(_this select 0)do {
	case "AGS": {
		if(!((getPlayerUID player) in DS_clanBase1))then {
			_return = true;
		};
	};
	case "FU": {
		if(!((getPlayerUID player) in DS_clanBase2))then {
			_return = true;
		};
	};
	case "ROCA": {
		if(!((getPlayerUID player) in DS_clanBase3))then {
			_return = true;
		};
	};
	case "TFO": {
		if(!((getPlayerUID player) in DS_clanBase4))then {
			_return = true;
		};
	};
	case "uB": {
		if(!((getPlayerUID player) in DS_clanBase5))then {
			_return = true;
		};
	};
	case "666": {
		if(!((getPlayerUID player) in DS_clanBase6))then {
			_return = true;
		};
	};
	case "TF": {
		if(!((getPlayerUID player) in DS_clanBase7))then {
			_return = true;
		};
	};
	case "bh": {
		if(!((getPlayerUID player) in DS_clanBase8))then {
			_return = true;
		};
	};
	case "TDA": {
		if(!((getPlayerUID player) in DS_clanBase9))then {
			_return = true;
		};
	};
	case "CoSW": {
		if(!((getPlayerUID player) in DS_clanBase10))then {
			_return = true;
		};
	};
	case "LSD": {
		if(!((getPlayerUID player) in DS_clanBase11))then {
			_return = true;
		};
	};
	case "AMG": {
		if(!((getPlayerUID player) in DS_clanBase12))then {
			_return = true;
		};
	};
};

_return;