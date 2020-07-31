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
#define PHONE_MAIN 61201
#define PHONE_ADDCONTACT 61202
#define PHONE_CONTACTS 61203
#define PHONE_MESSAGES 61204
#define PHONE_CALLS 61205
#define PHONE_SMSSEND 61206
#define PHONE_CHANGE 61207
disableSerialization;

private [];

if(!alive player || !dialog) exitWith {};

_display = _this select 0;
_dialog = findDisplay _display;


switch(_display) do {
	case PHONE_CONTACTS: {
		_list = _dialog displayCtrl 3005;
		_index = lbCurSel _list;
		_number = _list lbData _index;
		_emergencyNumber = false;
		{
			if(_x select 0 == _number) exitWith {_emergencyNumber = true;};
		} forEach hst_life_phone_emergencyNumbers;
		if(_emergencyNumber) exitWith {};
		_uid = getPlayerUID player;
		_list lbDelete _index;
		_contact = [_number] call hst_life_phone_functions_fnc_getContact;
		hst_life_phone_contacts = hst_life_phone_contacts - [_contact];
		lbClear _list;
		{
			_index2 = _list lbAdd (_x select 1);
			_list lbSetData [_index, (_x select 0)];
		} forEach hst_life_phone_emergencyNumbers;
		{
			_index2 = _list lbAdd (_x select 1);
			_list lbSetData [_index, (_x select 0)];
		} forEach hst_life_phone_contacts;
		_list lbSetCurSel (_index - 1);
		[_uid, _number] remoteExec ["TON_fnc_contactDelete",RSERV];
	};
};
hst_life_phone_lastDiaglog = _display;