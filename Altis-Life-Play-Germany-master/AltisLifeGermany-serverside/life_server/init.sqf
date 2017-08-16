#include "script_macros.hpp"

/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Initialize the server and required systems.
*/
"PG_jailHackInProgress" addPublicVariableEventHandler {
	[]spawn {
		if(PG_jailHackInProgress) then {
			sleep (8*60);
			PG_jailHackInProgress = false;
			publicVariable "PG_jailHackInProgress";
		};
	};
};
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
life_server_extDB_notLoaded = "";
serv_sv_use = [];
PVAR_ALL("life_server_isReady");

/*
	Prepare extDB before starting the initialization process
	for the server.
*/
if(isNil {GVAR_UINS "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	CONSTVAR(life_sql_id);
	SVAR_UINS ["life_sql_id",life_sql_id];

	//Retrieve extDB version
	_result = EXTDB "9:VERSION";
	["diag_log",[format["extDB2: Version: %1",_result]]] call TON_fnc_logIt;
	if(EQUAL(_result,"")) exitWith {EXTDB_FAILED("The server-side extension extDB2 was not loaded into the engine, report this to the server admin.")};
	if ((parseNumber _result) < 35) exitWith {EXTDB_FAILED("extDB2 version is not compatible with current Altis life version. Require version 35 or higher.")};
	//Lets start logging in extDB
	EXTDB "9:ADD_PROTOCOL:LOG:SPY_LOG:spyglass";
	//Initialize connection to Database
	_result = EXTDB format["9:ADD_DATABASE:%1",DATABASE_SELECTION];
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB2: Error with Database Connection")};
	_result = EXTDB format["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM_V2:%2:altis-life-rpg-4",DATABASE_SELECTION,FETCH_CONST(life_sql_id)];
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB2: Error with Database Connection")};
	//Initialize Logging options from extDB
	if((EQUAL(EXTDB_SETTINGS("LOG"),1))) then {
		{
			EXTDB format["9:ADD_PROTOCOL:LOG:%1:%2",SEL(_x,0),SEL(_x,1)];
			["diag_log",[format["extDB2: %1 is successfully added",SEL(_x,0)]]] call TON_fnc_logIt;
		} forEach EXTDB_LOGAR;
	};
	//Initialize RCON options from extDB
	if((EQUAL(EXTDB_SETTINGS("RCON"),1))) then {
		RCON_ID = round(random(9999));
		CONSTVAR(RCON_ID);
		SVAR_UINS ["RCON_ID",RCON_ID];

		EXTDB format["9:START_RCON:%1",RCON_SELECTION];
		EXTDB format["9:ADD_PROTOCOL:RCON:%1",FETCH_CONST(RCON_ID)];
		["diag_log",["extDB2: RCON is enabled"]] call TON_fnc_logIt;
	};
	//Initialize VAC options from extDB
	if((EQUAL(EXTDB_SETTINGS("VAC"),1))) then {
		VAC_ID = round(random(9999));
		CONSTVAR(VAC_ID);
		SVAR_UINS ["VAC_ID",VAC_ID];

		EXTDB "9:START_VAC";
		EXTDB format["9:ADD_PROTOCOL:STEAM:%1",FETCH_CONST(VAC_ID)];
		["diag_log",["extDB2: VAC is enabled"]] call TON_fnc_logIt;
	};
	//Initialize MISC options from extDB
	if((EQUAL(EXTDB_SETTINGS("MISC"),1))) then {
		MISC_ID = round(random(9999));
		CONSTVAR(MISC_ID);
		SVAR_UINS ["MISC_ID",MISC_ID];

		EXTDB format["9:ADD_PROTOCOL:MISC:%1",FETCH_CONST(MISC_ID)];
		["diag_log",["extDB2: MISC is enabled"]] call TON_fnc_logIt;
	};
	EXTDB "9:LOCK";
	["diag_log",["extDB2: Connected to the Database"]] call TON_fnc_logIt;
} else {
	life_sql_id = GVAR_UINS "life_sql_id";
	CONSTVAR(life_sql_id);
	["diag_log",["extDB2: Still Connected to the Database"]] call TON_fnc_logIt;
	if((EQUAL(EXTDB_SETTINGS("RCON"),1))) then {
		RCON_ID = GVAR_UINS "RCON_ID";
		CONSTVAR(RCON_ID);
		["diag_log",["extDB2: RCON still enabled"]] call TON_fnc_logIt;
	};
	if((EQUAL(EXTDB_SETTINGS("VAC"),1))) then {
		VAC_ID = GVAR_UINS "VAC_ID";
		CONSTVAR(VAC_ID);
		["diag_log",["extDB2: VAC still enabled"]] call TON_fnc_logIt;
	};
	if((EQUAL(EXTDB_SETTINGS("MISC"),1))) then {
		MISC_ID = GVAR_UINS "MISC_ID";
		CONSTVAR(MISC_ID);
		["diag_log",["extDB2: MISC still enabled"]] call TON_fnc_logIt;
	};
};

if(!(EQUAL(life_server_extDB_notLoaded,""))) exitWith {}; //extDB did not fully initialize so terminate the rest of the initialization process.

/* Run stored procedures for SQL side cleanup */
["resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["deleteOldHouses",1] spawn DB_fnc_asyncCall;
["deleteOldGangs",1] spawn DB_fnc_asyncCall;

/* Map-based server side initialization. */
master_group attachTo[bank_obj,[0,0,0]];
onMapSingleClick "if(_alt) then {vehicle player setPos _pos};"; //Local debug for myself

{
	_hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
	_hs setDir (markerDir _x);
	_hs setPosATL (getMarkerPos _x);
	_var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [4.69775,32.6045,-0.1125]];
	detach _var;
	_var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [-28.0336,-10.0317,0.0889387]];
	detach _var;
} foreach ["hospital_2","hospital_3"];

{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;


//Make Friends on the Server
east setFriend [west, 1];
west setFriend [east, 1];

resistance setFriend [west, 1];
west setFriend [resistance, 1];

resistance setFriend [east, 1];
east setFriend [resistance, 1];

civilian setFriend [east, 1];
civilian setFriend [resistance, 1];
civilian setFriend [west, 1];

[8,true,12] execFSM "\life_server\FSM\timeModule.fsm";

life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
life_asfLevel = 0;
life_alacLevel = 0;
life_thwLevel = 0;
life_eventLevel = 0;
CONST(JxMxE_PublishVehicle,"false");

/* Setup radio channels for west/independent/civilian */

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];


/* Set the amount of gold in the federal reserve at mission start */
fed_bank setVariable ["safe",count playableUnits,true];
[] spawn TON_fnc_federalUpdate;

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile PreProcessFileLineNumbers "\life_server\functions.sqf";
[] call compile PreProcessFileLineNumbers "\life_server\eventhandlers.sqf";

/* Miscellaneous mission-required stuff */
[] spawn TON_fnc_cleanup;
life_wanted_list = [];
[] execFSM "\life_server\FSM\cleanup.fsm";

[] spawn
{
	private["_logic","_queue"];
	while {true} do {
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];

		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2,Dealer_3];
	};
};

[] spawn TON_fnc_initHouses;

/* Setup the federal reserve building(s) */
private["_dome","_rsb"];
_dome = fed_bank_dome;
_rsb = nearestObject [fed_bank,"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;

_dome = fed_bank_dome;
for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};

/* Tell clients that the server is ready and is accepting queries */
life_server_isReady = true;
PVAR_ALL("life_server_isReady");

/* Initialize hunting zone(s) */
["hunting_zone",100] spawn TON_fnc_huntingZone;

/* DynMarket */
[] execVM "\life_server\Functions\DynMarket\config.sqf";

/* Smartphone system */
[] execVM "\life_server\Functions\PlayGermany\Smartphone\initRadioCells.sqf";

/* Resource gathering system */
[] execVM "\life_server\Functions\PlayGermany\initResourceGatheringSystem.sqf";

//Prisonbreak
PG_jailHackInProgress = false;
publicVariable "PG_jailHackInProgress";

// restart armageddon
[] execVM "\life_server\Functions\PlayGermany\ArmageddonOnRestart.sqf";

//Event stuff
//[[varname (also the name shown), function name],...]
PG_event_stuff = [["PG_event_raceTrack","PGSERV_fnc_event_race"],["PG_event_raceTrack1","PGSERV_fnc_Altis_Rennstrecke"],["PG_event_Airport","PGSERV_fnc_Altis_Start_Flughafen_Event"],["PG_event_GhostHotel","PGSERV_fnc_Altis_LMS_GhostHotel"]];
publicVariable "PG_event_stuff";

// donation goal
PG_donGoalReached = false;
publicVariable "PG_donGoalReached";
PG_donGoalMulti = 1;
publicVariable "PG_donGoalMulti";
[] execVM "\life_server\Functions\PlayGermany\donationGoal.sqf";
[] execVM "\life_server\Functions\PlayGermany\initShipWreckSystem.sqf";

//Shipwreck
schiffsWrack = objNull;
publicVariable "schiffsWrack";



PG_spuid = ["76561197965481006","76561198063100739","76561197974601508","76561197971869365","76561198070584919","76561198088807082","76561198057515385","76561197960562131"];
publicVariable "PG_spuid";

//Hide stuff

//rebLagerHeliSpawn
hideObjectGlobal (nearestTerrainObjects[[9208.6,8116.97,-0.0255203],[],5] select 0);
hideObjectGlobal (nearestTerrainObjects[[9208.6,8116.97,-0.0255203],[],5] select 1);
//Kavalla LKW Park
hideObjectGlobal (nearestTerrainObjects[[3692.49,13158.3,-0.0462074],[],20] select 0);
hideObjectGlobal (nearestTerrainObjects[[3692.49,13158.3,-0.0462074],[],20] select 1);
hideObjectGlobal (nearestTerrainObjects[[3692.49,13158.3,-0.0462074],[],20] select 2);
hideObjectGlobal (nearestTerrainObjects[[3692.49,13158.3,-0.0462074],[],20] select 3);