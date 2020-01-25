/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/
private["_unit","_number","_companyID","_saldo","_SMSPrice","_minutePrice","_query","_queryResult"];
_unit = _this select 0;
_number = _this select 1;
_saldo = _this select 2;
_SMSPrice = _this select 3;
_minutePrice = _this select 4;
//_companyID = _this select 5;
_companyID = 0;
_active = 0;
_alive = 1;

diag_log "------------------------- fn_cardInsert.sqf -------------------------";
diag_log format["%1", _this];
diag_log "---------------------------------------------------------------------";

if(isNil "_unit") exitWith {};

_query = format["SELECT id, number FROM TelSimCards WHERE number='%1'",_number];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
if(count _queryResult == 0) exitWith {false};

_query = format ["INSERT INTO TelSimCards (ownerUID, idCompany, saldo, SMSPrice, minutePrice, permanent, alive) VALUES('%1', '%2', '%3', '%4' ,%5', '%6', '%7')", _unit, _companyID, _saldo, _SMSPrice, _minutePrice, _active, _alive];
[_query, 1] call DB_fnc_asyncCall;