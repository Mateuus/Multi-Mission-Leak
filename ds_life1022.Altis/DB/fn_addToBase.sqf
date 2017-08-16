/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Adds a player to a base spawn list depending on DB info
*/

switch(_this select 0)do {
	case 1: {if(!((getPlayerUID player) in DS_clanBase1))then{DS_clanBase1 pushBack (getPlayerUID player);publicVariable "DS_clanBase1";};};
	case 2: {if(!((getPlayerUID player) in DS_clanBase2))then{DS_clanBase2 pushBack (getPlayerUID player);publicVariable "DS_clanBase2";};};
	case 3: {if(!((getPlayerUID player) in DS_clanBase3))then{DS_clanBase3 pushBack (getPlayerUID player);publicVariable "DS_clanBase3";};};
	case 4: {if(!((getPlayerUID player) in DS_clanBase4))then{DS_clanBase4 pushBack (getPlayerUID player);publicVariable "DS_clanBase4";};};
	case 5: {if(!((getPlayerUID player) in DS_clanBase5))then{DS_clanBase5 pushBack (getPlayerUID player);publicVariable "DS_clanBase5";};};
	case 6: {if(!((getPlayerUID player) in DS_clanBase6))then{DS_clanBase6 pushBack (getPlayerUID player);publicVariable "DS_clanBase6";};};
	case 7: {if(!((getPlayerUID player) in DS_clanBase7))then{DS_clanBase7 pushBack (getPlayerUID player);publicVariable "DS_clanBase7";};};
	case 8: {if(!((getPlayerUID player) in DS_clanBase8))then{DS_clanBase8 pushBack (getPlayerUID player);publicVariable "DS_clanBase8";};};
	case 9: {if(!((getPlayerUID player) in DS_clanBase9))then{DS_clanBase9 pushBack (getPlayerUID player);publicVariable "DS_clanBase9";};};
	case 10: {if(!((getPlayerUID player) in DS_clanBase10))then{DS_clanBase10 pushBack (getPlayerUID player);publicVariable "DS_clanBase10";};};
	case 11: {if(!((getPlayerUID player) in DS_clanBase11))then{DS_clanBase11 pushBack (getPlayerUID player);publicVariable "DS_clanBase11";};};
	case 12: {if(!((getPlayerUID player) in DS_clanBase12))then{DS_clanBase12 pushBack (getPlayerUID player);publicVariable "DS_clanBase12";};};
	case 21: {if(!((getPlayerUID player) in DS_clanBase21))then{DS_clanBase21 pushBack (getPlayerUID player);publicVariable "DS_clanBase21";};};
};