/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns a player's base's list
*/

private ["_baseList"];

params [["_unit",player,[objNull]]];

_baseList = [];

switch(true)do {
    case ((getPlayerUID _unit) in DS_clanBase1): {_baseList = DS_clanBase1;};
    case ((getPlayerUID _unit) in DS_clanBase2): {_baseList = DS_clanBase2;};
    case ((getPlayerUID _unit) in DS_clanBase3): {_baseList = DS_clanBase3;};
    case ((getPlayerUID _unit) in DS_clanBase4): {_baseList = DS_clanBase4;};
    case ((getPlayerUID _unit) in DS_clanBase5): {_baseList = DS_clanBase5;};
    case ((getPlayerUID _unit) in DS_clanBase6): {_baseList = DS_clanBase6;};
    case ((getPlayerUID _unit) in DS_clanBase7): {_baseList = DS_clanBase7;};
    case ((getPlayerUID _unit) in DS_clanBase8): {_baseList = DS_clanBase8;};
    case ((getPlayerUID _unit) in DS_clanBase9): {_baseList = DS_clanBase9;};
    case ((getPlayerUID _unit) in DS_clanBase10): {_baseList = DS_clanBase10;};
    case ((getPlayerUID _unit) in DS_clanBase11): {_baseList = DS_clanBase11;};
    case ((getPlayerUID _unit) in DS_clanBase12): {_baseList = DS_clanBase12;};
    case ((getPlayerUID _unit) in DS_clanBase21): {_baseList = DS_clanBase21;};
};

_baseList;