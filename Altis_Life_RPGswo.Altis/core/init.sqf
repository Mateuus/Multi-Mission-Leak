#include "..\macros.hpp"
/*
	Master client initialization file
*/
DWEV_firstSpawn = true;
DWEV_session_completed = false;
DWEV_doSit = false;
DWEV_robbed_vehicles = [];
DWEV_traingas_effect = false;
DWEV_allow_fire = true;
DWEV_weapon_malfunktion = false;
DWEV_weapon_overheat = false;
pIayer = player;
WEAPONFREE_ALLOWED_WEAPON = ["","hgun_Pistol_heavy_01_snds_F","hgun_Pistol_Signal_F","Binocular","Rangefinder","hgun_P07_khk_F"];
DWEV_var_playerInPvpAreal = false;

// Init Effects
DWEV_var_DeliriumEffect = ppEffectCreate ["wetDistortion", 301];
DWEV_var_DeliriumEffect ppEffectAdjust [2, 0.1, 0.1, 0.2, 0.2, 2, 2, 0.01, 0.01, 0.01, 0.01, 0.01, 0.1, 2, 2];
DWEV_var_DeliriumEffect ppEffectCommit 0;
DWEV_var_DeliriumEffect ppEffectEnable false;

DWEV_var_radialBlurEffect = ppEffectCreate ["radialBlur", 302];
DWEV_var_radialBlurEffect ppEffectAdjust [0, 0, 0, 0];
DWEV_var_radialBlurEffect ppEffectCommit 0;
DWEV_var_radialBlurEffect ppEffectEnable false;

DWEV_var_chromAberrationEffect = ppEffectCreate ["chromAberration", 303];
DWEV_var_chromAberrationEffect ppEffectAdjust [0, 0, true];
DWEV_var_chromAberrationEffect ppEffectCommit 0;
DWEV_var_chromAberrationEffect ppEffectEnable false;
// End Init Effects


private["_handle","_timeStamp"];
0 cutText["Wir müssen einige Sachen laden...  Bitte Warten !!!!","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;

diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
if ((side player) == civilian) then {[player] joinSilent (createGroup civilian);};
//Setup initial client core functions
diag_log "::Life Client:: Initialization Map Objects";
DWEV_init_objects_skript = [] spawn DWEV_fnc_initObjects;
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call DWEV_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call DWEV_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
//diag_log "::Life Client:: Waiting for server functions to transfer..";
//waitUntil {(!isNil {DWF_fnc_clientGangLeader})};
//diag_log "::Life Client:: Received server functions.";
0 cutText ["Server noch nicht bereit, bitte warten...","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Server noch nicht bereit, bitte warten...";
waitUntil{!isNil "DWEV_server_isReady"};
waitUntil{(DWEV_server_isReady OR !isNil "DWEV_server_extDB_notLoaded")};
if(!isNil "DWEV_server_extDB_notLoaded") exitWith 
{
	diag_log "::Life Client:: Server did not load extDB";
	999999 cutText ["ExtDB wurde nicht geladen, melde es bitte einem Admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};

// Server Period ID auslesen und vergleichen
waitUntil {sleep 0.1; (!isNil "DWEV_serverperiodID")};

//[0,player,format ["Client hat DWEV_serverperiodID %1 beim start empfangen gespeichert war die ID %2",DWEV_serverperiodID,(profileNamespace getVariable ["DWEV_serverperiodID",0])]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

if ((DWEV_serverperiodID == (profileNamespace getVariable ["DWEV_serverperiodID",0])) && DWEV_serverperiodID != 0 )then
{	// last period == current period
	
	
	DWEV_nlrZones = (profileNamespace getVariable ["DWEV_nlrZones",[]]);
	if (count DWEV_nlrZones > 0) then
	{
		[true] spawn DWEV_fnc_nlrMarker;
		//[0,player,format ["Restore nlrMarker %1 ",DWEV_nlrZones]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
	
	DWEV_playerDeathPos = profileNamespace getVariable ["DWEV_playerDeathPos",[0,0,0]];
	DWEV_playerDeathTime = profileNamespace getVariable ["DWEV_playerDeathTime",0];
	DWEV_playerRespawned = profileNamespace getVariable ["DWEV_playerRespawned",true];

	if (!DWEV_playerRespawned) then
	{
		if ((DWEV_playerDeathTime + 15) > serverTime) then
		{
			//[0,player,format ["Restore Player Death DWEV_playerDeathPos:%1 DWEV_playerDeathTime:%2",DWEV_playerDeathPos, DWEV_playerDeathTime]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
			[false,DWEV_playerDeathPos,DWEV_playerDeathTime] spawn DWEV_fnc_nlrMarker;
		};
	};
}
else // last period != current period
{
	profileNamespace setVariable ["DWEV_nlrZones",nil];
	profileNamespace setVariable ["DWEV_playerDeathPos",nil];
	profileNamespace setVariable ["DWEV_playerDeathTime",nil];
	profileNamespace setVariable ["DWEV_playerRespawned",nil];
	profileNamespace setVariable ["DWEV_serverperiodID",DWEV_serverperiodID];
	saveProfileNamespace;
};


if (DWEV_HC_isActive) then // Dort später die HC Datenbankabfrage einbinden
{
	0 cutText ["Versuche den HeadlessClient zu erreichen, bitte warten...","BLACK FADED"];
	0 cutFadeOut 99999999;
	waitUntil {sleep 0.1; !(isNil "DWEV_fnc_pingHC")};
	[] call DWEV_fnc_pingHC;
	_waitCount = 30;
	waitUntil {sleep 1;_waitCount = (_waitCount - 1); (DWEV_HC_VALID || (_waitCount <= 0))};

	if (_waitCount <= 0) then 
	{
		diag_log "Der Headlessclient hat nicht rechtzeitig auf den Ping geantwortet";
		systemChat "Der Headlessclient hat nicht rechtzeitig auf den Ping geantwortet";
	}
	else
	{
		diag_log "Der Headlessclient hat die Verbindung angenommen";
		systemChat "Der Headlessclient hat die Verbindung angenommen";
	};
};

if (isNil "DWEV_HC_PERIODIC_PING_RUNNING") then
{
	[] spawn
	{
		// Versucht den HeadlessClient zu erreichen wenn dieser beim Missionsstart nicht da war
		scriptName "Periodic HC Ping";
		while {true} do
		{
			sleep 300;
			DWEV_HC_PERIODIC_PING_RUNNING = true;
			[] call DWEV_fnc_pingHC;
		};
	
	};
};
	
[] call SOCK_fnc_dataQuery;
waitUntil {sleep 0.1;DWEV_session_completed};

0 cutText["Wir müssen nur noch ein paar letzte Sachen laden... BITTE WARTE !!! Es geht gleich weiter !!","BLACK FADED"];
0 cutFadeOut 9999999;
sleep 5;
//waitUntil {sleep 0.1;(scriptDone DWEV_init_objects_skript)};

//DWEV_ID_PlayerTags = ["DWEV_PlayerTags","onEachFrame","DWEV_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
//DWEV_ID_RevealObjects = ["DWEV_RevealObjects","onEachFrame","DWEV_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player setVariable["realname",profileName,true];

diag_log "::Client:: Pruefe Personalausweisdaten.";
0 cutText ["Ueberpruefe Daten des Personalausweises...","BLACK FADED"];
[] call DWEV_fnc_perso_laden;
0 cutFadeOut 99999999;
waitUntil{DWEV_persoReady || DWEV_stranger};

if !(profileNamespace getVariable["skipIntro_new",false]) then
{
	if !(isNil "DWEV_fnc_wolf_intro") then 
	{
		_lifeintro = [] spawn DWEV_fnc_wolf_intro;
		waitUntil { scriptDone _lifeintro };
	};
};

//diag_log "::Life Client:: Group Base Execution";
[] spawn DWEV_fnc_escInterupt;

switch ((side player)) do
{
	case west:
	{
		_handle = [] spawn DWEV_fnc_initCop;
		waitUntil {scriptDone _handle};
		player setVariable["playertype","COP",true];
		};
	
	case civilian:
	{
		_handle = [] spawn DWEV_fnc_initCiv;
		waitUntil {scriptDone _handle};
		player setVariable["playertype","ZIV",true];
	};
	
	case independent:
	{
		_handle = [] spawn DWEV_fnc_initMedic;
		waitUntil {scriptDone _handle};
		player setVariable["playertype","MED",true];
	};
	
	case east:
	{
		_handle = [] spawn DWEV_fnc_initOpfor;
		waitUntil {scriptDone _handle};
		player setVariable["playertype","WSC",true];
	};
};

// Sichtweiteneinstellung wiederherstellen
tawvd_foot = profileNamespace getVariable["tawvd_foot",900];
tawvd_car = profileNamespace getVariable["tawvd_car",1200];
tawvd_air = profileNamespace getVariable["tawvd_air",1600];
[] spawn DWEV_fnc_updateViewDistance;

// Admin VON Channel einrichten
if (__GETC__(DWEV_adminlevel) > 0) then //Ab E
{
	[player,true] remoteExec ["DWF_fnc_adminVonChannel",2];
};

// Sidechat Einstellung wiederherstellen
if (profileNamespace getVariable["DWEV_sidechat",true]) then
{
	DWEV_sidechat = true;
	[player,DWEV_sidechat,(side player)] remoteExec ["DWF_fnc_managesc",2];
}
else
{
	DWEV_sidechat = false;
	[player,DWEV_sidechat,(side player)] remoteExec ["DWF_fnc_managesc",2];
};

// Reveal Objects einstellung wiederherstellen
DWEV_ID_RevealObjects = ["DWEV_RevealObjects","onEachFrame","DWEV_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
if (profileNamespace getVariable["DWEV_revealObjects",false]) then
{
	DWEV_ID_RevealObjects = ["DWEV_RevealObjects","onEachFrame","DWEV_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
	DWEV_revealObjects = true;
}
else
{
	[DWEV_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler; 
	DWEV_revealObjects = false;
};


player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
diag_log "Past Settings Init";
[] execFSM "core\fsm\clientdw.fsm";
diag_log "Executing clientdw.fsm";
waitUntil {sleep 0.1; !(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call DWEV_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";


[] execVM "dialog\playerHud.sqf";
player setVariable["steam64ID",getPlayerUID player];
player setVariable["missingOrgan",false,true];//sets variables to false on start
player setVariable["hasOrgan",false,true];

if (395180 in (getDLCs 1)) then {DWEV_OwnedApexDLC = true;};

[] execVM "core\init_survival.sqf";
["normal"] call DWEV_fnc_colorCorrections;
[] spawn DWEV_fnc_traingas;
[] spawn DWEV_fnc_increaseFuel;
[] spawn DWEV_fnc_handleSound;
[] spawn DW_fnc_vehicleManagerInit;
//[] spawn DW_fnc_water_edge; // Wird ab 1.60 nicht mehr gebraucht (Neue Wassershader)
[] spawn CLAY_fnc_initCarRadio;

// Playertags Einstellung wiederherstellen
DWEV_ID_PlayerTags = ["DWEV_PlayerTags","onEachFrame","DWEV_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
if (profileNamespace getVariable["DWEV_tagson",true]) then
{
	DWEV_ID_PlayerTags = ["DWEV_PlayerTags","onEachFrame","DWEV_fnc_playerTags"] call BIS_fnc_addStackedEventHandler; 
	DWEV_tagson = true;
}
else
{
	
	[DWEV_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler; 
	DWEV_tagson = false;
};

__CONST__(DWEV_paycheck,DWEV_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(DWEV_enableFatigue));
setTerrainGrid 48; // Reduce Grass for higher FPS

0 cutText ["","BLACK IN"];

3 enableChannel true; // Enable user ability to send voice and text on Group channel
4 enableChannel true; // Enable user ability to send voice and text on Vehicle channel
5 enableChannel true; // Ensable user ability to send voice and text on Direct channel


/* vAH */
if((side player) == civilian) then {
	waitUntil {vAH_loaded};
	private["_total","_uid","_toDel"];
	_total = 0;
	_toDel = [];
	_uid = getPlayerUID player;
	{
		if (((_x select 5) == _uid) && ((_x select 7) == 2)) then {
			_total = _total + (_x select 4);
			_toDel pushBack (_x select 0)
		};
	}forEach all_ah_items;

	if (_total > 0) then {
		{
			[6,_x] remoteExec ["DWF_fnc_vAH_update",2];
		} forEach _toDel;
		[0,format["Während du offline warst, hast du Gegenstände im Wert von %1 € verkauft!",[_total]call DWEV_fnc_numberText]] remoteExec ["DWEV_fnc_broadcast",player];
		dwf_atmcash = dwf_atmcash + _total;
		[1] call SOCK_fnc_updatePartial;
	};
}; 

/*
[] spawn
{
	if (isNil "DWEV_var_spawnInProcess") then {DWEV_var_spawnInProcess = false;};
	DWEV_var_lastpos = (getPosASL player);
	while {true} do
	{
		DWEV_var_lastpos = (getPosASL player);
		
		if !((DWEV_combatlog) && !DWEV_var_spawnInProcess) then
		{
			uisleep 0.5;
			if ((DWEV_var_lastpos distance2D (getPosASL player)) >= 300) then
			{			
				[10,player,format ["Hat sich von %1 nach %2 teleportiert",DWEV_var_lastpos,(getPosASL player)]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
			};
		}
		else
		{
			uisleep 5;
		};
	};
};
*/