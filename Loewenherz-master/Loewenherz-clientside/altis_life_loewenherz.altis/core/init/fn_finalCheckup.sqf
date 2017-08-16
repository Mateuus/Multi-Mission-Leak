/*
	File: fn_finalCheckup.sqf
	Author: Blackd0g

	Description:
	validate player variables & login procedure
*/
private["_exit"];

_exit = {
	["Error",true,false] spawn LHM_fnc_endMission;
	diag_log "::lhm Client:: Error Client Validation failed!";
};

_isNilVarCheck = {
	if(isNil "_this") then {true} else {false};
};

_varsToCheck = [
	LHM_initDone,
	lhm_session_completed,
	lhm_hunger,
	lhm_thirst,
	lhm_maxWeightT,
	lhm_drink,
	lhm_garage_sell,
	lhm_coplevel,
	lhm_mediclevel,
	lhm_seclevel,
	lhm_gear,
	lhm_fnc_garageRefund,
	MISSION_ROOT,
	lhm_cash,
	lhm_atmcash,
	lhm_lastPosition
];

{
	_return = _x call _isNilVarCheck;
	if(_return) exitWith{call _exit};
} forEach _varsToCheck;

if(!alive player) exitWith{call _exit};
if(!LHM_initDone) exitWith{call _exit};
if(viewDistance == 15) exitWith{call _exit};
if(isNull hud_lhmHealth || isNull  hud_lhmWeight || isNull hud_lhmStamina || IsNull hud_lhmRun || isNull hud_lhmAlcohol  || isNull hud_lhmBuffs) exitWith{call _exit};
if(lhm_action_inUse) exitWith{call _exit};
if(lhm_respawn_timer == 0) exitWith{call _exit};
if(!lhm_lastPositionLoaded) exitWith{call _exit};
if(lhm_gear isEqualTo []) exitWith{call _exit};
if(uniform player isEqualTo "") exitWith{call _exit};



	switch(playerSide) do
	{
		case west: {
			if((call lhm_coplevel) == 0) exitWith{call _exit};
		};

		case civilian: {

		};

		case independent: {
			if((call lhm_mediclevel) == 0) exitWith{call _exit};
		};

		case east: {
			if((call lhm_seclevel) == 0) exitWith{call _exit};
		};

	};