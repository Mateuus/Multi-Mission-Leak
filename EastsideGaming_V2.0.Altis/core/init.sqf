#include "..\script_macros.hpp"
/*
    File: init.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Master client initialization file
*/

private ["_handle","_timeStamp","_extDB_notLoaded"];
life_firstSpawn = true;
life_session_completed = false;
//0 cutText[localize "STR_Init_ClientSetup","BLACK FADED"];
//0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
_extDB_notLoaded = "";
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------ Version 5.0.0 -------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player isEqualTo player}; //Wait till the player is ready
[] call compile preprocessFileLineNumbers "core\clientValidator.sqf";
enableSentences false;

//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile preprocessFileLineNumbers "core\configuration.sqf";

diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;

diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;

diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil "TON_fnc_clientGangLeader")};

diag_log "::Life Client:: Received server functions.";
0 cutText [localize "STR_Init_ServerReady","BLACK FADED"];
0 cutFadeOut 99999999;

diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil {!isNil "life_server_isReady"};
waitUntil {!isNil "life_HC_isActive" && {!isNil "life_server_extDB_notLoaded"}};

if (life_server_extDB_notLoaded) exitWith {
    999999 cutText [localize "STR_Init_ExtdbFail","BLACK FADED"];
    999999 cutFadeOut 99999999;
};

waitUntil {life_server_isReady};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;

//Set bank amount for new players
switch (playerSide) do {
    case west: {
        switch ((FETCH_CONST(life_copLevel))) do {
			case 1: {life_paycheck = 2000; player setVariable ["rankaus","Meisteranwärter",true];};
			case 2: {life_paycheck = 3000; player setVariable ["rankaus","Polizeimeister",true];};
			case 3: {life_paycheck = 4000; player setVariable ["rankaus","Polizeiobermeister",true];};
			case 4: {life_paycheck = 5000; player setVariable ["rankaus","Polizeihauptmeister",true];};
			case 5: {life_paycheck = 6000; player setVariable ["rankaus","Polizeikommissar",true];};
			case 6: {life_paycheck = 7000; player setVariable ["rankaus","Polizeioberkommissar",true];};
			case 7: {life_paycheck = 8000; player setVariable ["rankaus","Polizeihauptkommissar",true];};
			case 8: {life_paycheck = 15000; player setVariable ["rankaus","Polizeidirektor",true];};
			case 9: {life_paycheck = 15000; player setVariable ["rankaus","L. Polizeidirektor",true];};
			default {life_paycheck = 3000; player setVariable ["rankaus","Meisteranwärter",true];};
		};
    };
    case civilian: {
        life_paycheck = 1500;
    };
    case independent: {
        switch ((FETCH_CONST(life_medicLevel))) do {
			case 1: {life_paycheck = 2000; player setVariable ["rankaus","Feuerwehrmannanwärter",true];};
			case 2: {life_paycheck = 3000; player setVariable ["rankaus","Feuerwehrmann",true];};
			case 3: {life_paycheck = 4000; player setVariable ["rankaus","Hauptfeuerwehrmann",true];};
			case 4: {life_paycheck = 5000; player setVariable ["rankaus","Löschmeister",true];};
			case 5: {life_paycheck = 6000; player setVariable ["rankaus","Brandmeister",true];};
			case 6: {life_paycheck = 7000; player setVariable ["rankaus","Stv. Regierungsbrandmeister",true];};
			case 7: {life_paycheck = 10000; player setVariable ["rankaus","Regierungsbrandmeister",true];};
			default {life_paycheck = 3000;  player setVariable ["rankaus","Feuerwehrmannanwärter",true];};
		};
    };
};

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

player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
player setVariable ["playerSurrender",false,true];
player setVariable ["esg_bewusstlos",false,true];
player setVariable ["esg_damagestore",0,true];
player setVariable ["esg_bewusstlos_delay",0,true];
player setVariable ["istazed",false,true];
player setVariable ["esg_bewusstlos_stab",0,true];
player setVariable ["esg_stabinpro",false,true];
player setVariable ["esg_laststab",0,true];

diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";

diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};

diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;

[player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC",RSERV];
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;

/* Set up frame-by-frame handlers */
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player setVariable ["steam64ID",getPlayerUID player];
player setVariable ["realname",profileName,true];

life_fnc_moveIn = compileFinal
"
    life_disable_getIn = false;
    player moveInCargo (_this select 0);
    life_disable_getOut = true;
";

life_fnc_RequestClientId = player;
publicVariableServer "life_fnc_RequestClientId"; //Variable OwnerID for HeadlessClient

[] spawn life_fnc_survival;
[] spawn life_fnc_initmapfilter;
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil {(!isNull (findDisplay 49)) && {(!isNull (findDisplay 602))}}; // Check if Inventory and ESC dialogs are open
        (findDisplay 49) closeDisplay 2; // Close ESC dialog
        (findDisplay 602) closeDisplay 2; // Close Inventory dialog
    };
};

CONSTVAR(life_paycheck); //Make the paycheck static.
player enableFatigue false;
enableEnvironment false;
setCurrentChannel 5;

[getPlayerUID player,player getVariable ["realname",name player]] remoteExec ["life_fnc_wantedProfUpdate",RSERV];

life_hideoutBuildings = [];
{
    private _building = nearestBuilding getMarkerPos _x;
    life_hideoutBuildings pushBack _building;
    false
} count ["gang_area_1","gang_area_2","gang_area_3"];
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";