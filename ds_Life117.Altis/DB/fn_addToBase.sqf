/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Adds a player to a base spawn list depending on DB info
*/

switch(_this select 0)do
	{
	case 1:
		{
		if(!((getPlayerUID player) in DS_clanBase1))then{DS_clanBase1 pushBack (getPlayerUID player);publicVariable "DS_clanBase1";};
		};
	case 2:
		{
		if(!((getPlayerUID player) in DS_clanBase2))then{DS_clanBase2 pushBack (getPlayerUID player);publicVariable "DS_clanBase2";};
		};
	case 3:
		{
		if(!((getPlayerUID player) in DS_clanBase3))then{DS_clanBase3 pushBack (getPlayerUID player);publicVariable "DS_clanBase3";};
		};
	case 4:
		{
		if(!((getPlayerUID player) in DS_clanBase4))then{DS_clanBase4 pushBack (getPlayerUID player);publicVariable "DS_clanBase4";};
		};
	case 5:
		{
		if(!((getPlayerUID player) in DS_clanBase5))then{DS_clanBase5 pushBack (getPlayerUID player);publicVariable "DS_clanBase5";};
		};
	case 6:
		{
		if(!((getPlayerUID player) in DS_clanBase6))then{DS_clanBase6 pushBack (getPlayerUID player);publicVariable "DS_clanBase6";};
		};
	case 7:
		{
		if(!((getPlayerUID player) in DS_clanBase7))then{DS_clanBase7 pushBack (getPlayerUID player);publicVariable "DS_clanBase7";};
		};
	case 8:
		{
		if(!((getPlayerUID player) in DS_clanBase8))then{DS_clanBase8 pushBack (getPlayerUID player);publicVariable "DS_clanBase8";};
		};
	};