/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Updates the gang members list
*/

private ["_gangName"];

//_gangObject = [] call DS_civ_findMyGang;
_gangName = (group player) getVariable ["gangName",""];

if(_gangName != "")then
	{
	[] spawn DS_civ_menuGangMain;
	}
	else
	{
	[] spawn DS_civ_menuGangList;
	};
	
	





























