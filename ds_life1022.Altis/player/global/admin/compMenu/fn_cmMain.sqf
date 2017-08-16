/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Opens the main compensation menu
*/

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminlist1)))exitWith{hint "You aren't allowed to use this menu";};

closeDialog 0;
createDialog "compMenuMain";