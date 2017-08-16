/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Opens the gang creation menu
*/

if(!isNil {((group player) getVariable "gangName")})exitWith{hint "You are already in a gang"};

closeDialog 0;
createDialog "gangMenuCreate";