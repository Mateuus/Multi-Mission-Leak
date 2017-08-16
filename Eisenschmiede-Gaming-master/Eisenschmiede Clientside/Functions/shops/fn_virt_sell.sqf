#include "..\script_macros.hpp"
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_amount","_name"];
if(EQUAL(lbCurSel 2402,-1)) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];

_price = 0.0;
_itemNameToSearchFor = _type;
{
	_curItemName = _x select 0;
	_curItemPrice = _x select 1;
	if (_curItemName==_itemNameToSearchFor) then {_price=_curItemPrice};
} forEach DYNMARKET_prices;

//_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");
if(EQUAL(_price,-1)) exitWith {};

_amount = ctrlText 2405;
if(!([_amount] call ES_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (ITEM_VALUE(_type))) exitWith {hint localize "STR_Shop_Virt_NotEnough"};
if((time - ES_action_delay) < 0.5) exitWith {hint localize "STR_NOTF_ActionDelay";};
ES_action_delay = time;

_price = (_price * _amount);
_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
if(([false,_type,_amount] call ES_fnc_handleInv)) then {
	hint format[localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call ES_fnc_numberText];
	ES_cash = ES_cash + _price;
	["VirtualItemverkaufen"] call ES_fnc_xp_add;
	[] call ES_fnc_virt_update;	
	DYNAMICMARKET_boughtItems pushBack [_type,_amount];
	[["VIRTUALSHOPSELL_LOG",[""], player getVariable["realname",name player], getPlayerUID player, (localize _name), _amount, [_price] call ES_fnc_numberText],"ES_fnc_logXP",false,false] call ES_fnc_MP;
};

if(EQUAL(ES_shop_type,"drugdealer")) then {
	private["_array","_ind","_val"];
	_array = ES_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call ES_fnc_index;
	if(!(EQUAL(_ind,-1))) then {
		_val = SEL(SEL(_array,_ind),2);
		_val = _val + _price;

		_array set[_ind,[getPlayerUID player,profileName,_val]];
		ES_shop_npc setVariable["sellers",_array,true];
	} else {
		_array pushBack [getPlayerUID player,profileName,_price];
		ES_shop_npc setVariable["sellers",_array,true];
	};
};

if(EQUAL(ES_shop_type,"gold") && (ES_SETTINGS(getNumber,"noatm_timer")) > 0) then {
	[] spawn {
		ES_use_atm = false;
		sleep ((ES_SETTINGS(getNumber,"noatm_timer")) * 60);
		ES_use_atm = true;
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;