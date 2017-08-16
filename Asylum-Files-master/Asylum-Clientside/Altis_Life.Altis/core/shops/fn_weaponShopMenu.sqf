/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something
*/

private ["_magName","_magConfig","_unit","_config"];

_unit = cursorTarget;
if (isNull _unit) then { _unit = _this select 0; };

if(lineIntersects[eyePos player, aimPos _unit,player,_unit]) exitWith {hint "It would be hard to buy things through the wall, don't you think?"};
if ((vehicle player) != player) exitWith { hint "This action cannot be performed from within a vehicle." };
if ((player distance _unit) > 10) exitWith { hint "You are too far away." };

private["_config","_itemInfo","_itemList"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];

disableSerialization;
if(!(createDialog "life_weapon_shop")) exitwith {};

_config = [_this select 3] call life_fnc_weaponShopCfg;
if(typeName _config == "STRING") exitWith {hint _config; closeDialog 0;};

ctrlSetText[39401,_config select 0];

_itemList = ((findDisplay 39400) displayCtrl 39403);
lbClear _itemList;

{
	_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
	
	_reqDonor = 0;
	{
		if (_itemInfo select 0 == _x select 0) then { _reqDonor = _x select 1 };
	} forEach life_donor_items;
	_lineColor = switch (_reqDonor) do
	{
		case 1: { [0.117, 1, 0, 1] };
		case 2: { [0, 0.44, 1, 1] };
		case 3: { [0.64, 0.207, 0.933, 1] };
		case 4: { [0.64, 0.207, 1, 1] };
		case 5: { [0.9, 0.8, 0.5, 1] };
		default { [1, 1, 1, 1] };
	};
	
	_itemList lbAdd format["%1",if(isNil {_x select 1}) then {_itemInfo select 1} else {_x select 1}];
	_itemList lbSetColor[(lbSize _itemList)-1,_lineColor];
	_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
	_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
	_price = _x select 2;
	//_price = _price - (((life_donator * 4) / 100) * _price);
	_qty = (_itemInfo select 0) call life_fnc_getQuantity;
	if (playerSide in [west,independent]) then { _qty = -1; };
	_price = [_itemInfo select 0,_price,_qty] call life_fnc_calcPrice;
	if (_qty == 0) then { _price = _price * 1.25 };
	if ((life_configuration select 3) > 0) then { _price = round (_price + (_price * ((life_configuration select 3) / 100))); };
	_point = life_capture_list select 0;
	_armsDealer = ((_point select 1) != "0" && (_point select 1) == life_gang && (_point select 2) == 1);
	_turfOwned = 0;
	{ if (_x select 1 == life_gang) then { _turfOwned = _turfOwned + 1; } } foreach life_turf_list;
	if (_armsDealer) then { _price = _price * 0.85 };
	if (_turfOwned > 1) then { _price = _price * 0.75 };
	if (_this select 3 == "rebel" && 3 in life_gangtalents) then { _price = _price * 0.95; };
	_itemList lbSetValue[(lbSize _itemList)-1,_price];
} foreach (_config select 1);

((findDisplay 39400) displayCtrl 39405) ctrlSetText "Buy";
