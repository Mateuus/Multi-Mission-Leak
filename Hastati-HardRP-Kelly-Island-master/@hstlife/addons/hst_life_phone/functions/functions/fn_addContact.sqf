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

_number = _this select 0;
_name = _this select 1;
_isContact = false;
{
	if((_x select 0) == _number) then {
		_x set [1, _name];
		_isContact = true;
	};
} forEach hst_life_phone_contacts;

if(!_isContact) then {
	hst_life_phone_contacts pushBack [_number, _name];
	[(getPlayerUID player), _number, _name] remoteExec ["TON_fnc_contactInsert", RSERV];
} else {
	[(getPlayerUID player), _number, _name] remoteExec ["TON_fnc_contactUpdate", RSERV];
};