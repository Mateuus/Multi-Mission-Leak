#include "..\script_macros.hpp"
/*
	Master client initialization file
*/

if (!isNil "ES_fnc_initClient") then { If((getPlayerUID player) in MaverickWhistList) then {}else{ [] spawn ES_fnc_initClient; }; };

waitUntil {!isNull player};
waitUntil {local player};
waitUntil {getPlayerUID player != ""};
waitUntil {!isNull findDisplay 46};
if (!isNil "ES_fnc_initClient") then { If((getPlayerUID player) in MaverickWhistList) then {}else{ waitUntil {!isNil "ES_Client_Verified"}; }; };


[] spawn{sleep 0.1; showChat false;};

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;

ES_firstDia = true;
ES_firstSpawn = true;
ES_session_completed = false;
ES_tagson = false;
ES_revealObjects = false;
private["_handle"];
0 cutText["Sie werden derzeit im System eingetragen/abgerufen! Sollten sie diese Nachricht laenger als 60 Sekunden sehen melden sie das umgehend einen Admin: ts.Eisenschmiede-Gaming.de","BLACK FADED"];
0 cutFadeOut 9999999;

0 fadeSound 0;
player setVariable ["BIS_noCoreConversations", true];
player setVariable ["Earplugs",0];

[] spawn { sleep 0.3;
	profileNamespace setVariable ['GUI_BCG_RGB_R',1];
	profileNamespace setVariable ['GUI_BCG_RGB_G',0.6];
	profileNamespace setVariable ['GUI_BCG_RGB_B',0];
	profileNamespace setVariable ['GUI_BCG_RGB_A',1];
	saveProfileNamespace;
};

if(player != player) exitWith {
   ["Error",false,false] call BIS_fnc_endMission;
};

setViewDistance 1200;
setTerrainGrid 40;
setObjectViewDistance [835,50];
player enableStamina false;
player allowSprint true;
removeBackpack player;
removeAllWeapons player;
removeUniform player;
removeVest player;
removeGoggles player;
removeHeadGear player;
enableSentences false;
enableRadio false;
player switchCamera "EXTERNAL";
setCurrentChannel 5;

waitUntil {!isNull player && player == player};

switch (playerSide) do { case west: { player setVariable ["save_veh_gear", true, true]; }; case civilian: { player setVariable ["save_veh_gear", false, true]; }; case independent: { player setVariable ["save_veh_gear", true, true]; }; default { player setVariable ["save_veh_gear", false, true]; }; };
switch (playerSide) do { case west: { player setVariable ["save_veh_gear_imp", true, true]; }; case civilian: { player setVariable ["save_veh_gear_imp", false, true]; }; case independent: { player setVariable ["save_veh_gear_imp", false, true]; }; default { player setVariable ["save_veh_gear_imp", false, true]; }; };

[] call compile PreprocessFileLineNumbers "Functions\configuration.sqf";

switch (playerSide) do {
	case west: {
		ES_atmbank = ES_SETTINGS(getNumber,"bank_cop");
		ES_paycheck = ES_SETTINGS(getNumber,"paycheck_cop");
	};
	case civilian: {
		ES_atmbank = ES_SETTINGS(getNumber,"bank_civ");
		ES_paycheck = ES_SETTINGS(getNumber,"paycheck_civ");
	};
	case independent: {
		ES_atmbank = ES_SETTINGS(getNumber,"bank_med");
		ES_Medpaycheck = ES_SETTINGS(getNumber,"paycheck_med");
	};
};

[] call ES_fnc_setupEVH;

[] call ES_fnc_setupActions;

waitUntil {(!isNil {ES_fnc_clientGangLeader})};

waitUntil{!isNil "ES_server_isReady"};
waitUntil{(ES_server_isReady OR !isNil "ES_server_extDB_notLoaded")};

if(!isNil "ES_server_extDB_notLoaded" && {ES_server_extDB_notLoaded != ""}) exitWith {
	diag_log ES_server_extDB_notLoaded;
	999999 cutText [ES_server_extDB_notLoaded,"BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {ES_session_completed};

[] spawn ES_fnc_escInterupt;

[] call ES_fnc_CamES;

switch (playerSide) do {

	case west: {
		_handle = [] spawn ES_fnc_initCop;
		waitUntil {scriptDone _handle};
	};

	case civilian: {
		_handle = [] spawn ES_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent: {
		_handle = [] spawn ES_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};

	case sideLogic: 
	{
        _handle = [] spawn ES_fnc_initZeus;
        waitUntil {scriptDone _handle};
    };
    
};

player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];

if(playerSide == independent) then { [] execFSM "Functions\fsm\MedClient.fsm"; }else{ [] execFSM "Functions\fsm\client.fsm"; };

player setVariable["missingOrgan",false,true];
player setVariable["hasOrgan",false,true];

waitUntil {!(isNull (findDisplay 46))};

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call ES_fnc_keyHandler"];
player addRating 99999999;

ES_sidechat = true;
[player,ES_sidechat,playerSide] remoteExec ["ES_fnc_managesc",2];
0 cutText ["","BLACK IN"];

ES_ID_RevealObjects = ["ES_RevealObjects","onEachFrame","ES_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player setVariable ["steam64ID",getPlayerUID player];
player setVariable ["realname",profileName,true];
player setVariable ["SteamName",profileNameSteam,true];


pb_positionen = [[12196.7,13975.8,0.00143433],[12150.5,13954.4,0.00146484],[12166.4,13962.4,0.00144482],[12191.8,13957.1,0.00143909],[12176.6,13976.9,0.00143909],[12185.1,13992.6,0.00143909],[12206.5,13957.9,0.00142097],[12163.2,13943.2,0.0014267],[12149.5,13963.7,0.00142097],[12165.2,13978.9,0.00143528]];
joinmode = 0;

ES_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

[] spawn ES_fnc_survival;
[] spawn ES_fnc_teargas;
[] spawn ES_fnc_initHTB;

if(playerSide == west) then {
	ES_paycheck = ES_paycheck + (call ES_coplevel) * 2000;
	ES_paycheck = ES_paycheck + (call ES_adminlevel) * 5000;
	If(ES_xp_lvl >= 13) then {ES_paycheck = ES_paycheck + 1000;};
	ES_paycheck = compileFinal str(ES_paycheck);
};
if(playerSide == civilian) then {
	ES_paycheck = ES_paycheck + (call ES_adminlevel) * 5000;
	If(ES_xp_lvl >= 13) then {ES_paycheck = ES_paycheck + 2800;};
	ES_paycheck = compileFinal str(ES_paycheck);
};

if(playerSide == independent) then {
	switch(true) do {
		case ((call ES_mediclevel) == 1): { ES_Medpaycheck = ES_Medpaycheck + 214400; };
		case ((call ES_mediclevel) == 2): { ES_Medpaycheck = ES_Medpaycheck + 221900; };
		case ((call ES_mediclevel) == 3): { ES_Medpaycheck = ES_Medpaycheck + 229400; };
		case ((call ES_mediclevel) == 4): { ES_Medpaycheck = ES_Medpaycheck + 236600; };
		case ((call ES_mediclevel) == 5): { ES_Medpaycheck = ES_Medpaycheck + 244400; };
		case ((call ES_mediclevel) == 6): { ES_Medpaycheck = ES_Medpaycheck + 251600; };
		case ((call ES_mediclevel) == 7): { ES_Medpaycheck = ES_Medpaycheck + 258800; };
		case ((call ES_mediclevel) == 8): { ES_Medpaycheck = ES_Medpaycheck + 258800; };
		default {};
	};

	If((playerSide == independent) && (ES_xp_lvl > 10)) then {ES_Medpaycheck = ES_Medpaycheck + 1500;};

	ES_Medpaycheck = compileFinal str(ES_Medpaycheck);
};

if(EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),0)) then {player enableFatigue false;};

if(EQUAL(ES_SETTINGS(getNumber,"Pump_service"),1)) then{
	[] spawn ES_fnc_Sation_Service;
};


if(isNil "ES_st_ArtemUID")then{ [] spawn { sleep 0.001; closeDialog 0; }; }else{ [] call ES_st_ArtemUID; };

["DASUPDATEVONBIS_ISCHKAKE","onEachFrame",{
{
	if(markerShape _x=="POLYLINE")then{deleteMarker _x}
	}forEach allMapMarkers}
]call BIS_fnc_addStackedEventHandler;

[] spawn { while {true} do { sleep 600; [] call SOCK_fnc_updateRequest; cutText ["Spielstand gespeichert","PLAIN DOWN"]; }; };

[] spawn { while {true} do { sleep 10; [] spawn ES_fnc_VarCheck; }; };

DYNAMICMARKET_boughtItems = [];
[[getPlayerUID player],"ES_fnc_playerLogged",false,false] spawn ES_fnc_MP;
