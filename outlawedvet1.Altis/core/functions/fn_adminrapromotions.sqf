#include "..\..\script_macros.hpp"
/*
    File: fn_adminrapromotions.sqf
    Author: RPGforYOU from outlawed-veterans.com
	
	Description:
	Executes admin actions
*/
private["_action","_unit","_message"];
_action = [_this,0,-1,[0]] call BIS_fnc_param;
//if(FETCH_CONST(life_adminlevel) == 5) exitWith {hint "Someone tried to execute a Punishment action on you"};

switch (_action) do {
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
	//Army DEMOTION
	case 15: {
	[39] call SOCK_fnc_updatePartial;
	uiSleep 3;
	["ARMYDEMOTE",false,true] call BIS_fnc_endMission;
	};
};

