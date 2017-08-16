/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns a player's base
*/

private ["_base"];

params [["_unit",player,[objNull]]];

_base = objNull;

switch(true)do {
    case ((getPlayerUID _unit) in DS_clanBase1): {_base = baseClan1;};
    case ((getPlayerUID _unit) in DS_clanBase2): {_base = baseClan2;};
    case ((getPlayerUID _unit) in DS_clanBase3): {_base = baseClan3;};
    case ((getPlayerUID _unit) in DS_clanBase4): {_base = baseClan4;};
    case ((getPlayerUID _unit) in DS_clanBase5): {_base = baseClan5;};
    case ((getPlayerUID _unit) in DS_clanBase6): {_base = baseClan6;};
    case ((getPlayerUID _unit) in DS_clanBase7): {_base = baseClan7;};
    case ((getPlayerUID _unit) in DS_clanBase8): {_base = baseClan8;};
    case ((getPlayerUID _unit) in DS_clanBase9): {_base = baseClan9;};
    case ((getPlayerUID _unit) in DS_clanBase10): {_base = baseClan10;};
    case ((getPlayerUID _unit) in DS_clanBase11): {_base = baseClan11;};
    case ((getPlayerUID _unit) in DS_clanBase12): {_base = baseClan12;};
    case ((getPlayerUID _unit) in DS_clanBase21): {_base = baseClan21;};
};

_base;