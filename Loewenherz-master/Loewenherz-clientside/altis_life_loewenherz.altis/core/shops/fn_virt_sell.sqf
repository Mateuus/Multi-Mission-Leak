#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call TON_fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call lhm_fnc_varHandle;
// LHM Market
_marketprice = [_type] call lhm_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
// LHM Market
_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = [_var] call lhm_fnc_vartostr;
if(([false,_type,_amount] call lhm_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call lhm_fnc_numberText];
	lhm_cash = lhm_cash + _price;
	// LHM Market
	if(_marketprice != -1) then 
    { 
        [_type, _amount] spawn
        {
            sleep 60;
            [_this select 0,_this select 1] call lhm_fnc_marketSell;
            [[_this select 0,_this select 1],"lhm_fnc_marketInsertTimes",false,false] call lhm_fnc_mp; // Sends the shortname and amount of the sold item to the server
        };
        [] call lhm_fnc_virt_update; 
    };
	// LHM Market
	[] call lhm_fnc_virt_update;
	
};

if(lhm_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = lhm_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		lhm_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		lhm_shop_npc setVariable["sellers",_array,true];
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
