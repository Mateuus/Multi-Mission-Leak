private ["_name",  "_group",  "_members"];
_name = [_this, 0, "", [""]] call GTA_fnc_param;
_group = [_this, 1, grpNull, [grpNull]] call GTA_fnc_param;
if (_name == "" OR isNull _group) exitWith {};
if (!isNil {(group player) getVariable "gang_name"}) exitWith {hint "You are already in a gang"};

_gangName = _group getVariable "gang_name";
_action = [
	format[localize "STR_GNOTF_InviteMSG", _name, _gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	[player] joinSilent _group;
	waitUntil {group player isEqualTo _group};
	_members = _group getVariable "gang_members";
	_members pushBack getPlayerUID player;
	_group setVariable ["gang_members", _members, true];
	[[4, _group, _members], "TON_fnc_updateGang", false] call GTA_fnc_remoteExec;
};
