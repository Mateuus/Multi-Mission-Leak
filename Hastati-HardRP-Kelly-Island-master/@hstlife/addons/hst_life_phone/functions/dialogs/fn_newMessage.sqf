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
#define NUMBER 3006
#define BTN1 3001
#define BTN2 3002
#define BTN3 3003
#define BTN4 3004
#define PHONE_MAIN 61201
#define PHONE_ADDCONTACT 61202
#define PHONE_CONTACTS 61203
#define PHONE_MESSAGES 61204
#define PHONE_CALLS 61205
#define PHONE_SMSSEND 61206
#define PHONE_CHANGE 61207
disableSerialization;

private [];
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};
if(!(createDialog "hst_life_phone_sms_send")) exitWith {};
_dialog = findDisplay 61206;
_btn1 = _dialog displayCtrl BTN1;
_btn2 = _dialog displayCtrl BTN2;
_targetNumber = _dialog displayCtrl BTN3;
_messageCtr = _dialog displayCtrl BTN4;
_target = _this select 0;
_targetNumber ctrlSetText _target;

