/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Open create a gang dialog
*/


if(!isNil {((group player) getVariable "gangName")})exitwith{hint "You are already in a gang"}; 

closeDialog 0;
createDialog "gangMenuCreate";
