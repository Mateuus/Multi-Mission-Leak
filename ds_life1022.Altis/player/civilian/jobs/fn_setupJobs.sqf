/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the jobs center
*/

private ["_shop","_dialog","_list","_shopArray","_className","_img","_name","_tooltip","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_shopArray = [];

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [
	["Fuel Delivery Job","refuelKit","With your own truck, deliver fuel around Altis to lower the price and get paid","fuel"],
	["Pilot Cargo Job","airShop","With your own chopper, pick up and deliver Cargo around Altis","pilot"],
	["Truck Driver Job","truckShop","Pay a deposit and drive a truck and its cargo to its drop point","truck"]
];

lbClear _list;

{
	_className = (_x select 3);
	_img = format ["extras\icons\%1.jpg",(_x select 1)];
	_name = (_x select 0);
	_tooltip = (_x select 2);
	
	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetPicture [_index,_img];
	_list lbSetColor [_index,[0,1,0,0.5]];
	_list lbSetData [_index,_className];
} forEach _shopArray;