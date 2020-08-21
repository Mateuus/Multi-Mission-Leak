#include "..\script_macros.hpp"
/*
	File: init.sqf
	Author:

	Description:
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";
enableSentences false;

//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";

//Set bank amount for new players
switch (playerSide) do {
	case west: {
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_cop");
	};
	case civilian: {
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_civ");
	};
	case independent: {
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_med");
	};
};

diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;

diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;

diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};

diag_log "::Life Client:: Received server functions.";
0 cutText ["Waiting for the server to be ready...","BLACK FADED"];
0 cutFadeOut 99999999;

diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};

if(!isNil "life_server_extDB_notLoaded" && {life_server_extDB_notLoaded isEqualType []}) exitWith {
	diag_log life_server_extDB_notLoaded;
	999999 cutText [life_server_extDB_notLoaded,"BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

"colorCorrections" ppEffectAdjust [1, 1.15, -0.004, [0.0, 0.0, 0.0, 0.0], [1.4, 1.2, 1.2, 1.4], [0.199, 0.587, 0.114, 0.0]];
"colorCorrections" ppEffectCommit 0;
"colorCorrections" ppEffectEnable true;

//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;

switch (playerSide) do {
	case west: {
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	case civilian: {
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	case independent: {
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

player SVAR ["restrained",false,true];
player SVAR ["tied",false,true];
player SVAR ["Escorting",false,true];
player SVAR ["transporting",false,true];
player SVAR ["playerSurrender",false,true];
player SVAR ["missingOrgan",false,true];
player SVAR ["hasOrgan",false,true];

diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";

diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};

diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";

[player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_managesc",RSERV];
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;

/* Set up frame-by-frame handlers */
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player SVAR ["steam64ID",steamid];
player SVAR ["realname",profileName,true];

life_fnc_moveIn = compileFinal
"
	life_disable_getIn = false;
	player moveInCargo (_this select 0);
	life_disable_getOut = true;
";

life_fnc_RequestClientId = player;
publicVariableServer "life_fnc_RequestClientId"; //Variable OwnerID for HeadlessClient

[] spawn life_fnc_survival;

[] spawn
{
	for "_i" from 0 to 1 step 0 do {
		waitUntil {vehicle player != player};
		waitUntil {vehicle player == player};

		_time = if (!life_seatbelt) then {time + 0.8} else {time + 1.5};
		[] spawn {
			sleep 0.1;
			if(handgunWeapon player isEqualTo "" && primaryWeapon player isEqualTo "") exitWith {};
			[player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["life_fnc_animSync"];
			player switchMove "AmovPercMstpSnonWnonDnon";
		};
		while {_time > time} do {
			if (currentWeapon player != "") then {
				// Hide weapon while getting out
				//player action ["SwitchWeapon", player, player, 100];
			};
		};
		uiSleep 1;
	};
};

[] spawn
{
	for "_i" from 0 to 1 step 0 do {
		if(vehicle player == player) then
		{
			if(life_seatwarn) then {
				life_seatwarn = false;
			};
			if(life_seatbelt) then {
				sleep 3;
				life_seatbelt = false;
			};
			uiSleep 5;
		};
		if(vehicle player != player && !(player getVariable ["Escorting", false]) && !(player getVariable ["restrained", false]) && (vehicle player isKindOf "LandVehicle")) then
		{
			if(speed vehicle player > 90 && !life_seatbelt) then
			{
				oldVehVelocity = velocity (vehicle player);
				sleep 0.3;
				if(speed vehicle player < 1) then
				{
					playSound "glassbreak";
					moveOut player;
					player setVelocity [(oldVehVelocity select 0) * 0.4,(oldVehVelocity select 1) * 0.4,((oldVehVelocity select 2) * 0.4) + 5];
					sleep 2;
					player switchmove "";
				};
			} else {
				if(!life_seatwarn) then {
					sleep 1;
					playSound "seatwarn";
					life_seatwarn = true;
				};
				uiSleep 1;
			};
		};
	};
};

[] spawn
{
	for "_i" from 0 to 1 step 0 do {
		waitUntil {(life_drink > 0)};
		while{(life_drink > 0)} do {
			if(life_drink > 0.08) then {
				"radialBlur" ppEffectEnable true;
				"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
				"radialBlur" ppEffectCommit 3;
				sleep 240;
				life_drink = life_drink - 0.02;
			} else {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
			"radialBlur" ppEffectCommit 1;
			sleep 180;
			life_drink = life_drink - 0.02;
			};
		};
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		life_drink = 0;
	};
};
[] spawn {
 while{true} do
 {
 waitUntil {(player GVAR "missingOrgan")};
 life_max_health = .50;
 while{(player GVAR "missingOrgan")} do {
 life_thirst = 50;
 life_hunger = 50;
 if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
 "dynamicBlur" ppEffectEnable true;
 "dynamicBlur" ppEffectAdjust [2];
 "dynamicBlur" ppEffectCommit 1;
 sleep 5;
 };
 "dynamicBlur" ppEffectEnable false;
 life_max_health = 1;
 };
};
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        sleep 600;
        [] call SOCK_fnc_updateRequest;
        hint "Gra Zapisana.";
	};
};

CONSTVAR(life_paycheck); //Make the paycheck static.
if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),0)) then {player enableFatigue false;};

if(EQUAL(LIFE_SETTINGS(getNumber,"pump_service"),1)) then{
	[] execVM "core\fn_setupStationService.sqf";
};

if(life_HC_isActive) then {
	[getPlayerUID player,player getVariable["realname",name player]] remoteExec ["HC_fnc_wantedProfUpdate",HC_Life];
} else {
	[getPlayerUID player,player getVariable["realname",name player]] remoteExec ["life_fnc_wantedProfUpdate",RSERV];
};
setTerrainGrid 50;