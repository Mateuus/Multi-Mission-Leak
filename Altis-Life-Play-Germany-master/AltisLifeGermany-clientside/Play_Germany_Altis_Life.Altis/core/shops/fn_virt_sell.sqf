#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_amount","_name","_curItemName","_curItemPrice"];
if(EQUAL(lbCurSel 2402,-1)) exitWith {};
if (life_shop_type == "evidence" && playerSide != west) exitWith {};
if (life_shop_type != "evidence" && playerSide != civilian) exitWith {};

_type = lbData[2402,(lbCurSel 2402)];

// <DYNMARKET
_price = -1;
{
    _curItemName = SEL(_x, 0);
    _curItemPrice = SEL(_x, 1);
    if (EQUAL(_curItemName, _type)) then {_price=_curItemPrice};
} forEach DYNMARKET_prices;

if(EQUAL(_price,-1)) then {
	_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");
};

// DYNMARKET>

if(EQUAL(_price,-1)) exitWith {};

_normalprice = (M_CONFIG(getNumber,"VirtualItems",_type,"buyPrice"));
if(_price > (_normalprice * PG_donGoalMulti) && _normalprice > -1) then {
	_price = (_normalprice * PG_donGoalMulti);
};

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (ITEM_VALUE(_type))) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
if(([false,_type,_amount] call life_fnc_handleInv)) then {
	hint format[localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call life_fnc_numberText];
	ADD(CASH,_price);
	[] call life_fnc_virt_update;
    DYNAMICMARKET_boughtItems pushBack [_type,_amount];
};

if(EQUAL(life_shop_type,"drugdealer")) then {
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(!(EQUAL(_ind,-1))) then {
		_val = SEL(SEL(_array,_ind),2);
		ADD(_val,_price);
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	} else {
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};
[] call life_fnc_hudUpdate;