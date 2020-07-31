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
#define PHONE_CALL 3001
#define PHONE_CONTACTS 3002
#define PHONE_MESSAGES 3003
#define PHONE_REJECT 3004
disableSerialization;
private [];

if(!alive player || dialog) exitWith {};
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};
if(!(createDialog "hst_life_phone_main")) exitWith {};
//if(HANDCUFFED(player) || ISSURRENDERED(player)) exitWith {}; //ace check if player has his hands free
//if(ISUNCONSCIOUS(player)) exitWith {}; //ace check if player is unconscious
_dialog = findDisplay 61201;
_phoneNumber = _dialog displayCtrl NUMBER;
_phoneEvent = _dialog displayCtrl 3007;
_phoneTitle = _dialog displayCtrl 3006;
_phoneInput = _dialog displayCtrl 3005;
_phoneCall = _dialog displayCtrl PHONE_CALL;
_phoneReject = _dialog displayCtrl PHONE_REJECT;
_phoneMessages = _dialog displayCtrl PHONE_MESSAGES;
_phoneContacts = _dialog displayCtrl PHONE_CONTACTS;
[] spawn hst_life_phone_functions_fnc_getActiveNumber;
if(hst_life_phone_activeNumber != "") then {
	if(hst_life_phone_beingCalled) then {
		_phoneMessages ctrlEnable false;
		_phoneContacts ctrlEnable false;
		_phoneEvent ctrlSetText hst_life_phone_caller;
		_phoneTitle ctrlSetText "Połączenie przychodzące:";
		_phoneTitle ctrlSetFontHeight 0.04;
		
	} else {
		_phoneNumber ctrlSetText hst_life_phone_activeNumber;
		_str = "";
		if(hst_life_phone_newMessages == 0) then {
			_str = "Nie masz nowych wiadomosci.\n";
		} else { 
			if(hst_life_phone_newMessages < 2) then {
				_str = "Masz 1 nowy SMS.\n";
			} else {
				if(hst_life_phone_newMessages < 5) then {
					_str = format["Masz %1 nowe SMS.\n", hst_life_phone_newMessages];
				} else {
					_str = format["Masz %1 nowych SMS.\n", hst_life_phone_newMessages];
				};
			};
		};
		if(hst_life_phone_newCalls == 0) then {
			_str = _str + "";
		} else { 
			if(hst_life_phone_newCalls < 2) then {
				_str = _str + "Masz 1 nieodebrane polaczenie.\n";
			} else {
				if(hst_life_phone_newCalls < 5) then {
					_str = _str + format["Masz %1 nieodebrane polaczenia.\n", hst_life_phone_newCalls];
				} else {
					_str = _str + format["Masz %1 nieodebranych polaczen.\n", hst_life_phone_newCalls];
				};
			};
	};
		_phoneEvent ctrlSetText _str;
	};
} else {
	_phoneNumber ctrlSetText "Brak numeru";
	_phoneEvent ctrlSetText "Musisz kupic badz aktywowac karte,\njezeli chcesz uzywac telefonu.";
};
