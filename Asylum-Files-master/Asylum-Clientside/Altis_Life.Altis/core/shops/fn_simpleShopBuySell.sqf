/*
	File: fn_simpleShopBuySell.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
private["_price","_item","_itemInfo","_bad","_exit","_qty"];
if((lbCurSel 38403) == -1) exitWith {hint "You need to select an item to buy/sell."};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;

_bad = "";
_exit = false;

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item)) exitWith {_bad = "You don't have enough room for that item."};
	};
};

if(_bad != "") exitWith {hint _bad};

//_price = _price - (((life_donator * 4) / 100) * _price);
//[[95, player, format["Bought a %1 for %2", _itemInfo select 1, _price]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

if ((uiNamespace getVariable ["Weapon_Shop", ""]) == "rebel") then
{
	_point = life_capture_list select 0;
	_armsDealer = ((_point select 1) != "0" && (_point select 1) == life_gang && (_point select 2) == 1);
	_turfOwned = 0;
	{ if (_x select 1 == life_gang) then { _turfOwned = _turfOwned + 1; } } foreach life_turf_list;
	if (_armsDealer && _turfOwned > 1) then { _price = _price * 0.60 }
	else
	{
		if (_armsDealer || _turfOwned > 1) then { _price = _price * 0.75 };
	};
	if (life_money < _price) exitWith {_exit=true;hint format["You do not have enough cash on you to pay for this.  You need $%1.", _price]};
	["cash","take",_price] call life_fnc_uC;
}
else
{
	if(!([_price] call life_fnc_debitCard)) exitWith {_exit=true;};
};
if (_exit) exitWith {};

_hint = format["You bought a %1 for <t color='#8cff9b'>$%2</t>",_itemInfo select 1,[_price] call life_fnc_numberText];

_qty = _item call life_fnc_getQuantity;
if (playerSide in [west,independent]) then { _qty = -1; };
if (_qty > -1) then
{
	((findDisplay 38400) displayCtrl 38405) ctrlEnable false;
	[_item, _hint, _price] spawn
	{
		_item = _this select 0;
		_hint = _this select 1;
		_price = _this select 2;
		life_approved = nil;
		life_stock_update = [_item, -1, player];
		publicVariableServer "life_stock_update";
		waitUntil {!isNil "life_approved"};
		if (!life_approved) then { _price = _price * 1.25 };
		((findDisplay 38400) displayCtrl 38405) ctrlEnable true;
		[_item,true,false,true,false] call life_fnc_handleItem;
		hint parseText _hint;
		PlaySound "purchase";
	};
}
else
{
	[_item,true,false,true,false] call life_fnc_handleItem;
	hint parseText _hint;
	PlaySound "purchase";
};

if(playerSide == west) then
{
	[] call life_fnc_saveGear;
};