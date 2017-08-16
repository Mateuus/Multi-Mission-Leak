/*
	File: fn_updateDialogText.sqf
	Author: Niklas "Rappelkiste" Quenter
	
	Description:
	Initializes the progress bar befor the Spawnmenu.
*/
private["_text","_Dialog","_RSC_form"];
disableSerialization;
_text = _this select 0;
_Dialog = _this select 1;
_RSC_form = _this select 2;

switch _RSC_form do
{
	case 1:{disableSerialization; _Dialog ctrlSetStructuredText parseText _text;};
	case 2:{disableSerialization; _Dialog ctrlSetText _text;};
};