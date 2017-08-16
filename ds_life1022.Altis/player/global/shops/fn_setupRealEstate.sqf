/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up realEstate shop
*/

private ["_shop","_dialog","_list","_shopArray","_name","_price","_rent","_tooltip","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [] call DS_fnc_realestateConfig;

lbClear _list;

{
	_name = (_x select 0);
	_price = (_x select 1);
	_rent = (_x select 2);
	if(_price isEqualTo 666)then {
		_tooltip = "Price: $10m + Items (Click for more info)";
	} else {
		_tooltip = format ["Price $%1 || Rental Payments $%2",[(_x select 1)] call DS_fnc_numberText,[(_x select 2)] call DS_fnc_numberText];
	};

	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index, _tooltip];
	if(DS_atmCoin >= _price)then {
		_list lbSetColor [_index,[0,1,0,0.5]];
	} else {
		_list lbSetColor [_index,[1,0,0,0.5]];
	};
	_list lbSetData [_index,format ["%1",_forEachIndex]];
} forEach _shopArray;