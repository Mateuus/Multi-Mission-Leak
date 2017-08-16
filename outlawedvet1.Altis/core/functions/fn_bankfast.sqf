#include "..\..\script_macros.hpp"
/*
	File: fn_bankfast.sqf
	Author: Worldtrade1101
	Base on Tonic script
	Description:
	add or remove one from the rscEdit
*/
private["_amount","_item_list","_gear_list","_shop_data","_name","_price"];

_textbox = [_this,0,-1,[0]] call BIS_fnc_param;
_num = [_this,1,-1,[0]] call BIS_fnc_param;
disableSerialization;

if (_textbox == -1) exitwith {};

switch (_num) do {
	case 0 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = parseNumber _amount + 25000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];

	 } else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	 
	if (_amount > 974999) exitWith {hint localize "STR_ATM_WithdrawMax";};
	_amount = parseNumber _amount + 25000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
	case 1 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = parseNumber _amount + 100000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	} else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	 
	_amount = parseNumber _amount + 100000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
	case 2 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = parseNumber _amount + 250000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];

	 } else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	 
	if (_amount > 749999) exitWith {hint localize "STR_ATM_WithdrawMax";};
	_amount = parseNumber _amount + 250000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
	case 3 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = parseNumber _amount + 500000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	 } else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	
	if (_amount > 499999) exitWith {hint localize "STR_ATM_WithdrawMax";};
	_amount = parseNumber _amount + 500000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
	case 4 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = 0;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	} else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	
	if (_amount > 499999) exitWith {hint localize "STR_ATM_WithdrawMax";};
	_amount = 0;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
	case 5 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = CASH ;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	[] call life_fnc_bankDeposit;
	_amount = 0;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	} else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	
	if (_amount > 499999) exitWith {hint localize "STR_ATM_WithdrawMax";};
	_amount = CASH ;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	[] call life_fnc_bankDeposit;
	_amount = 0;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
	case 6 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = parseNumber _amount + 10000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	 } else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	
	if (_amount > 9999) exitWith {hint localize "STR_ATM_WithdrawMax";};
	_amount = parseNumber _amount + 10000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
	case 7 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = parseNumber _amount + 50000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	 } else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	
	if (_amount > 49999) exitWith {hint localize "STR_ATM_WithdrawMax";};
	_amount = parseNumber _amount + 50000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
	case 8 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = parseNumber _amount + 75000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	 } else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	
	if (_amount > 74999) exitWith {hint localize "STR_ATM_WithdrawMax";};
	_amount = parseNumber _amount + 75000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
	case 9 : {
	if (_textbox == 0 ) then {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
	_amount = parseNumber _amount + 750000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	 } else {
	_amount = ctrlText 2702;
	if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};	
	if (_amount > 749999) exitWith {hint localize "STR_ATM_WithdrawMax";};
	_amount = parseNumber _amount + 750000;
	_display = findDisplay 2700;
	_amounttext = _display displayCtrl 2702;
	_amounttext ctrlSetText format ["%1",_amount];
	};
	};
};

