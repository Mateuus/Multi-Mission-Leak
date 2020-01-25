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
#define msg(var) hint var
_from = _this select 0;
_message = _this select 1;
_target = _this select 2;
if(_target != player) exitWith {};

_contact = [_from] call hst_life_phone_functions_fnc_getContact;
_fromName = "";
if((count _contact) != 0) then {
	_fromName = _contact select 1;
} else {
	_fromName = _from;
};
hint format["Nowa wiadomosc od: %1\n%2",_fromName,_message];
{
	if(hst_life_phone_activeCard == _x select 0) exitWith {
		(_x select 1) pushBack [hst_life_phone_activeNumber, _from, _message];
	};
} forEach hst_life_phone_sms;