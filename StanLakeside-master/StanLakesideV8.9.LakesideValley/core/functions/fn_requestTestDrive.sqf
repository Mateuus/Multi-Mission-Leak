/*
	fn_requestTestDrive.sqf
	Pennyworth
*/

params ["_requested","_requester"];

if!(_requested isEqualTo player) exitWith {};
if(life_onTestDrive) then {
	["life_testDriveRequest",false] remoteExecCall ["life_fnc_netSetVar",_requester];
	[format ["%1 is already on a test drive.",player], false] remoteExec ["domsg",_requester];
};

_result = [format ["Would you like to go on a test drive with %1?",name _requester], "Confirm", "Yes", "No", nil, false, false] call BIS_fnc_guiMessage;

["life_testDriveRequest",_result] remoteExecCall ["life_fnc_netSetVar",_requester];
