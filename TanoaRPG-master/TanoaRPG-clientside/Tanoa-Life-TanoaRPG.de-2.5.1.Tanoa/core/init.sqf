#include <macro.h>
/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Tanoa Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";
//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call tanoarpg_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call tanoarpg_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TEX_fnc_clientGangLeader})};
diag_log "::Life Client:: Received server functions.";
diag_log "::Life Client:: Waiting for MVH to be ready..";
waitUntil{!isNil "mvh"};
waitUntil{!isNull mvh};
diag_log "::Life Client:: MVH is ready now";
diag_log "::Life Client:: Catching Houses, Waiting for local House Init..";
[] call tanoarpg_fnc_initHousesLocal;
diag_log "::Life Client:: Local House Init complete";
0 cutText ["Waiting for the server to be ready...","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB2_notLoaded")};
if(!isNil "life_server_extDB2_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB2";
	999999 cutText ["The server-side extension extDB2 was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call XAS_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

//diag_log "::Life Client:: Group Base Execution";
[] spawn tanoarpg_fnc_escInterupt;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn tanoarpg_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	
	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn tanoarpg_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	
	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn tanoarpg_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
	case east:
    {
        //Initialize ADAC
        _handle = [] spawn tanoarpg_fnc_initAdac;
        waitUntil {scriptDone _handle};
    };
};

// Init automatically saving gear
[] spawn tanoarpg_fnc_autoSave;

//New Houses Init Local
[] spawn {
	diag_log "::Life Client:: Waiting for Houses to be catched..";
	waitUntil{!isNil "mvh"};
	waitUntil{!isNull mvh};
	
	diag_log "::Life Client:: Catching Houses, Waiting for local House Init..";
	[] call tanoarpg_fnc_initHousesLocal;
	diag_log "::Life Client:: Local House Init complete";
};

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["missingOrgan",false,true];//sets variables to false on start
player setVariable["hasOrgan",false,true];
diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call tanoarpg_fnc_keyHandler"];
waitUntil {!(isNull (findDisplay 12))};
diag_log "Display 12 Found";
(findDisplay 12) displayAddEventHandler ["MouseButtonDown", "_this call tanoarpg_fnc_mapMouseHandler"];
player addRating 99999999;


diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of TanoaRPG Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[player,life_sidechat,playerSide] remoteExec ["TEX_fnc_managesc", 2, false];
0 cutText ["","BLACK IN"];
[] call tanoarpg_fnc_hudSetup;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","tanoarpg_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","tanoarpg_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call tanoarpg_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
tanoarpg_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

tanoarpg_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	life_atmcash = life_atmcash + _price;
";

[] execVM "core\init_survival.sqf";

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(life_enableFatigue));