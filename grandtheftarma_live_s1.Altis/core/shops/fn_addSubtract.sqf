#include <macro.h>
/*
	File: fn_addSubtract.sqf
	Author: Worldtrade1101, stuffz - CheapSuit Inc
	
	Description:
	Add or Subtract for the dynamic market system
*/

private["_amount","_type","_display","_amounttext","_add"];

// Params
_type = [_this,0,-1,[0]] call GTA_fnc_param;
_add = [_this,1,-1,[0]] call GTA_fnc_param;

disableSerialization;

// Error
if (_type == -1) exitwith {};

switch (_add) do
{
	case 0:
	{
		if (_type == 0) then
		{
			_amount = ctrlText 2404;
			if(!([_amount] call fnc_isnumber)) exitWith { hint localize "STR_Shop_Virt_NoNum"; };
			
			_amount = parseNumber _amount + 1;
			_display = findDisplay 2400;
			_amounttext = _display displayCtrl 2404;
			_amounttext ctrlSetText format ["%1",_amount];
		}
		else
		{
			_amount = ctrlText 2405;
			if(!([_amount] call fnc_isnumber)) exitWith { hint localize "STR_Shop_Virt_NoNum"; };
			
			_amount = parseNumber _amount + 1;
			_display = findDisplay 2400;
			_amounttext = _display displayCtrl 2405;
			_amounttext ctrlSetText format ["%1",_amount];
		};
	};
	case 1: 
	{
		if (_type == 0) then
		{
			_amount = ctrlText 2404;
			if(!([_amount] call fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
			
			_amount = parseNumber _amount - 1;
			_display = findDisplay 2400;
			_amounttext = _display displayCtrl 2404;
			_amounttext ctrlSetText format ["%1",_amount];
		}
		else
		{
			_amount = ctrlText 2405;
			if(!([_amount] call fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
			
			if (parseNumber _amount == 0) exitwith {};
			_amount = parseNumber _amount - 1;
			_display = findDisplay 2400;
			_amounttext = _display displayCtrl 2405;
			_amounttext ctrlSetText format ["%1",_amount];
		};
	};

};