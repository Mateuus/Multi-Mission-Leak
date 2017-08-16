/*
	File: fn_inviteGang.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Shows invitation UI or sends invitation to other player
*/

private ["_send", "_allPlayers", "_display", "_units"];

_send = [_this,0,false,[false]] call BIS_fnc_param;

if (life_gang_rank > 2) exitWith {hint "You are not high enough in rank to send an invitation.";};
disableSerialization;

if (_send) then
{
	waitUntil {!isNull findDisplay 9550};
	_display = findDisplay 9550;
	_info = lbData[9555,lbCurSel (9555)];
	_info = call compile format["%1", _info];
	if(isNil "_info") exitWith {hint "Could not find player to send invitation. They may have disconnected.";};
	if(isNull _info) exitWith {hint "Could not find player to send invitation. They may have disconnected.";};
	hint format["Sending gang invitation to %1...", name _info];
	closeDialog 0;
	[[player,life_gang, player getVariable ["gangName","unknown"]],"life_fnc_invitedGang",_info,false] spawn life_fnc_MP;
}
else
{
	createDialog "Life_Invite_Gang_Diag";
	waitUntil {!isNull findDisplay 9550};
	_display = findDisplay 9550;
	_units = _display displayCtrl 9555;

	lbClear _units;

	_allPlayers = [];
	{
		if ((side _x) == civilian && (_x getVariable ["gangName", ""]) == "") then { _allPlayers set [count _allPlayers, name _x]; };
	} foreach allPlayers;
	_playableSorted = _allPlayers call BIS_fnc_sortAlphabetically;
	{
		_name = _x;
		{
			if (name _x == _name && alive _x && _x != player) then
			{
				_units lbAdd format["%1",name _x];
				_units lbSetData [(lbSize _units)-1,str(_x)];
			};
		} foreach allPlayers;
	} foreach _playableSorted;

	lbSetCurSel [9555,0];
};