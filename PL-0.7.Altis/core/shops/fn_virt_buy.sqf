#include "..\..\script_macros.hpp"
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name"];
if((lbCurSel 2401) == -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;
if((_price * _amount) > CASH) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
if((time - life_action_delay) < 0.2) exitWith {hint localize "STR_NOTF_ActionDelay";};
life_action_delay = time;

_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if((_price * _amount) > CASH) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; [false,_type,_amount] call life_fnc_handleInv;};
	hint format[localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
	SUB(CASH,(_price * _amount));
	playSound "caching";
	[] call life_fnc_virt_update;

	_playerID = getPlayerUID player;
	_playerName = name player;
	_type = 2;
	_finalprice = _price * _amount;
	[_playerID,_playerName,_name,_amount,_type,_finalprice] remoteExecCall ["TON_fnc_buysellLog", (call life_fnc_HCC)];
	[] call life_fnc_virt_update;
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
