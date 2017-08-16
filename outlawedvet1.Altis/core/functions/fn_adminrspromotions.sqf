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
};

