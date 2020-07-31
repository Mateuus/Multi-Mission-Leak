#include "\hst_life_phone\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_list","_type"];
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "hst_life_phone_simcards";

disableSerialization;
waitUntil {!isNull findDisplay 61304};
_display = findDisplay 61304;
_list = _display displayCtrl 3001;
if(FETCH_CONST(life_adminlevel) < 4) then {
	ctrlShow[3004, false];
};
lbClear _list;
{
	_id = _x select 0;
	_number = _x select 1;
	_companyID = _x select 2;
	_index = _list lbAdd _number;
	_list lbSetData [_index, str(_id)];
	
} foreach hst_life_phone_cardsToSell;

hst_life_fnc_phoneSimCardsDialog_onLBChange = {
	disableSerialization;
	_dialog = findDisplay 61304;
	_ctr = _dialog displayCtrl 3002;
	_ctr2 = _dialog displayCtrl 3001;
	_index = (lbCurSel _ctr2);
	_data = (_ctr2 lbData _index);
	_cardID = parseNumber _data;
	{
		_id = _x select 0;
		if(_id == _cardID) exitWith {
			_number = _x select 1;
			_companyID = _x select 2;
			_saldo = _x select 3;
			_smsPrice = _x select 4;
			_minutePrice = _x select 5;
			_isPermament = _x select 6;
			_price = _saldo;
			if(_isPermament == 1) then {_isPermament = "Tak"; _price = _price + 10000;} else {_isPermament = "Nie";};
			_str = format ["Numer: %1\nFirma: %2\nSaldo: $%3\nCena za SMS: $%4\n Cena za minute: $%5\nUbezpieczona: %6\n Cena: $%7", _number, _companyID, _saldo, _smsPrice, _minutePrice, _isPermament, _price];
			_ctr ctrlSetText _str;
		};
	} foreach hst_life_phone_cardsToSell;
};
//[] spawn life_fnc_phoneGetActiveNumber;
_list ctrlSetEventHandler ["LBSelChanged", "[] spawn hst_life_fnc_phoneSimCardsDialog_onLBChange"];
_list lbSetCurSel 0;