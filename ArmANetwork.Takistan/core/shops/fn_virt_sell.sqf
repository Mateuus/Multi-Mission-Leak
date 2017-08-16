#include <macro.h>

/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sell a virtual item to the store / shop
*/

if(EAL_sellSpamTries >= 3) then {  [[profileName,format["DANGEROUS AUTO CLICK FILE ACCESS IN::->fn_virt_sell.sqf. --- Number Of Times Accessed While On a Half Second Cool Down: %1",EAL_sellSpamTries]],"SPY_fnc_tellAdmins",true,false] call life_fnc_MP; };

if(!EAL_canSell) exitWith {EAL_sellSpamTries = EAL_sellSpamTries +1; hint "You are trying to sell items more than once per half second!"; closeDialog 0;};
if(EAL_canSell) then {
    EAL_canSell = false;
    [] spawn { sleep 0.4; EAL_canSell = true; EAL_sellSpamTries = 0;};
};

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

if(EQUAL(_price,-1)) exitWith {};

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

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;
