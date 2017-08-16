/*
	File: fn_gangWars.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Called when the gang war UI is initiated
*/

disableSerialization;

if (life_gang == "0") exitWith {hint "You are not currently a member of a gang. You must create one or receive an invitation.";closeDialog 0;};

waitUntil {!isNull (findDisplay 9580)};
_dialog = findDisplay 9580;
_gangs = _dialog displayCtrl 9581;
lbClear _gangs;
ctrlSetText[9585,player getVariable ["gangName", ""]];

ctrlEnable [9582, false];
ctrlEnable [9583, false];
ctrlEnable [9584, false];

_gangIndex = [life_gang];
{
	if ((_x getVariable ["gang", "0"]) != "0" && !((_x getVariable ["gang", "0"]) in _gangIndex)) then
	{
		_gangIndex pushBack (_x getVariable "gang");
		_label = _x getVariable ["gangName","[INVALID GANG NAME]"];// + format[" [%1]",count units _x];
		if ((_x getVariable "gang") in life_gang_wars) then { _label = "[WARRING] " + _label; };
		if ((_x getVariable "gang") in life_gang_challenges) then { _label = "[CHALLENGED] " + _label; };
		_gangs lbAdd _label;
		_gangs lbSetData [(lbSize _gangs)-1, (_x getVariable "gang")];
	};
} forEach allPlayers;

lbSetCurSel [9581, 0];