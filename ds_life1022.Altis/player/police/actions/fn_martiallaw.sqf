/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens dialog for cops to set martial law
*/

private["_display","_text","_units","_type"];

if(DS_copLevel < 5)exitwith {hint "This is for rank 5 and above police officers!";};

if(!dialog) then
{
	if(!(createDialog "martialLaw")) exitWith {};
};

disableSerialization;