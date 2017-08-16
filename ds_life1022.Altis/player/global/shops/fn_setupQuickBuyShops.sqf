/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the car shops
*/

private ["_shop","_dialog","_list","_btn2","_shopArray","_noImg","_item","_img","_name","_tooltip","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_btn2 = _dialog displayCtrl 778;
_shopArray = [];
_noImg = ["houseItemUpgrade","houseWeaponUpgrade","jail10","safeCrackerAdv","jailBreak","steroids","noRecoil","quickCap","packCPU","packBattery","packCircuitBoard","packGlass","packBronze","packSteel","pawnee","convoy","idChanger","bones","blackfoot","armourAdv","insurance","airBags"];

ctrlShow [66653,false];
ctrlShow [778,true];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [_shop] call DS_fnc_specialShopConfig;
DS_price = _shopArray select 0;
DS_className = _shopArray select 1;

if(DS_atmCoin >= DS_price)then {
	_btn2 ctrlEnable true;
	_btn2 ctrlSetText format ["Purchase $%1",[DS_price] call DS_fnc_numberText];
	_btn2 buttonSetAction "[] spawn DS_fnc_buyKit;";
} else {
	_btn2 ctrlEnable false;
	_btn2 ctrlSetText "Unavailable";
};

lbClear _list;

{
	if(_forEachIndex > 1)then {
		_item = _x select 0;
		_img = format ["extras\icons\%1.jpg",_item];
		if([_item,"bp"] call DS_fnc_strInStr)then{_img = "extras\icons\bluePrint.jpg"};
		if([_item,"ammo"] call DS_fnc_strInStr)then{_img = "extras\icons\vehAmmo.jpg"};
		if([_item,"gun"] call DS_fnc_strInStr)then{_img = "extras\icons\mcuGun.jpg"};
		if(_item in _noImg)then{_img = ""};

		_name = [_item] call DS_fnc_itemStringConfig;
		_tooltip = [_item] call DS_fnc_itemTooltipConfig;

		_index = _list lbAdd format ["%1x %2",(_x select 1),_name];
		_list lbSetTooltip [_index,_tooltip];
		_list lbSetData [_index,_item];
		if(!(_img isEqualTo ""))then{_list lbSetPicture [_index,_img];};
	};
} forEach _shopArray;