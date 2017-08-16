/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Updates the gang members list
*/

private _group = (group player);
private _gangName = _group getVariable ["gangName",""];

if(!(_gangName isEqualTo ""))then {
	[] spawn DS_civ_menuGangMain;
} else {
	[] spawn DS_civ_menuGangList;
};