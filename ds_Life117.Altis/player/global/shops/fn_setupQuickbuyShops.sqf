/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in the car shops
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_index","_value","_shopArray","_short"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_dialog = findDisplay 666667;
_btn2 = _dialog displayCtrl 778;
_shopArray = [];

ctrlShow[66653,false];
ctrlShow[778,true];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = [_shop] call DS_fnc_specialShopConfig;
DS_price = _shopArray select 0;
DS_className = _shopArray select 1;

if(DS_atmCoin >= DS_price)then
	{
	_btn2 ctrlEnable true;
	_btn2 ctrlSetText format ["Purchase $%1",[DS_price] call DS_fnc_numberText];
	_btn2 buttonSetAction "[] spawn DS_fnc_buyKit;";
	}
	else
	{
	_btn2 ctrlEnable false;
	_btn2 ctrlSetText "Unavailable";
	};

lbClear _vehicleList;

{
	if(_forEachIndex > 1)then
		{
		_img = _x select 0;
		_img = format ["extras\icons\%1.jpg",_img];
		if([(_x select 0),"bp"] call KRON_StrInStr)then
			{
			_img = "extras\icons\bluePrint.jpg"
			};
		if([(_x select 0),"ammo"] call KRON_StrInStr)then
			{
			_img = "extras\icons\vehAmmo.jpg"
			};
		if([(_x select 0),"gun"] call KRON_StrInStr)then
		{
		_img = "extras\icons\mcuGun.jpg"
		};
		_name = [_x select 0] call DS_fnc_itemStringConfig;
		_toolTip = [_x select 0] call DS_fnc_itemTooltipConfig;
		_vehicleList lbAdd format ["%1x %2",(_x select 1),_name];
		_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
		_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _img];
		_vehicleList lbSetData [(lbSize _vehicleList)-1,_x select 0];
		};
} foreach _shopArray;

