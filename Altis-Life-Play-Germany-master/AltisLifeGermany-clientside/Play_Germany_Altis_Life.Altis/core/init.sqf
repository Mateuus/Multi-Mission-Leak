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
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
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
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;


_cbl = missionNamespace getVariable (getPlayerUID player);
if (!isNil "_cbl" && ((call life_adminlevel) < 1) && !PG_unblock) then {
	if (((_cbl select 1) + 600) > serverTime) then {
		switch (_cbl select 0) do {
			case 1: {if(playerSide == (_cbl select 2)) then {["fasttravel",true,false] spawn BIS_fnc_endMission; sleep 600;};};
			case 2: {if(playerSide == (_cbl select 2)) then {["death",true,false] spawn BIS_fnc_endMission; sleep 600;};};
			case 3: {
						if(playerSide == (_cbl select 2)) then {
							if(surfaceIsWater (_cbl select 3)) then {
								_max_distance = 50;
								while{ count _extraction_point < 1 } do {
									_extraction_point = (_cbl select 3) findEmptyPosition[ 0 , _max_distance ];
									_max_distance = _max_distance + 50;
								};
								player setPosAtl[_extraction_point select 0,_extraction_point select 1,0];
							} else {
								player setPosAtl[(_cbl select 3) select 0,(_cbl select 3) select 1,0];
							};
							PG_kickedOut = true;
							hint "Willkommen zurück ;)";
						};
					};
			default {["Abort",true,false] spawn BIS_fnc_endMission; sleep 600;};
		};
	};
};
PG_unblock = false;

//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;

/*************************************
 *       CUSTOM SYSTEM LOADING
 *************************************/

// get rid of the grass due to fps reasons
setTerrainGrid 50; // (Hi)12.5 or (Med)25 or (Low)50

//init teargas system
//[] spawn PG_fnc_teargas;

// gambling
_handle = [] spawn compile PreprocessFileLineNumbers "core\PlayGermany\gambling\configuration.sqf";
diag_log "::PlayGermany Client:: Initialization Variables gambling";
// do not wait for it, this will cause a loooong black screen for the player
//waitUntil {scriptDone _handle};

// DynMarket
DYNAMICMARKET_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;

// higher fuel consumption
//_handle = [] spawn PG_fnc_vehicleFuelConsumer;

// give keys back after re-connect
[] execVM "core\fn_addKey.sqf"; //add keys back to player

// smartphone system
_handle = [] execVM "core\PlayGermany\Smartphone\initRadioCellsClientside.sqf";
//waitUntil {scriptDone _handle};

// igiLoad

if(license_civ_cargo || playerSide == west || playerSide == independent) then
{
   _handle = [] execVM "core\PlayGermany\IgiLoad\IgiLoadInit.sqf";
};


// do not wait for it, it will run forever!
//waitUntil {scriptDone _handle};

/*************************************
 *   END OF CUSTOM SYSTEM LOADING
 *************************************/


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
	case east:
	{
		//Initialize ASF and blah
		_handle = [] spawn life_fnc_initASF;
		waitUntil {scriptDone _handle};
	};
	case sideLogic:
    {
		//Zeus
        _handle = [] spawn life_fnc_initZeus;
        waitUntil {scriptDone _handle};
    };
};

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
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";

//life_sidechat = profileNamespace getVariable["PG_life_sidechat",true];
//[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false,true] call life_fnc_MP;
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

CONSTVAR(life_paycheck); //Make the paycheck static.
if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),0)) then {player enableFatigue false;};
[[getPlayerUID player,player getVariable["realname",name player]],"life_fnc_wantedProfUpdate",false,false] spawn life_fnc_MP;

//Hide stuff
hideObject (nearestTerrainObjects[[9208.6,8116.97,-0.0255203],[],5] select 0);
hideObject (nearestTerrainObjects[[9208.6,8116.97,-0.0255203],[],5] select 1);
//Kavalla LKW Park
hideObject (nearestTerrainObjects[[3692.49,13158.3,-0.0462074],[],20] select 0);
hideObject (nearestTerrainObjects[[3692.49,13158.3,-0.0462074],[],20] select 1);
hideObject (nearestTerrainObjects[[3692.49,13158.3,-0.0462074],[],20] select 2);
hideObject (nearestTerrainObjects[[3692.49,13158.3,-0.0462074],[],20] select 3);

//disable new Stamina system
player enableStamina false;