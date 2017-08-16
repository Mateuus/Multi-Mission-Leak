#include "..\script_macros.hpp"
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Chargement du client ...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player};
enableSentences false;

diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\load\configuration.sqf";


switch (playerSide) do {
	case west: {
		BANK = LIFE_SETTINGS(getNumber,"bank_cop");
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_cop");
	};
	case civilian: {
		BANK = LIFE_SETTINGS(getNumber,"bank_civ");
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_civ");
	};
	case independent: {
		BANK = LIFE_SETTINGS(getNumber,"bank_med");
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_med");
	};
	case east: {
		BANK = LIFE_SETTINGS(getNumber,"bank_armer");
		life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_armer");
	};
};

life_ppColor = ppEffectCreate ["colorCorrections",2015];
life_ppColor ppEffectEnable true;
life_ppColor ppEffectAdjust [1,1,-0.03,[0,0,0,0],[0.4,0.3,0.2,1.3],[1,1,1,0]];
life_ppColor ppEffectCommit 0;

profileNamespace setVariable ["GUI_BCG_RGB_R", 0.85];
profileNamespace setVariable ["GUI_BCG_RGB_G", 0.05];
profileNamespace setVariable ["GUI_BCG_RGB_B", 0.05];
profileNamespace setVariable ["GUI_BCG_RGB_A", 0.8];
saveProfileNamespace;

diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;

diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;

_handle = [] spawn compile preprocessFileLineNumbers "core\extra\speedtrap\functions.sqf";

diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};

diag_log "::Life Client:: Received server functions.";
0 cutText ["Chargement du serveur ...","BLACK FADED"];
0 cutFadeOut 99999999;

diag_log "::Life Client:: En attente du serveur ...";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady || !isNil "life_server_extDB_notLoaded")};

if(!isNil "life_server_extDB_notLoaded" && {life_server_extDB_notLoaded != ""}) exitWith {
	diag_log life_server_extDB_notLoaded;
	999999 cutText [life_server_extDB_notLoaded,"BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Lancement du mode !","BLACK FADED"];
0 cutFadeOut 9999999;


[] spawn life_fnc_escInterupt;

switch (playerSide) do {
	case west: {
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	case civilian: {
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	case independent: {
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
	case east: {
		_handle = [] spawn life_fnc_initArmer;
		waitUntil {scriptDone _handle};
	};
	case sideLogic:	{
			_handle = [] spawn life_fnc_initZeus;
			waitUntil {scriptDone _handle};
	};
};
waitUntil {sleep 0.5;!life_firstSpawn};

player SVAR ["restrained",false,true];
player SVAR ["life_istazed",false,true];
player SVAR ["life_is_alive",true,true];
player SVAR ["Escorting",false,true];
player SVAR ["transporting",false,true];
player SVAR ["playerSurrender",false,true];

player switchCamera "EXTERNAL";
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

life_sidechat = false;
[player,life_sidechat,playerSide] remoteExecCall ["TON_fnc_managesc",RSERV];
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;

if(FETCH_CONST(life_adminlevel) == 5) then {
	LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
};
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player SVAR ["steam64ID",steamid];
player SVAR ["realname",profileName,true];

life_fnc_moveIn = compileFinal
"
	life_disable_getIn = false;
	player moveInCargo (_this select 0);
	life_disable_getOut = true;
";

[] spawn life_fnc_survival;

[] spawn {
	while {true} do {
		waitUntil{(!isNull (findDisplay 49)) && (!isNull (findDisplay 602))}; // Check if Inventory and ESC dialogs are open
		(findDisplay 49) closeDisplay 2; // Close ESC dialog
		(findDisplay 602) closeDisplay 2; // Close Inventory dialog
	};
};

CONSTVAR(life_paycheck);
if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),0)) then {player enableFatigue false;};

if(EQUAL(LIFE_SETTINGS(getNumber,"Pump_service"),1)) then{
	[] execVM "core\load\fn_station_service.sqf";
};

[getPlayerUID player,player getVariable["realname",name player]] remoteExec ["life_fnc_wantedProfUpdate",RSERV];

DYNAMICMARKET_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;

[1] call SOCK_fnc_updatePartial;

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;
