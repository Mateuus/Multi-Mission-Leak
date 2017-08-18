/*
	File: fn_calldialog.sqf
	Description:
	Calls the Dialog.
    
*/
if(!createDialog "channel") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;