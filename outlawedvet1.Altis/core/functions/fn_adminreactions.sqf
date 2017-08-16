#include "..\..\script_macros.hpp"
/*
    File: fn_adminreactions.sqf
    Author: RPGforYOU from outlawed-veterans.com
	
	Description:
	Executes admin actions
*/
private["_action","_unit","_message"];
_action = [_this,0,-1,[0]] call BIS_fnc_param;
//if(FETCH_CONST(life_adminlevel) == 5) exitWith {hint "Someone tried to execute a Punishment action on you"};

switch (_action) do {
	//kick
	case 1: {
	if (FETCH_CONST(life_adminlevel) > 4) exitWith {closeDialog 0;};
	["KICK",false,true] call BIS_fnc_endMission;
	};
	//Tempban
	case 2: {
	if (FETCH_CONST(life_adminlevel) > 4) exitWith {closeDialog 0;};
	[99] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["TEMPBAN",false,true] call BIS_fnc_endMission;
	};
	//Dayban
	case 3: {
	if (FETCH_CONST(life_adminlevel) > 4) exitWith {closeDialog 0;};
	[18] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["COMBATLOG",false,true] call BIS_fnc_endMission;
	};
	//Permban
	case 4: {
	if (FETCH_CONST(life_adminlevel) > 4) exitWith {closeDialog 0;};
	[97] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["PERMBAN",false,true] call BIS_fnc_endMission;
	};
	//Blacklist
	case 5: {
	if (FETCH_CONST(life_adminlevel) > 4) exitWith {closeDialog 0;};
	[96] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["BLACKL",false,true] call BIS_fnc_endMission;
	};
	//Army rank 1
	case 6: {
	[30] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["ARMY",false,true] call BIS_fnc_endMission;
	};
	//Army rank 2
	case 7: {
	[31] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["ARMY",false,true] call BIS_fnc_endMission;
	};
	//Army rank 3
	case 8: {
	[32] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["ARMY",false,true] call BIS_fnc_endMission;
	};
	//Army rank 4
	case 9: {
	[33] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["ARMY",false,true] call BIS_fnc_endMission;
	};
	//Swat rank 1
	case 10: {
	[20] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["SWAT",false,true] call BIS_fnc_endMission;
	};
	//Swat rank 2
	case 11: {
	[21] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["SWAT",false,true] call BIS_fnc_endMission;
	};
	//Swat rank 3
	case 12: {
	[22] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["SWAT",false,true] call BIS_fnc_endMission;
	};
	//Swat rank 4
	case 13: {
	[23] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["SWAT",false,true] call BIS_fnc_endMission;
	};
	//Swat DEMOTION
	case 14: {
	[29] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["SWATDEMOTE",false,true] call BIS_fnc_endMission;
	};
	//Army DEMOTION
	case 15: {
	[39] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["ARMYDEMOTE",false,true] call BIS_fnc_endMission;
	};
};

