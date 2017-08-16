#include "..\..\macros.hpp"
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sell a virtual item to the store / shop
*/
private ["_type","_index","_price","_amount","_name","_var","_isIllegalTraderCaptured","_icon","_icon1","_illegalShops","_illegalItem","_isIllegal"];
if (isNil "DWEV_virtBuyInUse") then {DWEV_virtBuyInUse = false;};
if (DWEV_virtBuyInUse) exitWith {hint "Du kannst nicht so schnell verkaufen! Lass dir etwas Zeit oder gib unten die gewünschte Anzahl ein";};
if ((lbCurSel 2402) isEqualTo -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,sell_array] call DWF_fnc_index;
if(_index == -1) exitWith {};
_price = ((sell_array) select _index) select 1;

_isIllegalTraderCaptured = false;
if (!isNil "illegal_leader_flag_1") then
{
	if (!((illegal_leader_flag_1 getVariable["gangOwner",grpNull]) isEqualTo grpNull) && !(illegal_leader_flag_1 getVariable["inCapture",false])) then
	{
		_isIllegalTraderCaptured = true;
	};
};

_amount = ctrlText 2405;
if (!([_amount] call DWF_fnc_isnumber)) exitWith {hint "Gebe eine Zahl ein.";};
_amount = parseNumber (_amount);
if (_amount > (ITEM_VALUE(_type))) exitWith {hint "Du hast nicht genug davon, um solch eine Menge zu verkaufen!"};

DWEV_virtBuyInUse = true;

_price = (_price * _amount);
_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
_icon1 = M_CONFIG(getText,"VirtualItems",_type,"icon");
if (!(_icon1 isEqualTo "")) then {_icon = format["<img image='%1'/>",_icon1];};


if(([false,_type,_amount] call DWEV_fnc_handlelnv)) then
{
	_illegalShops = ["heroin","wongs","drogen","drogenkunde","schwarzmarkt","warenschieber","antitrader","tiermode","uranium"];

	if (DWEV_shop_type IN _illegalShops && _isIllegalTraderCaptured) then
	{
		_newPrice = round(_price * 0.95);
		_controllerAmount = (_price - _newPrice);
		_controllerGroup = illegal_leader_flag_1 getVariable["gangOwner",grpNull];
		_controllerName = _controllerGroup getVariable ["gang_name",""];
		
		hint parseText format["Du hast %1 %2%3 fuer %4€ verkauft. %5 wurden dir abgezogen, da die Gang %6 alle illegalen Haendler kontrolliert und desswegen diesen Anteil bekommt. Somit bleiben dir noch %7 uebrig",_amount,_icon,_name,[_price] call DWEV_fnc_numberText,[_controllerAmount] call DWEV_fnc_numberText,_controllerName,[_newPrice] call DWEV_fnc_numberText];
		dwf_cash = dwf_cash + _newPrice;
		[_controllerGroup,_controllerAmount] remoteExec ["DWF_fnc_addIllegalControllerAmount",2];
	}
	else
	{
		_isIllegal = false;
		_illegalItem = M_CONFIG(getNumber,"VirtualItems",_type,"illegal");
		if (_illegalItem isEqualTo 1 ) then	{_isIllegal = true;};

		if (_isIllegal) then
		{
			hint parseText format["Du hast %1 %2%3 fuer %4€ verkauft.",_amount,_icon,_name,[_price] call DWEV_fnc_numberText];
			dwf_cash = dwf_cash + _price;
		}
		else
		{
			hint parseText format["Du hast %1 %2%3 fuer %4€ verkauft. Da es Legal war, wurde die hälfte der Einnahmen (%5€) bereits deinem Bankkonto gutgeschrieben.",_amount,_icon,_name,[_price] call DWEV_fnc_numberText,[(_price/2)] call DWEV_fnc_numberText];
			dwf_cash = round (dwf_cash + (_price/2));
			dwf_atmcash = round (dwf_atmcash + (_price/2));
		};
	};
	
	if(_name == "Schwarzmarkt Niere") then
	{
		[0,player,format ["Spieler %1 hat %2 Niere(n) verkauft",getMyDName,_amount]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
	[] call DWEV_fnc_virt_update;
	[_type,_amount] remoteExec ["DWEV_fnc_addSell",2];

	if(DWEV_shop_type IN _illegalShops) then
	{
		private["_array","_ind","_val"];
		_array = DWEV_shop_npc getVariable["sellers",[]];
		_ind = [getPlayerUID player,_array] call DWF_fnc_index;
		if(_ind != -1) then
		{
			_val = (_array select _ind) select 2;
			_val = _val + _price;
			_array set[_ind,[getPlayerUID player,getMyName,_val]];
			DWEV_shop_npc setVariable["sellers",_array,true];
		}
			else
		{
			_array pushBack [getPlayerUID player,getMyName,_price];
			DWEV_shop_npc setVariable["sellers",_array,true];
		};
	};
};

if (isNil "DWEV_virt_sell_savetimer") then {DWEV_virt_sell_savetimer = false;};
if !(DWEV_virt_sell_savetimer) then
{
	DWEV_virt_sell_savetimer = true;
	[] spawn
	{
		sleep 60;
		[0] call SOCK_fnc_updatePartial;
		DWEV_virt_sell_savetimer = false;
	};
};

[] spawn
{
	sleep 2;
	DWEV_virtBuyInUse = false;
};

[3] call SOCK_fnc_updatePartial;