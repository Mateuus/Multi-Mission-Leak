/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private[];
disableSerialization;

if ((lbCurSel 2621) == -1) exitWith { hint "You must select a person to kick."; };
_unit = call compile format["%1", lbData[2621,(lbCurSel 2621)]];
if(isNull _unit) exitWith {}; //This is actually possible if the player logs out when the window is open.
if(_unit == player) exitWith {hint "You cannot kick yourself from the gang."; };


[_unit, grpPlayer] remoteExecCall ["life_fnc_gangKickRequest",2];

[] call life_fnc_gangMenu;
