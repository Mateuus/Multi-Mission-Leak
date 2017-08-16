/*
	File: headless_client/init.sqf
	
	Description: Controlls and start the HC
	Author: CooliMC
*/
private ["_result"];
life_hc_id = 0; 
life_wanted_list = [];
serv_sv_use = [];

diag_log "----------------------- Start of Headless Client Init !!! -----------------";
[] execVM "\Headless_Client\functions.sqf";
diag_log "--------------------------- HC Functions Executed !!! ---------------------";
if(hasInterface) exitWith {};	//Just to be Sure

[] spawn {
	private ["_started"];
	_started = serverTime;
	
	while {true} do
	{
		diag_log format ["Seit InitStart: %1 Sek", (serverTime - _started)];
		sleep 1;
	};
};

diag_log "------------------ Wait Until Life Server is Ready !!! --------------------";
waitUntil{life_server_isReady};
diag_log "------------- Server is Ready, Waiting for Client Init --------------------";
waitUntil {!isNull player && player == player};	//Wait until player is ready
diag_log "--------------- CLient is Ready, Waiting for Var Init ---------------------";
waitUntil {!isNil "hc_1" || !isNil "hc_2"};
diag_log "------------------------- Client Vars Ready -------------------------------";

if(!isNil "hc_1") then
{
	if(!isNull hc_1) then
	{
		if(hc_1 == player) then
		{ 
			life_hc_id = 1; 
			diag_log "------------------- HC-ID 1 Selected and Started  -------------------------";
		} else {
			if(!isNil "hc_2") then
			{
				if(!isNull hc_2) then
				{
					if(hc_2 == player) then
					{
						life_hc_id = 2; 
						diag_log "------------------- HC-ID 2 Selected and Started  -------------------------";
					} else {
						diag_log "------------------ ERROR IN HC INIT NO CLIENT INIT ------------------------";
					};
				} else {
					diag_log "------------------ ERROR IN HC INIT NO CLIENT INIT ------------------------";
				};
			} else {
				diag_log "------------------ ERROR IN HC INIT NO CLIENT INIT ------------------------";
			};
		};
	} else {
		if(!isNil "hc_2") then
		{
			if(!isNull hc_2) then
			{
				if(hc_2 == player) then
				{
					life_hc_id = 2; 
					diag_log "------------------- HC-ID 2 Selected and Started  -------------------------";
				} else {
					diag_log "------------------ ERROR IN HC INIT NO CLIENT INIT ------------------------";
				};
			} else {
				diag_log "------------------ ERROR IN HC INIT NO CLIENT INIT ------------------------";
			};
		} else {
			diag_log "------------------ ERROR IN HC INIT NO CLIENT INIT ------------------------";
		};
	};
} else {
	if(!isNil "hc_2") then
	{
		if(!isNull hc_2) then
		{
			if(hc_2 == player) then
			{
				life_hc_id = 2; 
				diag_log "------------------- HC-ID 2 Selected and Started  -------------------------";
			} else {
				diag_log "------------------ ERROR IN HC INIT NO CLIENT INIT ------------------------";
			};
		} else {
			diag_log "------------------ ERROR IN HC INIT NO CLIENT INIT ------------------------";
		};
	} else {
		diag_log "------------------ ERROR IN HC INIT NO CLIENT INIT ------------------------";
	};
};

if(life_hc_id == 0) exitWith
{
	diag_log "------------------------- ERROR IN HC INIT EXIT ---------------------------";
};

diag_log "------------------------- Datebase Init Started ---------------------------";
if((mvh getVariable [format["SQL_ID_%1", life_hc_id], -1]) == -1) then
{
	diag_log "--------------------- Trying New Datebase Connection ----------------------";
	_result = call compile ("extDB2" callExtension "9:ADD_DATABASE:Database2");
	life_sql_id = compileFinal (str(round(random(999999))));
	_result = call compile ("extDB2" callExtension "9:START_RCON:RCON");
	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:Database2:SQL_RAW_V2:%1:ADD_QUOTES", (call life_sql_id)]);
	"extDB2" callExtension "9:LOCK";
	mvh setVariable [format["SQL_ID_%1", life_hc_id], (call life_sql_id), true];
	diag_log format["Headless Client %1 ExtDB2 hat sich erfolgreich mit der Datenbank verbunden", life_hc_id];
	[[(getPlayerUID player), (name player)], [-1, "SERVER"], 4, "[HC]", format["Headless Client %1 ExtDB2 hat sich erfolgreich mit der Datenbank verbunden", life_hc_id]] remoteExec ["TEX_fnc_logIt", 2];
} else {
	diag_log "--------------------- Trying Old Datebase Connection ----------------------";
	life_sql_id = compileFinal (str (mvh getVariable [format["SQL_ID_%1", life_hc_id], 1]));
	_result = call compile ("extDB2" callExtension "9:ADD_DATABASE:Database2");
	_result = call compile ("extDB2" callExtension "9:START_RCON:RCON");
	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:Database2:SQL_RAW_V2:%1:ADD_QUOTES", (call life_sql_id)]);
	"extDB2" callExtension "9:LOCK";
	diag_log format["Headless Client %1 ExtDB2 hat sich erneut erfolgreich mit der Datenbank verbunden", life_hc_id];
	[[(getPlayerUID player), (name player)], [-1, "SERVER"], 4, "[HC]", format["Headless Client %1 ExtDB2 hat sich erneut erfolgreich mit der Datenbank verbunden", life_hc_id]] remoteExec ["TEX_fnc_logIt", 2];
};

diag_log "----------- Switching HC-ID To Call Right Init on LifeServer --------------";
switch (life_hc_id) do
{
	case 1:
	{
		[1, (getPlayerUID player), (name player)] remoteExec ["TEX_fnc_initHC", 2];
		diag_log "---------------------- HC-ID 1 Called on LifeServer -----------------------";
	};
	
	case 2:
	{
		[2, (getPlayerUID player), (name player)] remoteExec ["TEX_fnc_initHC", 2];
		diag_log "---------------------- HC-ID 2 Called on LifeServer -----------------------";
	};
};

//["CALL addGUID",1] spawn DB_fnc_asyncCall;
diag_log "------------------------ HC Called AddGUID Function -----------------------";

[] spawn {
	while {true} do
	{
		[] spawn TEX_fnc_initHouses;
		diag_log "-------------------------- HC Called House Init ---------------------------";
		sleep 900;
	};
};
diag_log "----------------------------- End Of HC Init ------------------------------";