#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name","_marketprice"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];

_index = [_type,__GETC__(sell_array)] call TEX_fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call tanoarpg_fnc_varHandle;

////Marktsystem Anfang////
_marketprice = [_type] call tanoarpg_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
////Marktsystem Ende////

if(playerSide == independent) then
{
	if(_type == "kidney") then
	{
		_price = 20;
	};
	
	if(_type == "defibrilator") then
	{
		_price = 20;
	};
};

if(playerSide == west) then
{
	if(_type == "defibrilator") then
	{
		_price = 70;
	};
};

_amount = ctrlText 2405;
if(!([_amount] call TEX_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = [_var] call tanoarpg_fnc_vartostr;
if(([false,_type,_amount] call tanoarpg_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call tanoarpg_fnc_numberText];
	life_cash = life_cash + _price;
	
	////Marktsystem Anfang////
	if(_marketprice != -1) then
	{
		[_type, _amount] spawn
		{
			sleep 240;
			[_this select 0,_this select 1] call tanoarpg_fnc_marketSell;
		};
	};
	////Marktsystem Ende////
	
	[] call tanoarpg_fnc_virt_update;
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TEX_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array set[count _array,[getPlayerUID player,profileName,_price]];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

[0] call XAS_fnc_updatePartial;
[3] call XAS_fnc_updatePartial;
[player, player, _price, format["VIRTITEMSELL|%1",_type], life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];

//ANTISPAM
closeDialog 0;