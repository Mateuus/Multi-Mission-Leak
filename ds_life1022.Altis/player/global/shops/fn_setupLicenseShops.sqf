/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the license shops
*/

private ["_shop","_dialog","_list","_shopArray","_className","_price","_img","_name","_tooltip","_index"];

disableSerialization;

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [_shop] call DS_fnc_licenseShopConfig;

lbClear _list;

{
	_className = (_x select 0);
	_price = (_x select 1);
	_img = (_x select 2);
	_img = format ["extras\icons\%1.jpg",_img];
	_name = (_x select 3);
	_tooltip = (_x select 4);

	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetPicture [_index,_img];
	if((DS_coin >= _price)||(_price isEqualTo 999))then {
		_list lbSetColor [_index,[0,1,0,0.5]];
	} else {
		_list lbSetColor [_index,[1,0,0,0.5]];
	};
	_list lbSetData [_index,_className];
} forEach _shopArray;

sleep 0.2;
DS_doingStuff = false;