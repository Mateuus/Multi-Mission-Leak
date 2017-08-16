/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private[];
disableSerialization;
if((lbCurSel 1500) isEqualTo -1) exitWith {hintSilent "You must select a person to kick.";};
_unit = call compile format["%1",lbData[1500,(lbCurSel 1500)]];
if(isNull _unit) exitWith {};
if(isNil "_unit") exitWith {};
if(_unit isEqualTo player) exitWith {hintSilent "You cannot kick yourself from the gang.";};
[_unit,group player] remoteExecCall ["life_fnc_gangKickRequest",2];
call life_fnc_hucruphu;
