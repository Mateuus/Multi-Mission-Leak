#include "\hst_life_phone\script_macros.hpp"
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
#define msg(var) hint var;

_targetNumber = _this select 0;
_message = _this select 1;
if(hst_life_phone_activeNumber == "") exitWith {msg("Nie masz karty SIM")};
if(_message == "") exitWith {msg("Nie podano wiadomosci.")};
if(_targetNumber == "") exitWith {msg("Nie wpisano numeru.")};
IF(_targetNumber == hst_life_phone_activeNumber == "") exitWith {msg("Nie mozesz wyslas wiadomosci do siebie.");};
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};
_targetArray = [_targetNumber] call hst_life_phone_functions_fnc_checkNumber;
_obj = (_targetArray select 2);
if(count _targetArray == 0) exitWith {msg("Numer nie jest aktywny.")};
if((hst_life_phone_activeCardSaldo - hst_life_phone_activeCardSMS) < 0) exitWith {msg("Nie masz wystarczajaco srodkow na koncie.")};

hst_life_phone_activeCardSaldo = hst_life_phone_activeCardSaldo - hst_life_phone_activeCardSMS;
[_obj, hst_life_phone_activeNumber, _targetNumber, (getPos player), _message] remoteExec ["TON_fnc_smsInsert", RSERV];
{
	if(hst_life_phone_activeCard == _x select 0) exitWith {
		(_x select 1) pushBack [hst_life_phone_activeNumber, _from, _message];
	};
} forEach hst_life_phone_sms;