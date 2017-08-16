/*
	File: fn_pardon.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Pardons the selected player.
*/
private["_display","_list","_uid","_exit","_unit"];
disableSerialization;
_unit = null;
_exit = false;
if (playerSide != west && (getPlayerUID player == (life_configuration select 0))) then
{
	if (!isNil "life_gov_pardon") then
	{
		if (life_gov_pardon) then { _exit = true; };
	};
};
if (_exit) exitWith { hint "As the governor, you may only pardon once per world session!"; };

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

_uid = _data select 1;
{ if (getPlayerUID _x == _uid) then { _unit = _x; if (_x getVariable ["restrained",false]) then { _exit = true; }; }; } forEach allPlayers;
if (_exit) exitWith { hint "You cannot pardon someone who is restrained in the process of arrest." };
if (playerSide != west && (getPlayerUID player == (life_configuration select 0))) then
{
	if (getPlayerUID player == _uid) then { _exit = true; };
};
if (_exit) exitWith { hint "You cannot pardon yourself. Corruption only goes so far!" };

if (playerSide != west && (getPlayerUID player == (life_configuration select 0))) exitWith
{
	[[format["%1 wants to pardon you, do you accept?",name player], player],"life_fnc_confirmGovPardon",_unit,false] spawn life_fnc_MP;
	hint format["You are attempting to pardon %1, please wait while they accept or decline your offer.", name _unit];
	life_gov_pardon = true;
	publicVariable "life_gov_pardon";
};
_word = if(getPlayerUID player == (life_configuration select 0) && playerSide != west) then {"%1 has been pardoned by Governor %2"} else {"%1 has been pardoned by %2"};
[[_uid],"life_fnc_wantedPardon",false,false] spawn life_fnc_MP;
[[format[_word,_data select 0, name player]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP;
_unit setVariable ["parole",nil,true];
_unit setVariable ["paroleViolated", nil, true];