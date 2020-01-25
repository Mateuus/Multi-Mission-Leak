/*
	fn_arrestButton.sqf
*/

_display = findDisplay 5546;
_nameofperson = _display displayCtrl 2200;
_timeinminute = _display displayCtrl 2201;
_reasonofjail = _display displayCtrl 2202;
_playername = ctrlText _nameofperson;
_jailtime = ctrlText _timeinminute;
_reason = ctrlText _reasonofjail;
if(isNull personyouwanjail) exitWith {};

detach personyouwanjail;
[personyouwanjail,false,_jailtime,_reason] remoteExec ["life_fnc_sendToJail",personyouwanjail];
[personyouwanjail,player,false] remoteExecCall ["life_fnc_wantedBounty",2];
