/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns a player's base's list
*/

private ["_baseList"];

params [["_base",objNull,[objNull]]];

_baseList = [];

switch(_base)do {
    case baseClan1: {_baseList = DS_clanBase1;};
    case baseClan2: {_baseList = DS_clanBase2;};
    case baseClan3: {_baseList = DS_clanBase3;};
    case baseClan4: {_baseList = DS_clanBase4;};
    case baseClan5: {_baseList = DS_clanBase5;};
    case baseClan6: {_baseList = DS_clanBase6;};
    case baseClan7: {_baseList = DS_clanBase7;};
    case baseClan8: {_baseList = DS_clanBase8;};
    case baseClan9: {_baseList = DS_clanBase9;};
    case baseClan10: {_baseList = DS_clanBase10;};
    case baseClan11: {_baseList = DS_clanBase11;};
    case baseClan12: {_baseList = DS_clanBase12;};
    case baseClan21: {_baseList = DS_clanBase21;};
};

_baseList;