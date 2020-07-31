#include "\hst_life_phone\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_list","_type"];
_id = parseNumber (_this select 0);
if(isNil "_id") exitWith {};
if(_id < 0) exitWith {};
_index = -1;
_array = [];
{
	_cardID = _x select 0;
	if(_id == _cardID) exitWith {
		_array = _x;
		_index = _forEachIndex;
	};
} foreach hst_life_phone_cardsToSell;
if(count _array == 0 || _index == -1) exitWith {hint "Nie ma już takiej karty";};
_price = _array select 3;
_cardID = _array select 0;
if(_array select 6 == 1) then {_price = _price + 10000;};
if(CASH < _price) exitWith {hint "Nie masz wystarczajaco pieniedzy";};
CASH = CASH - _price;
hst_life_phone_cardsToSell set[_index, -1];
hst_life_phone_cardsToSell = hst_life_phone_cardsToSell - [-1];
publicVariable "hst_life_phone_cardsToSell";
hst_life_phone_cards pushBack _array;
[3, _cardID, player, 0] remoteExec ["TON_fnc_cardUpdate", 2];
if(hst_life_phone_activeNumber == "" || hst_life_phone_activeCard == 0) then {
	[_cardID] call hst_life_phone_functions_fnc_changeCard;
};
[0] call SOCK_fnc_updatePartial;