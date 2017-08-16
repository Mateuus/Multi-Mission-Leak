#include "..\..\script_macros.hpp"
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_amount","_name","_sellall"];
_sellall = [_this,0,false,[true]] call BIS_fnc_param;
if(EQUAL(lbCurSel 2402,-1)) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];

_price = 0.0;
_itemNameToSearchFor = _type;
{
	_curItemName = _x select 0;
	_curItemPrice = _x select 1;
	if (_curItemName==_itemNameToSearchFor) then {_price=_curItemPrice};
} forEach DYNMARKET_prices;

//_price = [_type] call life_fnc_DYNMARKET_getPrice;
//_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");
if(EQUAL(_price,-1)) exitWith {};

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint  "Du hast keine echte Zahl eingegeben";};
_amount = parseNumber (_amount);
if (_sellall) then {_amount = (ITEM_VALUE(_type))};
if(_amount > (ITEM_VALUE(_type))) exitWith {hint  "Du hast nicht so viele Gegenstände zum Verkaufen!"};
if((time - life_action_delay) < 0.2) exitWith {hint  "Du führst bereits eine Aktion aus. Bitte warte, bis diese beendet ist.Delay";};
life_action_delay = time;

_price = (_price * _amount);
_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
if(([false,_type,_amount] call life_fnc_handleInv)) then {
	hint format[ "Du verkaufst %1 %2 für $%3",_amount,( _name),[_price] call life_fnc_numberText];
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

if(EQUAL(life_shop_type,"gold") && (LIFE_SETTINGS(getNumber,"noatm_timer")) > 0) then {
	[] spawn {
		life_use_atm = false;
		sleep ((LIFE_SETTINGS(getNumber,"noatm_timer")) * 60);
		life_use_atm = true;
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
