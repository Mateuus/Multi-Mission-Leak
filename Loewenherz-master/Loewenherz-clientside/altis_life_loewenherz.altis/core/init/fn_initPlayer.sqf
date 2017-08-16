#include <macro.h>
/*
	Master client initialization file
*/
private["_handle","_timeStamp"];
if (isServer) exitWith {};
if(!isMultiplayer) exitWith {["Aborted",false,false] call LHM_fnc_endMission};

_timeStamp = diag_tickTime;

[] spawn {
	[localize"STR_INIT_Welcome",localize"STR_INIT_prepareClient"] call lhm_fnc_statusMsg;
};

[localize"STR_INIT_SettingUpClient",localize"STR_INIT_ReceiveServer"] call lhm_fnc_statusMsg;
0 cutFadeOut 9999999;

waitUntil {!isNull player && player == player}; //Wait till the player is ready

//Setup initial client core functions
diag_log "::lhm Client:: Setting up Eventhandlers";
[] call lhm_fnc_setupEVH;
diag_log "::lhm Client:: Eventhandlers completed";
diag_log "::lhm Client:: Setting up user actions";
waitUntil {!isNil "lhm_fnc_setupActions"};[] spawn lhm_fnc_setupActions;
diag_log "::lhm Client:: User actions completed";
diag_log "::lhm Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::lhm Client:: Received server functions.";
[localize"STR_INIT_LoadingServer",localize"STR_INIT_waitforServer"] call lhm_fnc_statusMsg;
0 cutFadeOut 99999999;
diag_log "::lhm Client:: Waiting for the server to be ready..";
waitUntil{!isNil "lhm_server_isReady"};
waitUntil{(lhm_server_isReady OR !isNil "lhm_server_extDB_notLoaded")};
if(!isNil "lhm_server_extDB_notLoaded") exitWith {
	diag_log "::lhm Client:: Server did not load extDB";
	["SQL Error",localize"STR_INIT_DBError"] call lhm_fnc_statusMsg;
	999999 cutFadeOut 99999999;
};
diag_log "::lhm Client:: requesting Player Session..";
[] call SOCK_fnc_dataQuery;
[localize"STR_INIT_LoadGear",localize"STR_INIT_LoginQueue"] call lhm_fnc_statusMsg;

diag_log "::lhm Client:: waiting for lhm Session to be ready..";
waitUntil {lhm_session_completed};
[localize"STR_INIT_LoadingClient",localize"STR_INIT_Clientfnc"] call lhm_fnc_statusMsg;
0 cutFadeOut 9999999;

if(isNull player || player != player) exitWith {
    diag_log "Internal Error!";
    diag_log format["Player Null: %1",isNull player];
    diag_log format["Player not player: %1",player != player];
    ["Aborted",false,false] call LHM_fnc_endMission;
};

diag_log "::lhm Client:: initializing Playerside Functions";
switch (playerSide) do
{
	case west:
	{	//Initialize Cop Settings
		_handle = [] spawn lhm_fnc_initCop;
		waitUntil {scriptDone _handle};
	};

	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn lhm_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn lhm_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};

	case east:
	{
		//Initialize security fraction
		_handle = [] spawn lhm_fnc_initSec;
		waitUntil {scriptDone _handle};
	};
};
[localize"STR_INIT_Done",localize"STR_INIT_Finish",1] call lhm_fnc_statusMsg;

diag_log format["::lhm Client:: Side specific initialization complete. selected Side = [%1]",playerSide];

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable ["playerSurrender",false,true];
player setVariable["BIS_noCoreConversations", true];
player setVariable["missingOrgan",false,true];
player setVariable["hasOrgan",false,true];
player setVariable["lhm_finger",[true,true,true,true,true,true,true,true,true,true],TRUE]; //Neu cut Finger System


diag_log "executing FSM Files...";
diag_log "Past Settings Init";
[] call lhm_fsm_fnc_client;
diag_log "Executing client.fsm";
[] call lhm_fsm_fnc_player_monitor;
diag_log "Executing player_monitor.fsm";
[] call lhm_fsm_fnc_fuelMonitor;
diag_log "Executing FuelMonit.fsm";
[] call lhm_fsm_fnc_checkUniform;
diag_log "Executing checkUniform.fsm";

waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call lhm_fnc_keyHandler"];
player addRating 99999999;

lhm_sidechat = true;
[[player,lhm_sidechat,playerSide],"TON_fnc_managesc",false,false] call lhm_fnc_mp;
0 cutText ["","BLACK IN"];

lhm_ID_PlayerTags = ["lhm_PlayerTags","onEachFrame","lhm_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
lhm_ID_RevealObjects = ["lhm_RevealObjects","onEachFrame","lhm_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
WaitUntil{!isNil "lhm_ID_PlayerTags" && !isNil "lhm_ID_RevealObjects"};

[] call LHM_fsm_fnc_settingsInit;

player setVariable["steam64ID",(getPlayerUID player),true]; //Set the UID.
player setVariable["realname",profileName,true];

// diag_log "Requesting Player Stats from Server...";
// [[getPlayerUID player,player],"lhm_fnc_statRequest",false,false] call lhm_fnc_mp;


lhm_fnc_moveIn = compileFinal
"
    lhm_disable_getIn = false;
    player moveInCargo (_this select 0);
    lhm_disable_getOut = true;
";

lhm_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	lhm_atmcash = lhm_atmcash + _price;
";

// init speedtrap functions
[] call lhm_fsm_fnc_speedtrap;

_handle = [] spawn lhm_fnc_initFuelstations;
waitUntil {scriptDone _handle};

// Driving Exam
//_handle = ["license_civ_driver",5,"!isOnRoad position _veh || (damage _veh) > 0.1",false,false] spawn vehexam_fnc_setup;
//waitUntil {scriptDone _handle};

__CONST__(lhm_paycheck,lhm_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(lhm_enableFatigue));

// Admin Stuff
if((call lhm_adminlevel) > 0) then {
	_handle = [] execVM "addons\admin_menu\init_lhm_admin.sqf";
	WaitUntil{ScriptDone _handle};
};

//_handle = [] spawn lhm_fnc_ClientPaintBallInit;
//WaitUntil{ScriptDone _handle};

[LHM_Color_Correction] call lhm_fnc_colorFilter;

if(playerside != independent && LHM_disease isEqualTo 2) then {
	 [] call LHM_fsm_fnc_disease;

};

// Customize HUD Settings
showHUD
[
	true, 	// show scripted HUD (same as normal showHUD true/false)
	true, 	// show vehicle + soldier info (hides weapon info from the HUD as well)
	false, 	// show vehicle radar
	true, 	// show vehicle compass
	false, 	// show tank direction indicator (not present in vanilla Arma 3)
	false, 	//  show commanding menu (hides HC related menus)
	false, 	// show group info bar (hides squad leader info bar)
	true 	// show HUD weapon cursors (connected with scripted HUD)
];

// Radio Channel Management
0 enableChannel [false, false]; // Global
1 enableChannel [true, false]; 	// Side
2 enableChannel [false, false]; // Command
3 enableChannel [true, true]; 	// Group
4 enableChannel [true, true]; 	// Vehicle
5 enableChannel [true, true]; 	// Direct
6 enableChannel [true, true]; 	// WEST Side
7 enableChannel [true, false];	// CIV Side
8 enableChannel [true, true];	// INDEP Side
9 enableChannel [true, true];	// EAST Side

// Visual Settings
enableEnvironment true;
setterrainGrid 48;
setViewDistance (profileNamespace getVariable["LHM_settings_viewDistanceFoot",1700]);
setObjectViewDistance [1000,50];
//waitUntil {viewDistance isEqualTo (profileNamespace getVariable["LHM_settings_viewDistanceFoot",1700]) && getObjectViewDistance isEqualTo [1000,50]};

LHM_initDone = true;
waitUntil {uiSleep 1.5; LHM_initDone};

("lh_loadingScreen" call BIS_fnc_rscLayer) cutFadeOut 2;
["","",1] call lhm_fnc_statusMsg;

diag_log "::lhm Client:: Setup HUD...";
[] call lhm_fnc_hudSetup;

diag_log "::lhm Client:: Initialize Player Survival...";
_handle = [] execVM "core\init_survival.sqf";
waitUntil {ScriptDone _handle};
diag_log "::lhm Client:: Survival initialized";

player allowDamage true;
showChat true;
showHud true;

[] spawn {
	uiSleep 3;
	("lh_loadingScreen" call BIS_fnc_rscLayer) cutFadeOut 2;
	// Info Message with Location and ingame Clock
	_msg = format["<t font='PuristaBold' color='#afed3b' align='left'>%1...<br/>%2 Uhr</t>",
	((getPos player) call BIS_fnc_locationDescription),([dayTime, "HH:MM"] call BIS_fnc_timeToString)];
	[
	_msg,
	[safezoneX + safezoneW - 0.7,0.50],
	[safezoneY + safezoneH - 0.2,0.7],
	6,
	0.5
	] spawn BIS_fnc_dynamicText;
	diag_log "::lhm Client:: Loading Screen end";
};

systemChat localize"STR_INIT_Complete";
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Loewenherz Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";