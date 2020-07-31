#include <macro.h>
/*
	
	
	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private["_action"];

_action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint localize "STR_GNOTF_DisbandGangPro";
	[grpPlayer] remoteExec ["TON_fnc_removeGang",(call life_fnc_HCC)];
} else {
	hint localize "STR_GNOTF_DisbandGangCanc";
};