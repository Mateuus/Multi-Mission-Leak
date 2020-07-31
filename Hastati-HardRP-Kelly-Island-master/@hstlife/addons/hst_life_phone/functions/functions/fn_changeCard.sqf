#include "..\..\script_macros.hpp"
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
_card = _this select 0;
if(isNil "hst_life_phone_activeNumber") then {hst_life_phone_activeNumber = "";};
if(_card == 0) exitWith {
	hst_life_phone_activeCard = 0;
	hst_life_phone_activeNumber = "";
	hst_life_phone_activeCardSaldo = 0;
	hst_life_phone_activeCardSMS = 0;
	hst_life_phone_activeCardCall = 0;
	if(isNil "hst_life_phone_numbers") then {
		hst_life_phone_numbers = [];
	} else {
		{
			if((_x select 0) == (getPlayerUID player)) then {
				hst_life_phone_numbers set [_forEachIndex, -1];
				hst_life_phone_numbers = hst_life_phone_numbers - [-1];
			};
		} forEach hst_life_phone_numbers;
	};
	publicVariable "hst_life_phone_numbers";
};
if(hst_life_phone_activeNumber != "") then {
	{
		if(_x select 0 == hst_life_phone_activeCard) exitWith {
			_x set [3, hst_life_phone_activeCardSaldo];
			[0,hst_life_phone_activeCard] spawn hst_life_phone_functions_fnc_cardUpdate;
		};
	} forEach hst_life_phone_cards;
};
{
	if(_x select 0 == _card) exitWith {
		hst_life_phone_activeCard = _card;
		hst_life_phone_activeNumber = _x select 1;
		hst_life_phone_activeCardSaldo = _x select 3;
		hst_life_phone_activeCardSMS = _x select 4;
		hst_life_phone_activeCardCall = _x select 5;
		[1,_card] spawn hst_life_phone_functions_fnc_cardUpdate;
	};
} forEach hst_life_phone_cards;

if(isNil "hst_life_phone_numbers") then {
	hst_life_phone_numbers = [];
	hst_life_phone_numbers pushBack [getPlayerUID player, hst_life_phone_activeNumber, player];
	publicVariable "hst_life_phone_numbers";
} else {
	_active = false;
	{
		if((_x select 0) == (getPlayerUID player)) exitWith {
			_x set [1, hst_life_phone_activeNumber];
			_x set [2, player];
			_active = true;
		};
	} forEach hst_life_phone_numbers;
	if(!_active) then {hst_life_phone_numbers pushBack [getPlayerUID player, hst_life_phone_activeNumber, player];};
	publicVariable "hst_life_phone_numbers";
};