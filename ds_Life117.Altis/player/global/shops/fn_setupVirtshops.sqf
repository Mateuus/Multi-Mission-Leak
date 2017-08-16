/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in the car shops
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_index","_value","_shopArray","_short"];

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_shopArray = [];

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = [_shop] call DS_fnc_virtShopConfig;

lbClear _vehicleList;

{
	_index = [_x] call DS_fnc_itemIndex;
	_price = DS_buyArray select _index;
	_weight = [_x,1] call DS_fnc_itemWeight;
	_name = [_x] call DS_fnc_itemStringConfig;
	_img = format ["extras\icons\%1.jpg",_x];
	if([_x,"bp"] call KRON_StrInStr)then
		{
		_img = "extras\icons\bluePrint.jpg"
		};
	if([_x,"ammo"] call KRON_StrInStr)then
		{
		_img = "extras\icons\vehAmmo.jpg"
		};
	if([_x,"gun"] call KRON_StrInStr)then
		{
		_img = "extras\icons\mcuGun.jpg"
		};
	_toolTip = [_x] call DS_fnc_itemTooltipConfig;
	_vehicleList lbAdd format ["%1",_name];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _img];
	if(DS_coin >= _price)then
		{
		_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
		}
		else
		{
		_vehicleList lbSetColor [(lbSize _vehicleList)-1, [1, 0, 0, 0.5]];
		};
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_x];
} foreach _shopArray;

sleep 0.2;
DS_doingStuff = false;