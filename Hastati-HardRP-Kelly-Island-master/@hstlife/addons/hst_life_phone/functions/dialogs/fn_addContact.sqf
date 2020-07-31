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
#define PHONE_CALLLIST 3005
disableSerialization;

private [];
//if(!alive player || dialog) exitWith {};
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};
if(!(createDialog "hst_life_phone_addContact")) exitWith {};
//if(HANDCUFFED(player) || ISSURRENDERED(player)) exitWith {}; //ace check if player has his hands free
//if(ISUNCONSCIOUS(player)) exitWith {}; //ace check if player is unconscious
_dialog = findDisplay 61202;
_number = _this select 0;
_text = "";
if(!isNil "_number") then {_text = _number;};
_ctr = _dialog displayCtrl 3003;
_ctr ctrlSetText _text;

