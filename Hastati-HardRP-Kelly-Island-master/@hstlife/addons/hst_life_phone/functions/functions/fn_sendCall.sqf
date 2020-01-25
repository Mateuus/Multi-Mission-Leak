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
diag_log "----------------------- hst_life_phone_functions_fnc_sendCall";

if(_radio == "") exitWith {hint "Nie masz telefonu";};
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};


_targetNumber = _this select 0;
if(hst_life_phone_beingCalled || hst_life_phone_calling || hst_life_phone_inCall) exitWith {msg("Debug");}; //check if calling or being called



if(hst_life_phone_activeNumber == "") exitWith {msg("Nie masz karty SIM")};
if(_targetNumber == "") exitWith {msg("Nie wpisano numeru.")};
IF(_targetNumber == hst_life_phone_activeNumber) exitWith {msg("Nie mozesz zadzwonic do siebie.");};
_targetArray = [_targetNumber] call hst_life_phone_functions_fnc_checkNumber;
_obj = _targetArray select 2;
if(count _targetArray == 0) exitWith {msg("Numer nie jest aktywny.")};
if(hst_life_phone_activeCardSaldo < 0) exitWith {msg("Nie masz srodkow na koncie.  ");};
hst_life_phone_answered = 0;
hst_life_phone_beingCalled = false;
hst_life_phone_calling = true;
hst_life_phone_inCall = false;
_freq = hst_life_phone_activeNumber + ".5";
hst_life_phone_activeFrequency = _freq;

[hst_life_phone_activeNumber, _freq, player, _obj] remoteExec ["TON_fnc_sendCall", 2];
_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, _freq] call TFAR_fnc_SetChannelFrequency;
[] spawn {
	_k = 0;
	while {_k < 10 && hst_life_phone_answered == 0} do {
		uiSleep 0.5;
		if(_k % 4 == 0 || _k == 0) then {
			playSound "phoneDial";
		};
		_k = _k + 0.5;
	};
	if(hst_life_phone_answered != 0) exitWith {
		if(hst_life_phone_answered == 1) then {
			msg("Rozmawiasz teraz"); 
			hst_life_phone_calling = false;
		};
		if(hst_life_phone_answered == 2) then {msg("Kontakt odrzucil polaczenie"); playSound "phoneBusy"; hst_life_phone_calling = false;};
		if(hst_life_phone_answered == 3) then {msg("Kontakt jest zajety"); playSound "phoneBusy"; hst_life_phone_calling = false;};
	};
	if(hst_life_phone_answered == 0) then {hint "Kontakt nie odebral polaczenia."; hst_life_phone_calling = false;};
};