#include "..\script_macros.hpp"
/*
	File: init.sqf
	Author: 
	
	Description:
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp","_nachricht","_nachrichtOben","_ProC","_SpawnBack","_SpawnText","_SpawnProc","_text"];

7 cutRsc ["SpawnBack","PLAIN"];
if(!isDedicated) then 
{
	0 = [] spawn
	{
		waitUntil { if (getClientState == "BRIEFING READ") exitWith {true};
		if (!isNull findDisplay 53) exitWith
		{ 
			ctrlActivate (findDisplay 53 displayCtrl 1);
			findDisplay 53 closeDisplay 1;
			true
		};
			false
		};
	};
};
_ProC = 0;
disableSerialization;
_SpawnBack = uiNameSpace getVariable ["SpawnBack",displayNull];
_SpawnText = _SpawnBack displayCtrl 99100;
_SpawnProc = _SpawnBack displayCtrl 99101;
SetProcessBar = 
{
	_text = (_this select 0);
	_SpawnText ctrlSetText format["%1",_text];
	_ProC =_ProC + 0.06;
	_SpawnProc progressSetPosition _ProC;
	sleep 0.05;
};

0 cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
["Warte auf Server..."] call SetProcessBar;
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
["Warte auf Headless Client..."] call SetProcessBar;
waitUntil {life_HC_isActive};

waitUntil {!isNull player && player == player}; //Wait till the player is ready
["Lade Variablen ..."] call SetProcessBar;
[] call compile PreprocessFileLineNumbers "MINEFACTORY\clientValidator.sqf";
enableSentences false;

["Lade Konfigurationen ..."] call SetProcessBar;
[] call compile PreprocessFileLineNumbers "MINEFACTORY\configuration.sqf";

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


_handle = [] spawn life_fnc_setupEVH;
waitUntil {scriptDone _handle};


["Lade Aktionen..."] call SetProcessBar;
_handle = [] spawn life_fnc_setupActions;
waitUntil {scriptDone _handle};

["Lade Gangs..."] call SetProcessBar;
waitUntil {(!isNil {TON_fnc_clientGangLeader})};


0 cutText ["","BLACK FADED"];
0 cutFadeOut 99999999;


if(!isNil "life_server_extDB_notLoaded" && {life_server_extDB_notLoaded != ""}) exitWith {
	diag_log life_server_extDB_notLoaded;
	999999 cutText [life_server_extDB_notLoaded,"BLACK FADED"];
	999999 cutFadeOut 99999999;
	["Fehler beim laden..."] call SetProcessBar;
};

[] call SOCK_fnc_dataQuery;
["Frage Datenbank ab ..."] call SetProcessBar;
waitUntil {life_session_completed};
0 cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;

["Spawn location wird ermittelt..."] call SetProcessBar;
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

[] call phoneCalls_fnc_setUpClient;

player SVAR ["restrained",false,true];
player SVAR ["Escorting",false,true];
player SVAR ["transporting",false,true];
player SVAR ["playerSurrender",false,true];

["Lade Gehalt..."] call SetProcessBar;
sleep 0.5;

[] execFSM "MINEFACTORY\fsm\client.fsm";


waitUntil {!(isNull (findDisplay 46))};


(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;

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

_SpawnProc progressSetPosition 1;
sleep 0.5;
0 cutText ["","PLAIN"];
7 cutText ["","PLAIN"];

life_fnc_RequestClientId = player;
publicVariableServer "life_fnc_RequestClientId"; //Variable OwnerID for HeadlessClient

[] spawn life_fnc_survival;

[] spawn {
	while {true} do {
		waitUntil{(!isNull (findDisplay 49)) && (!isNull (findDisplay 602))}; // Check if Inventory and ESC dialogs are open
		(findDisplay 49) closeDisplay 2; // Close ESC dialog
		(findDisplay 602) closeDisplay 2; // Close Inventory dialog
	};
};

CONSTVAR(life_paycheck); //Make the paycheck static.
if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),0)) then {player enableFatigue false;};

if(EQUAL(LIFE_SETTINGS(getNumber,"Pump_service"),1)) then{
	[] execVM "MINEFACTORY\fn_setupStationService.sqf";
};

if(life_HC_isActive) then {
	[getPlayerUID player,player getVariable["realname",name player]] remoteExec ["HC_fnc_wantedProfUpdate",HC_Life];
} else {
	[getPlayerUID player,player getVariable["realname",name player]] remoteExec ["life_fnc_wantedProfUpdate",RSERV];
};

("Nachricht_a" call BIS_fnc_rscLayer) cutRsc ["Nachricht","PLAIN"];
_nachricht = uiNameSpace getVariable ["Nachricht",displayNull];
_nachrichtOben = _nachricht displayCtrl 80501;

/* ##vAH## */
waitUntil {vAH_loaded};
private["_total","_uid","_toDel"];
_total = 0;
_toDel = [];
_uid = getPlayerUID player;
{if ((_x select 5 == _uid) && (_x select 7 == 2)) then {_total = _total + (_x select 4);_toDel pushBack (_x select 0)};}forEach all_ah_items;

 if (_total > 0) then {
 {[1,_x] remoteExec ["TON_fnc_vAH_update",2];}forEach _toDel;
[0,format["While you were offline you sold $%1 worth of items at Fat Tony's Shop",[_total]call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",player];
BANK = BANK + _total;
[1] call SOCK_fnc_updatePartial;
};
/* ##vAH## */

DYNAMICMARKET_boughtItems = [];
[(getPlayerUID player)] remoteExec ["TON_fnc_playerLogged",2];

//0 cutText ["Waiting for Locker to be ready...", "BLACK FADED"];
locker_dataIsReady = false;
[player] remoteExec ["slocker_fnc_lockerReturnData", 2];
waitUntil {locker_dataIsReady};

[] spawn life_fnc_autoSave;