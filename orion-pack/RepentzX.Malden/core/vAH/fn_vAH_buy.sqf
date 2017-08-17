#include "..\..\script_macros.hpp"
/*
	File: fn_vAH_buy.sqf
	Description: buys the item but does some checks and another cool thing
	Author: Fresqo
	returns _id,_seller,_item,_price,_type,_amount,_sellerName
*/
if (playerSide == west || playerSide == independent || playerSide == east) exitWith {hint "Only Civilians can use Auction"};
disableSerialization;
private["_d","_e","_checkid","_cnt","_status","_pid","_unit","_diff","_handle","_tamount"];
private _dialog = findDisplay 15100;
private _myListbox = _dialog displayCtrl 15101;
if (lbCurSel _myListbox < 0) exitWith {[localize "STR_AH_PSelect",true,"slow"] call life_fnc_notificationSystem;};
private _selectedOffer = call compile (_myListbox lbData (lbCurSel _myListbox));

private _auctioneers = LIFE_SETTINGS(getArray,"ah_auctioneers");
private _nearAH = false;
{if (player distance (call compile _x) < 5) exitWith {_nearAH = true}} forEach _auctioneers;
if (!_nearAH) exitWith {hint localize "STR_AH_TooFar"};

if (!vAH_loaded) exitWith {hint localize "STR_AH_AHBusy"};
if (count _selectedOffer < 7) exitWith {};

_selectedOffer params [
    "_id",
    "_seller",
    "_item",
    "_value",
    "_type",
    "_amount",
    "_sellerName"
];

private _uid = getPlayerUID player;
private _caller = player;
private _online = false;
private _iCheck = true;

_e = missionNamespace getVariable [format["ahItem_%1",_id],false];
if (player getVariable ["ahID",0] != _id && !_e) exitWith {[localize "STR_AH_SaleBusy",true,"slow"] call life_fnc_notificationSystem;};

if (_seller isEqualTo _uid) exitWith {[localize "STR_AH_Idiot",true,"slow"] call life_fnc_notificationSystem;};

{_checkid = _x select 0; if (_checkid isEqualTo _id) then {_status = _x select 7};} forEach all_ah_items;
if !(_status isEqualTo 0) exitWith {[localize "STR_AH_Sold",true,"slow"] call life_fnc_notificationSystem;}; //NOT FOR SALE ANYMORE
if (civRDMed < _value) exitWith {[localize "STR_NOTF_NotEnoughFunds",true,"slow"] call life_fnc_notificationSystem;};

if (_type isEqualTo 0) then 
	{
		_diff = [_item,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
		if (_diff < _amount) then {_iCheck = false;};
	} else 
		{
		if (_type isEqualTo 1)then 
			{ if (_amount > 1) then 
				{
					_iCheck = [_item,_amount] call life_fnc_vAH_checkItem;
				};
			};
		};

if (!_iCheck) exitWith {[localize "STR_NOTF_InvFull",true,"slow"] call life_fnc_notificationSystem;};
civRDMed = civRDMed - _value;

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

{if (getPlayerUID _x isEqualTo _seller) then {_online = true; _unit = _x};} forEach allPlayers;

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
