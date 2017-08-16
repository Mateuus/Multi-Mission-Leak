private["_action"];

_action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint localize "STR_GNOTF_DisbandGangPro";
	[[group player], "TON_fnc_removeGang", false] call GTA_fnc_remoteExec;
} else {
	hint localize "STR_GNOTF_DisbandGangCanc";
};
