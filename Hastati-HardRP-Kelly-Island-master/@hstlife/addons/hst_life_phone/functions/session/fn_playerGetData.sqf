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

diag_log "---------------- fn_phoneGetData ----------------";
_data = _this;

hst_life_phone_contacts = [];
hst_life_phone_cards = [];
hst_life_phone_sms = [];
hst_life_phone_call = [];
hst_life_phone_selectedNumber = "";
hst_life_phone_newMessages = 0;
hst_life_phone_newCalls = 0;
hst_life_phone_answered = 0;
hst_life_phone_beingCalled = false;
hst_life_phone_calling = false;
hst_life_phone_inCall = false;
hst_life_phone_lastDiaglog = 0;
hst_life_phone_activeCardSMS = 0;
hst_life_phone_activeCardCall = 0;
hst_life_phone_activeCardSaldo = 0;

if(isNil "_data") exitWith {};
//if(typeName _data != "ARRAY") exitWith {};
if((count _data) != 0) then {
	hst_life_phone_contacts = _data select 0;
	hst_life_phone_cards = _data select 1;
	hst_life_phone_sms = _data select 2;
	hst_life_phone_call = _data select 3;
	[hst_life_phone_activeCard] spawn hst_life_phone_functions_fnc_changeCard;
};