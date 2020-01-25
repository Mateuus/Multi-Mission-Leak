#include "..\..\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_market","_type"];
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "life_tablet_market";

disableSerialization;
waitUntil {!isNull findDisplay 61302};
_display = findDisplay 61302;
_market = _display displayCtrl 3001;
if(FETCH_CONST(life_adminlevel) < 4) then {
	ctrlShow[3003, false];
	ctrlShow[3004, false];
	ctrlShow[3005, false];
	ctrlShow[3006, false];

};
lbClear _market;
{
	_name = localize (getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName"));
	_price = _x select 1;
	_text = "";
	_quantity = _x select 5;
	_maxQuantity = _x select 6;
	_str = "";
	switch(true) do {
		case(_quantity == 0): {_text = "Ogromny";};
		case(_quantity < (_maxQuantity / 10)): {_text = "Bardzo wysoki";};
		case(_quantity < (_maxQuantity / 4)): {_text = "Wysoki";};
		case(_quantity < (_maxQuantity / 2)): {_text = "Normalny";};
		case(_quantity < ((_maxQuantity / 4) * 3)): {_text = "Niski";};
		case(_quantity < ((_maxQuantity / 10) * 9)): {_text = "Bardzo niski";};
		case(_quantity == _maxQuantity): {_text = "Brak";};
	};
	_str = format ["%1\nCena: $%2\nPopyt: %3", _name, _price, _text];
	_index = _market lbAdd format["%1",_name, _price, _text];
	_market lbSetData [_index, _str];
} foreach life_marketItems;

life_fnc_marketView_onLBChange = {
	disableSerialization;
	_dialog = findDisplay 61302;
	_ctr = _dialog displayCtrl 3002;
	_ctr2 = _dialog displayCtrl 3001;
	_index = (lbCurSel _ctr2);
	_ctr ctrlSetText (_ctr2 lbData _index);
};
//[] spawn life_fnc_phoneGetActiveNumber;
_market ctrlSetEventHandler ["LBSelChanged", "[] spawn life_fnc_marketView_onLBChange"];
_market lbSetCurSel 0;