life_firstSpawn = true;
life_newplayer = false;
life_session_completed = false;

private["_handle","_timeStamp","_loaded","_handleEXP"];
waitUntil {sleep 0.1; !isNull player && player == player};
waitUntil {sleep 0.1; Crypt_finish};

[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
[] call life_fnc_setupEVH;
[] call life_fnc_setupActions;
[] call life_fnc_marker;	
[] call life_fnc_lightpoints;
[] spawn life_fnc_initFuelAction;
[] spawn life_fnc_CAH_fetchDetails;
waitUntil{sleep 0.1; (!isNil {SOA_fnc_clientGangLeader})};
waitUntil{sleep 0.1; !isNil "life_server_isReady"};
waitUntil{sleep 0.1; (life_server_isReady OR !isNil "life_server_extDB_notLoaded")};

if(!isNil "life_server_extDB_notLoaded") exitWith {
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {sleep 0.1; life_session_completed};
[] spawn life_fnc_escInterupt;

WaitUntil {sleep 0.1; life_mission_Completed};

life_loading = false;

if(playerside == civilian) then {
	_handle = [] spawn life_fnc_exptolevel;
	WaitUntil {sleep 0.1; scriptDone _handle};
};

_handle = [] spawn life_fnc_initialization;
waitUntil {sleep 0.1; scriptDone _handle};

[] call life_fnc_settingsInit;

player enablesimulation true;
player disableConversation true;
player addRating 99999999;
enableSentences false;
enableRadio false;
0 fadeRadio 0;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["missingOrgan",false,true];
player setVariable["hasOrgan",false,true];
player setVariable["life_callactive1",false];
player setVariable["life_callactive2",false];
player setVariable["life_callactive3",false];
player setVariable["life_callflug",false,true];
player setVariable["life_smartphoneCaller",ObjNull];
player setVariable["steam64Id",getPlayerUID player];
player setVariable["realname",profileName,true];
if(life_level < 3) then {player setVariable["noob",true,true]};
if((call life_adminlevel) > 0) then {player setVariable["supporter",true,true]};

[] execFSM "core\fsm\client.fsm";
if(playerside != civilian) then {[] execFSM "core\fsm\activity.fsm"};
[player,true,playerSide] remoteExecCall ["SOA_fnc_managesc",2];
[] call life_fnc_hudSetup;

life_fnc_garageRefund = compileFinal
"
 _price = _this select 0;
 _unit = _this select 1;
 if(_unit != player) exitWith {};
 life_beatbankgeld = life_beatbankgeld + _price;
";

life_paycheck = compileFinal (str life_paycheck);
player enableFatigue (call life_enableFatigue);
life_firstSpawn = false;

[] call life_fnc_survival;