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
#define PHONE_CONTACTS 3005
disableSerialization;

private [];
//if(!alive player || dialog) exitWith {};
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};
if(!(createDialog "hst_life_phone_contacts")) exitWith {};
//if(HANDCUFFED(player) || ISSURRENDERED(player)) exitWith {}; //ace check if player has his hands free
//if(ISUNCONSCIOUS(player)) exitWith {}; //ace check if player is unconscious
_dialog = findDisplay 61203;
_btn1 = _dialog displayCtrl BTN1;
_btn2 = _dialog displayCtrl BTN2;
_btn3 = _dialog displayCtrl BTN3;
_btn4 = _dialog displayCtrl BTN4;

_phoneCallList = _dialog displayCtrl PHONE_CONTACTS;
//[] spawn life_fnc_phoneGetActiveNumber;
{
_index = _phoneCallList lbAdd (_x select 1);
_phoneCallList lbSetData [_index, (_x select 0)];
} forEach hst_life_phone_emergencyNumbers;
{
	_index = _phoneCallList lbAdd (_x select 1);
	_phoneCallList lbSetData [_index, (_x select 0)];
} forEach hst_life_phone_contacts;
_phoneCallList lbSetCurSel 0;
