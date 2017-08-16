#include "..\..\script_macros.hpp"
/*
	File: fn_vAH_buy.sqf
	Description: buys the item but does some checks and another cool thing
	Author: Fresqo
	returns _id,_seller,_item,_price,_type,_amount,_sellerName
*/

disableSerialization;
private["_d","_e","_dialog","_myListbox","_selectedOffer","_id","_seller","_item","_value","_checkid","_cnt","_status","_online","_pid","_unit","_type","_amount","_diff","_uid","_caller","_handle","_tamount","_iCheck"];
_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
if (lbCurSel _myListbox < 0) exitWith {hint localize "STR_AH_PSelect";};
_selectedOffer = call compile (_myListbox lbData (lbCurSel _myListbox));

if (!vAH_loaded) exitWith {hint localize "STR_AH_AHBusy"};
if (count EQUAL(_selectedOffer,1)) exitWith {};

_id = SEL(_selectedOffer,0);
_seller = SEL(_selectedOffer,1);
_item = SEL(_selectedOffer,2);
_value = SEL(_selectedOffer,3);
_type = SEL(_selectedOffer,4);
_amount = SEL(_selectedOffer,5);
_sellerName = SEL(_selectedOffer,6);
_uid = steamid;
_caller = player;
_online = false;
_iCheck = true;

_e = GVAR_MNS [format["ahItem_%1",_id],false];
if (player GVAR["ahID",0] != _id && !_e) exitWith {hint localize "STR_AH_SaleBusy";};

if (EQUAL(_seller,_uid)) exitWith {hint localize "STR_AH_Idiot";};

{_checkid = SEL(_x,0);if (EQUAL(_checkid,_id)) then {_status = SEL(_x,7)};}forEach all_ah_items;
if (_status != 0) exitWith {hint localize "STR_AH_Sold";}; //NOT FOR SALE ANYMORE
if (BANK < _value) exitWith {hint localize "STR_NOTF_NotEnoughFunds";};

if (EQUAL(_type,0)) then 
	{
		_diff = [_item,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
		if(_diff < _amount) then {_iCheck = false;};
	} else 
		{
		if (_type == 1)then 
			{ if (_amount > 1) then 
				{
					_iCheck = [_item,_amount] call life_fnc_vAH_checkItem;
				};
			};
		};

if(!_iCheck) exitWith {hint localize "STR_NOTF_InvFull";};
SUB(BANK,_value);

switch (_type) do {
	case 0: {[true,_item,_diff] call life_fnc_handleInv;};
	case 1: {
	_tamount = _amount + 1;
			for [{_i=0}, {_i<_tamount}, {_i=_i+1}] do
		{
			[_item,true] call life_fnc_handleItem;
		};
	};
};

{if(getPlayerUID _x == _seller) then {_online = true; _unit = _x};} foreach allPlayers;

if (_online) then 
	{
		[1,_id] remoteExec ["TON_fnc_vAH_update",RSERV];
		[0,[_item,_value,name _unit]] remoteExecCall ["life_fnc_vAH_reciever",_caller];
		[1,[_caller,_value]] remoteExecCall ["life_fnc_vAH_reciever",_unit];
	} else 
		{
			[3,_id] remoteExec ["TON_fnc_vAH_update",RSERV];
			[0,[_item,_value,_sellerName]] remoteExecCall ["life_fnc_vAH_reciever",_caller];
		};	
closeDialog 0;