diag_log "__________________________________";
diag_log "|                                 |";
diag_log "|       HC1 gestartet             |";
diag_log "|_________________________________|";

for "_i" from 0 to 201 do {
	format ["HC_DBaktion_%1",_i] addPublicVariableEventHandler {[(_this select 0),(_this select 1)] spawn DB2_fnc_extdbcall}; //db komunikation
};

"sendtrunk" addPublicVariableEventHandler {(_this select 1) spawn nok_fnc_trunk;}; //trunk system
"hcsend" addPublicVariableEventHandler {(_this select 1) spawn hc_fnc_eingang;}; //Informationen vom Clienten Direkt an den HC

private["_database","_protocol","_protocol_options","_return","_result","_random_number","_extDB_SQL_CUSTOM_ID"];
_database = "DB";
_protocol = "SQL_CUSTOM_V2";
_protocol_options = "hc_config";
_return = false;

if ( isNil {uiNamespace getVariable "extDB_SQL_CUSTOM_ID"}) then
{
	_result = "extDB2" callExtension "9:VERSION";
	diag_log format ["extDB2: Version: %1", _result];
	if(_result == "") exitWith {diag_log "extDB2: Failed to Load"; false};
	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE:DB", _database]);
	if (_result select 0 isEqualTo 0) exitWith {diag_log format ["extDB2: Error Database: %1", _result]; false};
	diag_log "extDB2: Connected to Database";
	_random_number = round(random(999999));
	_extDB_SQL_CUSTOM_ID = str(_random_number);
	extDB_SQL_CUSTOM_ID = compileFinal _extDB_SQL_CUSTOM_ID;
	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:%2:%3:%4", _database, _protocol, _extDB_SQL_CUSTOM_ID, _protocol_options]);
	if ((_result select 0) isEqualTo 0) exitWith {diag_log format ["extDB2: Error Database Setup: %1", _result]; false};
	diag_log format ["extDB2: Initalized %1 Protocol", _protocol];
	"extDB2" callExtension "9:LOCK";
	diag_log "extDB2: Locked";
	uiNamespace setVariable ["extDB_SQL_CUSTOM_ID", _extDB_SQL_CUSTOM_ID];
	_return = true;
}
else
{
	extDB_SQL_CUSTOM_ID = compileFinal str(uiNamespace getVariable "extDB_SQL_CUSTOM_ID");
	diag_log "extDB2: Already Setup";
	_return = true;
};

if (_return) then {
	headless = ["head_1",player];
	publicVariableServer "headless";
};
[] spawn nok_fnc_antiCheat;

//Gangsystem
"hc_checkGangname" addPublicVariableEventHandler {(_this select 1) spawn hc_fnc_checkGangnameTag; diag_log _this};
"hc_initGang" addPublicVariableEventHandler {(_this select 1) spawn hc_fnc_initGang; diag_log _this};
"hc_updateGang" addPublicVariableEventHandler {(_this select 1) spawn hc_fnc_updateGang; diag_log _this};
"hc_newDeleteGang" addPublicVariableEventHandler {(_this select 1) spawn hc_fnc_newDeleteGang; diag_log _this};
"hc_getGangList" addPublicVariableEventHandler {(_this select 1) spawn hc_fnc_getGangList; diag_log _this};
"hc_getGangname" addPublicVariableEventHandler {(_this select 1) spawn hc_fnc_getGangname; diag_log _this};
"hc_gangEroberung" addPublicVariableEventHandler {profileNamespace setVariable["gangEroberung",_this select 1]; saveProfileNamespace; diag_log _this};
if(!((profileNamespace getVariable["gangEroberung",-1]) isEqualTo -1)) then {
	zero_gang_flag setVariable["gangControl",profileNamespace getVariable["gangEroberung","-1"],true];
};

//Marktsystem
"hc_marketChange" addPublicVariableEventHandler {[(_this select 1)] spawn hc_fnc_marketChange};
"hc_manualUpdate" addPublicVariableEventHandler {[] spawn hc_fnc_marketManualUpdate;};

market_event_id = -1;
market_changes = [];
[] spawn hc_fnc_marketUpdate;

//Lottosystem
_motd = ["selectConfig:lotto_preis",2,false] call DB2_fnc_extdbcallHC;
diag_log format["Lotto Preise aus der DB: %1",_motd];
GJZHuPDR = _motd select 0;
GJZHuPDR = parseNumber GJZHuPDR;
publicVariable "GJZHuPDR";

_motd = ["selectConfig:lotto_steuern",2,false] call DB2_fnc_extdbcallHC;
diag_log format["Lotto Steuern aus der DB: %1",_motd];
wCrWgCLX = _motd select 0;
wCrWgCLX = parseNumber wCrWgCLX;

_motd = ["selectConfig:lotto_maximum",2,false] call DB2_fnc_extdbcallHC;
diag_log format["Lotto MaximalLose aus der DB: %1",_motd];
lotto_maximum = parseNumber(_motd select 0);
lotto = [];
//lotto = profilenamespace getVariable ["lotto",[]];
[] spawn hc_fnc_lottoAusspielung;
