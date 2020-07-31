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
#define SIM_CARDS 3003
disableSerialization;

private [];
if(!alive player || dialog) exitWith {};
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};
if(!(createDialog "hst_life_phone_change")) exitWith {};
_dialog = findDisplay 61207;
_btn1 = _dialog displayCtrl BTN1;
_btn2 = _dialog displayCtrl BTN2;
_simCards = _dialog displayCtrl SIM_CARDS;
{
	_id = _x select 0;
	_number = _x select 1;
	_saldo = _x select 3;
	_str = format ["%1. Numer: %2 | SALDO: $%3", _id, _number, _saldo];
	_index = _simCards lbAdd _str;
	_simCards lbSetData [_index, str(_id)];

} forEach hst_life_phone_cards;
_simCards lbSetCurSel 0;
