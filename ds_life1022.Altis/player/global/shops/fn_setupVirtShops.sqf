/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the car shops
*/

private ["_shop","_dialog","_list","_shopArray","_mine","_noImg","_index","_price","_img","_name","_tooltip"];

disableSerialization;

if(DS_doingStuff)exitWith{};
DS_doingStuff = true;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_shopArray = [];
_mine = false;
if(_shop in [54])then{_mine = []call DS_civ_myHideout;};
if((_shop in [54])&&(!_mine))exitWith{hint "You need to own this hideout to buy items here\n\nCreate a gang and capture the area at the flag outside";DS_doingStuff = false;};
_noImg = ["houseItemUpgrade","houseWeaponUpgrade","jail10","safeCrackerAdv","jailBreak","steroids","noRecoil","quickCap","packCPU","packBattery","packCircuitBoard","packGlass","packBronze","packSteel","pawnee","convoy","idChanger","bones","blackfoot","armourAdv","insurance","airBags"];

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [_shop] call DS_fnc_virtShopConfig;

lbClear _list;

{
	_index = [_x] call DS_fnc_itemIndex;
	_price = DS_buyArray select _index;
	_img = format ["extras\icons\%1.jpg",_x];
	if([_x,"bp"] call DS_fnc_strInStr)then{_img = "extras\icons\bluePrint.jpg"};
	if([_x,"ammo"] call DS_fnc_strInStr)then{_img = "extras\icons\vehAmmo.jpg"};
	if([_x,"gun"] call DS_fnc_strInStr)then{_img = "extras\icons\mcuGun.jpg"};
	if(_x in _noImg)then{_img = ""};

	_name = [_x] call DS_fnc_itemStringConfig;
	_tooltip = [_x] call DS_fnc_itemTooltipConfig;

	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_tooltip];
	if(DS_coin >= _price)then {
		_list lbSetColor [_index,[0,1,0,0.5]];
	} else {
		_list lbSetColor [_index,[1,0,0,0.5]];
	};
	_list lbSetData [_index,_x];
	if(!(_img isEqualTo ""))then{_list lbSetPicture [_index,_img];};
} foreach _shopArray;

sleep 0.2;
DS_doingStuff = false;