/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private[];

_action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	hintSilent localize "STR_GNOTF_DisbandGangPro";
	[(group player)] remoteExecCall ["life_fnc_gangDisbandRequest",2];
} else {
	hintSilent localize "STR_GNOTF_DisbandGangCanc";
};
