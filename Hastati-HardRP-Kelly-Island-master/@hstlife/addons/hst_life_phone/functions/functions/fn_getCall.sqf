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
_from = _this select 0;
_freq = _this select 1;
_fromObj = _this select 2;
_target = _this select 3;
diag_log "----------------------- life_fnc_phoneGetCall";
if(call TFAR_fnc_haveSWRadio) exitWith {hint "Nie masz telefonu"};
if(_target != player) exitWith {};
if(hst_life_phone_beingCalled || hst_life_phone_calling || hst_life_phone_inCall) exitWith {msg("Debug");[_from, hst_life_phone_activeNumber, (getPos _fromObj), _fromObj, 3, _freq] remoteExec ["TON_fnc_callInsert", 2];};

hst_life_phone_beingCalled = true;
hst_life_phone_calling = false;
hst_life_phone_inCall = false;
_contact = [_from] call hst_life_phone_functions_fnc_getContact;
_fromName = "";
if(count _contact != 0) then {_fromName = _contact select 1;} else {_fromName = _from;};
hint format["Dzwoni do Ciebie: %1\n",_fromName];
hst_life_phone_caller = _from;
[_freq,_fromObj] spawn {
	_freq = _this select 0;
	_fromObj = _this select 1;
	_k = 0;
	hst_life_phone_answered = 0;
	while {_k < 10 && hst_life_phone_answered == 0} do {
		uiSleep 0.5;
		if(_k % 4 == 0 || _k == 0) then {
			player say3D ["phoneRingtone", 50];
			playSound "phoneRingtone";
		};
		_k = _k + 0.5;
	};
	if(hst_life_phone_answered != 0) exitWith {
		if(hst_life_phone_answered == 1) then {
			msg("Rozmawiasz teraz");
			_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
			_channel = _channel + 1;
			hst_life_phone_activeFrequency = _freq;
			[(call TFAR_fnc_activeSwRadio), _channel, _freq] call TFAR_fnc_SetChannelFrequency;
			hst_life_phone_inCall = true;
			hst_life_phone_beingCalled = false;
			[] spawn life_fnc_phoneHandleCall;
			//setFreq
		};
		if(hst_life_phone_answered == 2) then {msg("Odrzuciles polaczenie"); hst_life_phone_beingCalled = false;};
		if(hst_life_phone_answered == 3) then {msg("Wyslano sygnal - zajety"); hst_life_phone_beingCalled = false;};
		[_from, hst_life_phone_activeNumber, (getPos _fromObj), _fromObj, hst_life_phone_answered, _freq] remoteExec ["TON_fnc_callInsert", 2];
	};
	if(hst_life_phone_answered == 0) then {hint "Nie odebrales polaczenia."; hst_life_phone_beingCalled = false;};
	hst_life_phone_caller = "";
};