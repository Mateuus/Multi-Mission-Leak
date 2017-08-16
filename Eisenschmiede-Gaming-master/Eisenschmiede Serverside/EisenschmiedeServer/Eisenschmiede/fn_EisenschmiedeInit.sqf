#include "script_macros.hpp"
#define __EXIT(condition) if(condition) exitWith {}
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Initialize the server and required systems.
*/

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call ES_fnc_MPexec};
DB_Async_Active = false;
DB_Async_ExtraLock = false;
ES_server_isReady = false;
ES_server_extDB_notLoaded = "";
serv_sv_use = [];
publicVariable "ES_server_isReady";

if(isNil {uiNamespace getVariable "ES_sql_id"}) then {
	ES_sql_id = round(random(9999));
	ES_sql_id = compileFinal str(ES_sql_id);
	uiNamespace setVariable ["ES_sql_id",ES_sql_id];

	try {
		_result = "extDB2" callExtension format["9:ADD_DATABASE:%1",getText(configFile >> "ES_Server_Settings" >> "EXTDB" >> "DatabaseName")];
		if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: ERROR MIT DER DATENBANK"};
		_result = "extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:%2:SQL_RAW_V2:%1:ADD_QUOTES",FETCH_CONST(ES_sql_id),getText(configFile >> "ES_Server_Settings" >> "EXTDB" >> "DatabaseName")];
		if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: ERROR MIT DER DATENBANK"};
	} catch {
		diag_log _exception;
		ES_server_extDB_notLoaded = [true, _exception];
		publicVariable "ES_server_extDB_notLoaded";
	};

	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:ADMIN_LOG:ADMIN_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:ADMIN_DEBUG:ADMIN_DEBUG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:ADMIN_SPAWN:ADMIN_SPAWN";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:ADMIN_KEY:ADMIN_KEY";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:COP_LOG:COP_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:GIVE_LOG:GIVE_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:DEPOSIT_LOG:DEPOSIT_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:ROB_LOG:ROB_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:BUGREPORT_LOG:BUGREPORT_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:XPLVL_LOG:XPLVL_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:ADMIN_MESSAGE_LOG:ADMIN_MESSAGE_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:MESSAGE_LOG:MESSAGE_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:LIZENZ_LOG:LIZENZ_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:FAHRZEUG_LOG:FAHRZEUG_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:SHOP_LOG:SHOP_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:SHOPSELL_LOG:SHOPSELL_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:MONEY_TRANSFER_LOG:MONEY_TRANSFER_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:VIRTUALSHOP_LOG:VIRTUALSHOP_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:VIRTUALSHOPSELL_LOG:VIRTUALSHOPSELL_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:GANG_WITHDRAW_LOG:GANG_WITHDRAW_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:GANG_DEPOSITS_LOG:GANG_DEPOSITS_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:TICKET_LOG:TICKET_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:JAIL_LOG:JAIL_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:KILL_LOG:KILL_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:HACK_LOG:HACK_LOG";
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:RANDOME_LOG:RANDOME_LOG";

	__EXIT(!(EQUAL(ES_server_extDB_notLoaded,"")));
	"extDB2" callExtension "9:LOCK";
	diag_log "extDB2: Verbunden mit der Datenbank!";
} else {
	ES_sql_id = uiNamespace getVariable "ES_sql_id";
	ES_sql_id = compileFinal str(ES_sql_id);

	diag_log "extDB2: Still Connected to Database";
};

if(!(EQUAL(ES_server_extDB_notLoaded,""))) exitWith {};

/* Run stored procedures for SQL side cleanup */
["CALL resetLifeVehicles",1] call ES_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call ES_fnc_asyncCall;
["CALL deleteOldHouses",1] call ES_fnc_asyncCall;
["CALL deleteOldGangs",1] call ES_fnc_asyncCall;

/* Map-based server side initialization. */
// master_group attachTo [bank_obj,[0,0,0]];
onMapSingleClick "if(_alt) then {vehicle player setPos _pos};"; //Local debug for myself

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

ES_adminLevel = 0;
ES_medicLevel = 0;
ES_copLevel = 0;
ES_donatorlvl = 0;
ES_fnc_playtime_values = [];
ES_fnc_playtime_values_request = [];

pb_spieler = [];
pb_spielstatus = 0;
pb_maxspieler = 10;

if (CurrentMode == "Altis") then {
	[] execVM "\EisenschmiedeServer\Tonic\Functions\paintball\arena_paintball.sqf";
};

[] execVM "\EisenschmiedeServer\Tonic\Functions\DynMarket\fn_config.sqf";


/* Setup radio channels for west/independent/civilian */
ES_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Polizei Channel", "(Polizei) %UNIT_NAME", []];
ES_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Zivilisten Channel", "(Zivilist) %UNIT_NAME", []];
ES_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Feuerwehr Channel", "(Feuerwehr) %UNIT_NAME", []];

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;
6 enableChannel [true, false];
7 enableChannel [true, false];
8 enableChannel [true, false];

/* Set the amount of gold in the federal reserve at mission start */
fed_bank setVariable ["safe",count playableUnits,true];
[] spawn ES_fnc_federalUpdate;

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call ES_fnc_clientDisconnect; false;}];
[] call compile PreProcessFileLineNumbers "\EisenschmiedeServer\Tonic\functions.sqf";
[] call compile PreProcessFileLineNumbers "\EisenschmiedeServer\Tonic\eventhandlers.sqf";
[4,true,12] execFSM "\EisenschmiedeServer\Tonic\FSM\timeModule.fsm";

/* Miscellaneous mission-required stuff */
[] spawn ES_fnc_cleanup;
ES_wanted_list = [];
[] execFSM "\EisenschmiedeServer\Tonic\FSM\cleanup.fsm";

[] spawn {
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

[] spawn ES_fnc_initHouses;

if (CurrentMode == "Altis") then {
		private["_rsb"];
		_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];
		_rsb setVariable["bis_disabled_Door_1",1,true];
		_rsb allowDamage false;

		[] spawn {
		    private["_bank"];
		    _bank = nearestObject [[16592.863,12286.79,0],"Land_Offices_01_V1_F"];

		    for "_i" from 1 to 7 do { _bank setVariable[format["bis_disabled_Door_%1",_i],1,true]; };
		};

		[] spawn {
		    private["_card"];
		    _card = nearestObject [[16618.223,12291.194,0],"Land_BarGate_F"];

		    for "_i" from 1 to 2 do { _card setVariable[format["bis_disabled_Door_%1",_i],1,true]; };
		};
	}else {
		
		[] spawn {
		    private["_bank"];
		    _bank = nearestObject [[5629.24,3954.88,9.07571],"Land_Offices_01_V1_F"];

		    for "_i" from 1 to 7 do { _bank setVariable[format["bis_disabled_Door_%1",_i],1,true]; };
		};
};

/* Initialize hunting zone(s) */
["hunting_zone",30] spawn ES_fnc_huntingZone;

/* Der Stefan ist CoooL */
ESServer =
[
	"admininfo",

	"revivePlayer",

	"xp_add","xp_getProgress","xp_update","lvl_xpInfo","lvl_Color","lvl_Info","initZeus","nitroLights","NachrichtenDialog","copMarkerZones",

	"InfoText", "Info", "infos", "VehFlip","bugreport","ESMoves","init","Sation_Service","setPlayTime","getPlayTime",
	
	"sitdown", "standup","tiere","ESitems","vehicleSkinLBChange","CamES","muell","transporttonne","muelltonne","muelltempest","blaulicht","blaulichtwegnehmen","fastrope","shiff","animaltracker","wenden","blaulicht_medic","blaulichtwegnehmen_medic",
	
	"tuningMenu","buyHorn","buyLights","buySkin","buyTiles","buyTurbo","FeuerwehrSeil","anfang",

	"isKindOf","onPlayerKilled","openKey","mresArrayKillLog","functions","HaloJump","CamDiaLog","einsatzschild","pb_join","pairsToSQL"

];

{
	ESFnc = _x;
	ESFncPath = format ["\EisenschmiedeServer\Eisenschmiede\Scripts\fn_%1.sqf",ESFnc];
	call compile format ["ES_fnc_%1 = compile PreprocessFileLineNumbers '%2'",ESFnc,ESFncPath];
	publicVariable (format ["ES_fnc_%1",_x]);
} forEach ESServer;

[] call Eisenschmiede_fnc_mapSpawn;

waitUntil {EisenschmiedeMapREADY};

/* Tell clients that the server is ready and is accepting queries */
ES_server_isReady = true;
publicVariable "ES_server_isReady";

0 setFog 0;
0 setRain 0;
999999 setFog 0;
999999 setRain 0;


ES_fnc_VarCheck = {

	if ((name player in [""," ","  ","   "])) exitWith {

		_toLog = format ["Name: %1 || UID: %2 || Seite: %3 || CursorTarget: %4 || Position: %5 || Bank: %6 $ || ER HAT KEIN INGAME NAMEN! KICK", name player, getPlayerUID player, side player, cursorTarget, mapGridPosition player, [ES_atmbank] call ES_fnc_numberText];
		["HACK_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

		[] spawn {

			ByeByeHackerSPASTI = true;
			publicVariable "ByeByeHackerSPASTI";

		};

	};

	if ((player getVariable["realname",name player] in [""," ","  ","   "])) exitWith {


		_toLog = format ["Name: %1 || UID: %2 || Seite: %3 || CursorTarget: %4 || Position: %5 || Bank: %6 $ || ER HAT KEIN INGAME NAMEN! KICK", name player, getPlayerUID player, side player, cursorTarget, mapGridPosition player, [ES_atmbank] call ES_fnc_numberText];
		["HACK_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

		[] spawn {

			ByeByeHackerSPASTI = true;
			publicVariable "ByeByeHackerSPASTI";

		};

	};

	if (getPlayerUID player in [""," ","  ","   "]) exitWith { 

		_toLog = format ["Name: %1 || UID: %2 || Seite: %3 || CursorTarget: %4 || Position: %5 || Bank: %6 $ || ER HAT KEINE STEAMID! KICK", name player, getPlayerUID player, side player, cursorTarget, mapGridPosition player, [ES_atmbank] call ES_fnc_numberText];
		["HACK_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

		[] spawn {

			ByeByeHackerSPASTI = true;
			publicVariable "ByeByeHackerSPASTI";

		};

	};
};

publicVariable "ES_fnc_VarCheck";

ArtemLog = {
	_log = _this select 0;
	"ArtemLog" callExtension format["%1",_log];
};