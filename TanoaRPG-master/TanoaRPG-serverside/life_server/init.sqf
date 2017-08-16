#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})

life_server_isReady = false;
publicVariable "life_server_isReady";
life_hc_inUse = ObjNull;

[] execVM "\life_server\functions.sqf";


//Only need to setup extDB2 once.
if ( isNil {uiNamespace getVariable "life_sql_id"}) then
{
	_result = call compile ("extDB2" callExtension "9:ADD_DATABASE:Database2");
	_life_sql_id = str(round(random(999999)));
	life_sql_id = compileFinal _life_sql_id;
	_result = call compile ("extDB2" callExtension "9:START_RCON:RCON");
	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:Database2:SQL_RAW_V2:%1:ADD_QUOTES",_life_sql_id]);
	"extDB2" callExtension "9:LOCK";
	uiNamespace setVariable ["life_sql_id", _life_sql_id];
	diag_log "extDB: Connection Succesfull";
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
	diag_log "extDB: Already Connected";
};


//Run procedures for SQL cleanup on mission start.
["CALL resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteOldMessages",1] spawn DB_fnc_asyncCall;
["CALL deleteOldGeldlogs",1] spawn DB_fnc_asyncCall;
["CALL addGUID",1] spawn DB_fnc_asyncCall;

//Player Scripts & new CleanUp
[] spawn TEX_fnc_initClientScripts;
[] spawn TEX_fnc_cleanUpComplete;

life_adminlevel = 0;
life_medicLevel = 0;
life_adaclevel = 0;
life_coplevel = 0;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");


life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

serv_sv_use = [];

//General cleanup for clients disconnecting.
addMissionEventHandler ["HandleDisconnect",{_this call TEX_fnc_clientDisconnect; false;}]; //Do not second guess this, this can be stacked this way.

life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn
{
	while {true} do
	{
		sleep (30 * 60);
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2];
	};
};

//Strip NPC's of weapons
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

[] spawn {
	sleep 10;
	[] spawn TEX_fnc_initHouses;
};


//Scheiß Nebel hau ab
[] spawn {
	while {true} do 
	{
		sleep 10;
		0 setFog 0;
		0 setRain 0;
		sleep 150;
	};
};


//Lockup the dome
for "_i" from 1 to 7 do
{
	dome setVariable[format["bis_disabled_Door_%1",_i],1,true];
	dome animate [format["Door_%1_rot",_i],0];
};

[] spawn TEX_fnc_federalUpdate;
fed_bank setVariable["safe",(count playableUnits),true];

rsb animate ["Door_1_rot",0];
rsb setVariable["bis_disabled_Door_1",1,true];

fed_bank setVariable["Dome", dome,true];
fed_bank setVariable["Rsb", rsb,true];
//ENDE BANK

//Init Variables for mvh (MasterVariableHandler):
mvh setVariable["Death", ["0","0"], true];	//0,0 because i dont know just to be sure :D
mvh setVariable ["Schild", [], true];


life_server_isReady = true;
publicVariable "life_server_isReady";

//Mit Opfor in ein Auto steigen
west setFriend [east, 1];
east setFriend [west, 1];
resistance setFriend [east, 1];
east setFriend [resistance, 1];

[] execVM "\life_server\Functions\Schiffswrack\fn_generateschiffwrackAuto.sqf";