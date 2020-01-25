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
#define PHONE_MAIN 61201
#define PHONE_ADDCONTACT 61202
#define PHONE_CONTACTS 61203
#define PHONE_MESSAGES 61204
#define PHONE_CALLS 61205
#define PHONE_SMSSEND 61206
#define PHONE_CHANGE 61207
disableSerialization;

private [];
//if(!alive player || dialog) exitWith {};
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};
if(!(createDialog "hst_life_phone_messages")) exitWith {};
//if(HANDCUFFED(player) || ISSURRENDERED(player)) exitWith {}; //ace check if player has his hands free
//if(ISUNCONSCIOUS(player)) exitWith {}; //ace check if player is unconscious
_dialog = findDisplay 61204;
_from = _this select 0;
_btn1 = _dialog displayCtrl BTN1;
_btn2 = _dialog displayCtrl BTN2;
_btn3 = _dialog displayCtrl BTN3;
_btn4 = _dialog displayCtrl BTN4;
_phoneCallList = _dialog displayCtrl PHONE_CALLLIST;
if(_from != PHONE_MAIN) then {
	_number = _this select 1;
	_contact = [_number] call hst_life_phone_functions_fnc_getContact;
	_name = "";
	if((count _contact) == 0) then {
		_name = _number;
	} else {
		_name = (_contact select 1);
	};
	{
		if(hst_life_phone_activeCard == _x select 0) then {
			_array = _x select 1;
			{
				if((_x select 0) == _number || (_x select 1) == _number) then {
					_prefix = "";
					if((_x select 1) == hst_life_phone_activeNumber) then {
						_prefix = "--> : ";
					} else {
						_prefix = "<-- : ";
					};
					_label = _prefix + _name;
					_index = _phoneCallList lbAdd _label;
					_message = _x select 2;
					_phoneCallList lbSetData [_index, _message];
				};
			} forEach _array;
		};
	} forEach hst_life_phone_sms;
} else {
	{
		if(hst_life_phone_activeCard == _x select 0) then {
			_array = _x select 1;
			{
				_number = "";
				_name = "";
				if((_x select 1) == hst_life_phone_activeNumber) then {
				//przychodzace
				_number = _x select 0;
				_name = "--> : ";
				} else {
				//wychodzace
				_number = _x select 1;
				_name = "<-- : ";
				};
				_contact = [_number] call hst_life_phone_functions_fnc_getContact;
				if((count _contact) == 0) then {
					_name = _name + _number;
				} else {
					_name = _name + (_contact select 1);
				};
				_index = _phoneCallList lbAdd _name;
				_message = _x select 2;
				_phoneCallList lbSetData [_index, _message];
			} forEach _array;
		};
	} forEach hst_life_phone_sms;
};
hst_life_phoneDialogMessage_onLBChange = {
	disableSerialization;
	_dialog = findDisplay 61204;
	_ctr = _dialog displayCtrl 3007;
	_ctr2 = _dialog displayCtrl 3005;
	_index = (lbCurSel _ctr2);
	_ctr ctrlSetText (_ctr2 lbData _index);
};
//[] spawn life_fnc_phoneGetActiveNumber;
_phoneCallList ctrlSetEventHandler ["LBSelChanged", "[] spawn hst_life_phoneDialogMessage_onLBChange"];
_phoneCallList lbSetCurSel 0;
