#include <macro.h>

/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
life_session_loading = false;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Takistan Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";

//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";

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

if(!isNil "life_server_extDB_notLoaded" && {life_server_extDB_notLoaded != ""}) exitWith {
	diag_log life_server_extDB_notLoaded;
	999999 cutText [life_server_extDB_notLoaded,"BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
disableUserInput true;
[] call life_fnc_confirmPlayer;
waitUntil {life_session_loading};
disableUserInput false;
//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;

switch (playerSide) do {
	case west: {
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	case civilian: {
		life_session_completed = false;
		diag_log "::Life Client:: Loading gang";
		[] call life_fnc_gangInit;
		waitUntil {life_session_completed};
		diag_log "::Life Client:: Gang loaded.";
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	case independent: {
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

// Credit Zannaza from A3L
if (isNil "TFAR_fnc_isTeamSpeakPluginEnabled") exitwith {

	999999 cutText ["Task Force Radio is not running on your computer. Please re-sync and retry","BLACK FADED"];
	999999 cutFadeOut 99999999;

};



_TFenabled = [] call TFAR_fnc_isTeamSpeakPluginEnabled;

if (!(_TFenabled)) then {

	while {!([] call TFAR_fnc_isTeamSpeakPluginEnabled)} do {

		titleText ["Please enable Task Force Radio in your TS3 Plugins! || TS3 -> Settings -> Plugins", "BLACK"];
		sleep 2;

	};
};

A3L_TFEnabled = true;
A3L_onTsServer = "Arma.Network Teamspeak" == (call TFAR_fnc_getTeamSpeakServerName);
A3L_onChannel = "TaskForceRadio" == (call TFAR_fnc_getTeamSpeakChannelName);
titleText ["Task Force Radio loaded succesfully","BLACK IN"];

[] spawn {

	while {true} do {

				_isadmin = false;
				if (!(isNil "life_adminlevel")) then {
					_adminlvl = life_adminlevel call BIS_fnc_parseNumber;

					if (_adminlvl > 0) then {
						_isadmin = true;
					};
				};

				if (!(_isadmin)) then {

					_TFenabled = [] call TFAR_fnc_isTeamSpeakPluginEnabled;
					if ((!(_TFenabled)) && (A3L_TFEnabled)) then {
						titleText ["Please enable Task Force Radio in your TS3 Plugins! || TS3 -> Settings -> Plugins", "BLACK"];
						A3L_TFEnabled = false;
					};

					_onTsServer = "Arma.Network Teamspeak" == (call TFAR_fnc_getTeamSpeakServerName);
					if (!(_onTsServer)) then {
						titleText ["Please join the teamspeak server!", "BLACK"];
						A3L_onTsServer = false;
					} else {
						if (!(A3L_onTsServer)) then {
							titleText ["TS server check completed. Welcome!","BLACK IN"];
							A3L_onTsServer = true;
						};
					};

					_onChannel = "TaskForceRadio" == (call TFAR_fnc_getTeamSpeakChannelName);
					if (!(_onChannel)) then {
						titleText ["Please reload the plugin to join the TFR channel || Settings -> Plugins -> Reload All", "BLACK"];
						A3L_onChannel = false;
					} else {
						if (!(A3L_onChannel)) then {
							titleText ["TS channel check completed. Welcome!","BLACK IN"];
							A3L_onChannel = true;
						};
					};


					if ((_TFenabled) && (!(A3L_TFEnabled))) then {
						titleText ["Plugin enabled, welcome back!","BLACK IN"];
						A3L_TFEnabled = true;
					};

				};

				sleep 2;
			};

};

// Credit Zannaza from A3L
player SVAR ["restrained",false,true];
player SVAR ["Escorting",false,true];
player SVAR ["transporting",false,true];

diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";

diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};

diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Takistan Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";

life_sidechat = false;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false,true] call life_fnc_MP;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;

/* Set up frame-by-frame handlers */
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player SVAR ["steam64ID",getPlayerUID player];
player SVAR ["realname",profileName,true];

life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

[] spawn life_fnc_survival;
[] spawn life_fnc_autoSave;

CONSTVAR(life_paycheck); //Make the paycheck static.
if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),0)) then {player enableFatigue false;};
[getPlayerUID player,player getVariable["realname",name player]] remoteExecCall ["life_fnc_wantedProfUpdate",2];
DYNAMICMARKET_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;
