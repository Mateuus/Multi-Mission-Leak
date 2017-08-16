/*
	File: fn_setwanted.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Opens dialog for cops to set civilians wanted
*/
private["_display","_text","_units","_type"];

if(DS_copLevel < 3)exitwith {hint "This is for rank 3 and above police officers!";};

closeDialog 0;
createDialog "setwanted";
disableSerialization;
