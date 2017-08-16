#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name","_marketprice"];
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {};
life_nottoofast = time;

if(life_shop_type == "labor" && !((vehicle player) isKindOf "ship")) exitWith {hint "Du kannst dies nur über ein Boot verkaufen!"};

if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
//_index = [_type,__GETC__(sell_array)] call SOA_fnc_index;
_price = [_type,playerside] call life_fnc_classPrices;
if(_price == -1) exitWith {};
_price = _price/2;

//_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call life_fnc_varHandle;
_marketprice = [_type] call life_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};

_amount = ctrlText 2405;
if(!([_amount] call SOA_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum"};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {["Oh nein!",localize "STR_Shop_Virt_NotEnough","#ff1000","#ffffff",4] call life_fnc_texttiles;};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;

if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	["Yeah!",format [localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;
	life_beatgeld = life_beatgeld + _price;
	if(_marketprice != -1) then 
	{ 
		[_type, _amount] spawn
		{
			sleep 120;
			[_this select 0,_this select 1] call life_fnc_marketSell;
		};
	};
	[] call life_fnc_virt_update;
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call SOA_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

if(_var == "life_inv_goldbar" && !erfolg_bankraub) then {erfolg_bankraub = true; ["erfolg_bankraub"] spawn life_fnc_erfolgerhalten;};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;