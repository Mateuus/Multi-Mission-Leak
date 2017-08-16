/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens Jail Dialog
*/

if(((player getVariable ["policeAction",""]) != "Processing")&&(playerside == west))exitwith{hint "You can not do this while your task is not set to processing"};

closeDialog 0;
createDialog "jailMenu";