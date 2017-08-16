/*
	ArmA.Network
	Rathbone
	Public Announcement: Sends to Server to finalize
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;
_message = param [0,"",[""]];
if(_message isEqualTo "") exitWith {hintSilent "You must enter something to send!";};
if([":",_message] call BIS_fnc_inString) exitWith {hintSilent "A bad character was found (:,-,/ etc.)";};
_len = [_message] call KRON_StrLen;
if(_len > 150) exitWith {hintSilent "The maximum character limit for a public announcement is 150.";};
[objNull,_message,player,7] remoteExecCall ["TON_fnc_handleMessages",2];
closeDialog 0;
