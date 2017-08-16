#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
lhm_session_tries = lhm_session_tries + 1;
diag_log format ["::lhm Client:: Session Request tries %1..",lhm_session_tries];
if(lhm_session_completed) exitWith {diag_log "::lhm Client:: Error - lhm_session_completed already initialized!"}; //Why did this get executed when the client already initialized? Fucking arma...
if(lhm_session_tries > 3) exitWith {diag_log "::lhm Client:: Error - Session Request Timed out!"; ["Session received",localize "STR_Session_Error"] call lhm_fnc_statusMsg; 0 cutFadeOut 999999999;};

["Session received",localize "STR_Session_Received"] call lhm_fnc_statusMsg;
0 cutFadeOut 9999999;
//Error handling and  junk..
if(isNil "_this") exitWith {diag_log "::lhm Client:: isNil _this"; [] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {diag_log "::lhm Client:: _this is String"; [] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {diag_log "::lhm Client:: Session is empty"; [] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {diag_log "::lhm Client:: Error received"; [] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {diag_log "::lhm Client:: UID is not the same"; [] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "lhm_adminlevel" OR !isNil "lhm_coplevel" OR !isNil "lhm_donator")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] call lhm_fnc_mp;
	[[profileName,format["Variables set before client initialization...\nlhm_adminlevel: %1\nlhm_coplevel: %2\nlhm_donator: %3",lhm_adminlevel,lhm_coplevel,lhm_donator]],"SPY_fnc_notifyAdmins",true,false] call lhm_fnc_mp;
	sleep 0.9;
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};

//LHM_clock call lhm_fnc_hud_clockInit;

diag_log "::lhm Client:: parsing Database Session..";
//diag_log format ["%1 | %2 | %3",_this select 9,_this select 10,_this select 11];
//Parse basic player information.
lhm_cash = parseNumber (_this select 2); diag_log "::lhm Client:: Session >> Cash...";
lhm_atmcash = parseNumber (_this select 3); diag_log "::lhm Client:: Session >> ATM Cash...";
__CONST__(lhm_adminlevel,parseNumber(_this select 4)); diag_log "::lhm Client:: Session >> Adminlevel...";
__CONST__(lhm_donator,0); diag_log "::lhm Client:: Session >> Donator Level...";

//Loop through licenses
if(count (_this select 6) > 0) then { diag_log "::lhm Client:: Session Loop through Licenses...";
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};
diag_log "::lhm Client:: Session >> getting Gear...";
lhm_gear = _this select 8;

// papabears-persistent-proficiency-system // (nachfolgende select +1)
if(count (_this select 9) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),[parseNumber (_x select 1), parseNumber (_x select 2)]];
	} foreach (_this select 9);
};diag_log "::lhm Client:: Session >> setup Skill-System...";
// papabears-persistent-proficiency-system //


diag_log "::lhm Client:: Session parsing Side specific Data...";
//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(lhm_coplevel, parseNumber(_this select 7)); diag_log "::lhm Client:: Session >> Coplevel...";
		__CONST__(lhm_medicLevel,0);
		diag_log "::lhm Client:: Session Setup >> Survival-Stats...";
		lhm_hunger = (_this select 11) select 0;
		lhm_thirst = (_this select 11) select 1;
		lhm_health = (_this select 11) select 2;
		LHM_disease = (_this select 11) select 3;
		if((1 - (lhm_health / 100)) > 0.95) then {
			player setdamage 0.95;
			lhm_health = 5;
		} else {
			player setDamage (1 - (lhm_health / 100));
		};

		diag_log "::lhm Client:: Session >> Player Blacklisted...";
		lhm_blacklisted = _this select 10;

		// Validate position
		lhm_lastPosition = _this select 12;
		diag_log format["::lhm Client:: Session >> validate position... %1",lhm_lastPosition];
		if (typename lhm_lastPosition != "ARRAY" || count lhm_lastPosition != 2) then {
			lhm_lastPosition = [];
		} else {
			{
				if ((getMarkerPos (_x select 0)) distance (lhm_lastPosition select 1) < (_x select 1)) then {
					lhm_lastPosition = [];
				};
			} forEach blacklistedSpawnAreas;
		};
		lhm_lastPositionLoaded = true;
		diag_log "::lhm Client:: Session >> Position loaded";
	};

	case civilian: {
		lhm_is_arrested = parseNumber(_this select 7);
		__CONST__(lhm_coplevel, 0);
		__CONST__(lhm_medicLevel, 0);
		__CONST__(lhm_seclevel, 0);
		lhm_houses = _this select 13;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			lhm_vehicles pushBack _house;
			//lhm_vehicles pushback _x;
		} foreach lhm_houses;


		lhm_gangData = _This select 14;
		if(count lhm_gangData != 0) then {
			[] spawn lhm_fnc_initGang;
		};
		[] spawn lhm_fnc_initHouses;
		diag_log "::lhm Client:: Session >> Setup Survival...";
		lhm_hunger = (_this select 10) select 0;
		lhm_thirst = (_this select 10) select 1;
		lhm_health = (_this select 10) select 2;
		LHM_disease = (_this select 10) select 3;
		if((1 - (lhm_health / 100)) > 0.95) then {
			player setdamage 0.95;
			lhm_health = 5;
		} else {
			player setDamage (1 - (lhm_health / 100));
		};

		// Validate position
		lhm_lastPosition = _this select 11;
		diag_log format["::lhm Client:: Session >> validate position... %1",lhm_lastPosition];
		if (typename lhm_lastPosition != "ARRAY" || count lhm_lastPosition != 2) then {
			lhm_lastPosition = [];
		} else {
			{
				if ((getMarkerPos (_x select 0)) distance (lhm_lastPosition select 1) < (_x select 1)) then {
					lhm_lastPosition = [];
				};
			} forEach blacklistedSpawnAreas;
		};
		lhm_lastPositionLoaded = true;
		diag_log "::lhm Client:: Session >> Position loaded";
	};

	case independent: {
		__CONST__(lhm_medicLevel, parseNumber(_this select 7)); diag_log "::lhm Client:: Session >> Mediclevel...";
		__CONST__(lhm_coplevel, 0);
		__CONST__(lhm_seclevel, 0);
		diag_log "::lhm Client:: Session >> Setup Survival...";
		lhm_hunger = (_this select 10) select 0;
		lhm_thirst = (_this select 10) select 1;
		lhm_health = (_this select 10) select 2;
		LHM_disease = (_this select 10) select 3;
		if((1 - (lhm_health / 100)) > 0.95) then {
			player setdamage 0.95;
			lhm_health = 5;
		} else {
			player setDamage (1 - (lhm_health / 100));
		};

		// Validate position
		lhm_lastPosition = _this select 11;
		diag_log format["::lhm Client:: Session >> validate position... %1",lhm_lastPosition];
		if (typename lhm_lastPosition != "ARRAY" || count lhm_lastPosition != 2) then {
			lhm_lastPosition = [];
		} else {
			{
				if ((getMarkerPos (_x select 0)) distance (lhm_lastPosition select 1) < (_x select 1)) then {
					lhm_lastPosition = [];
				};
			} forEach blacklistedSpawnAreas;
		};
		lhm_lastPositionLoaded = true;
		diag_log "::lhm Client:: Session >> Position loaded";
	};

	case east: { // Security Team
		__CONST__(lhm_seclevel, parseNumber(_this select 7));
		__CONST__(lhm_coplevel, 0);
		__CONST__(lhm_medicLevel, 0);

		diag_log "::lhm Client:: Session >> Setup Survival...";

		lhm_hunger = (_this select 10) select 0;
		lhm_thirst = (_this select 10) select 1;
		lhm_health = (_this select 10) select 2;
		LHM_disease = (_this select 10) select 3;
		if((1 - (lhm_health / 100)) > 0.95) then {
			player setdamage 0.95;
			lhm_health = 5;
		} else {
			player setDamage (1 - (lhm_health / 100));
		};

		// Validate position
		lhm_lastPosition = _this select 11;
		diag_log format["::lhm Client:: Session >> validate position... %1",lhm_lastPosition];
		if (typename lhm_lastPosition != "ARRAY" || count lhm_lastPosition != 2) then {
			lhm_lastPosition = [];
		} else {
			{
				if ((getMarkerPos (_x select 0)) distance (lhm_lastPosition select 1) < (_x select 1)) then {
					lhm_lastPosition = [];
				};
			} forEach blacklistedSpawnAreas;
		};
		lhm_lastPositionLoaded = true;
		diag_log "::lhm Client:: Session >> Position loaded";
	};

};

[] call lhm_fnc_loadGear;
diag_log "::lhm Client:: Session >> Load Gear...";

diag_log "::lhm Client:: Session >> Vehicle Keys...";
if(count (_this select 15) > 0) then {
	{lhm_vehicles pushBack _x;} foreach (_this select 15);
};

lhm_session_completed = true;
diag_log "::lhm Client:: lhm_session_completed";