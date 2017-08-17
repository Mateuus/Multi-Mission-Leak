#include "..\..\script_macros.hpp"
/*
	File: fn_vAH_sell.sqf
	Author: Fresqo
	Description: sells items to our auction house and blah blah too much fml
*/
if (playerSide == west || playerSide == independent || playerSide == east) exitWith {hint "Only Civilians can use Auction"};

private["_able","_uid","_dialog","_myListbox","_myQuantity","_onGuy","_details","_tquantity","_myTotal","_price","_typeb","_type","_classname","_realName","_bad","_tax","_action","_selectedSell","_quantity","_tochangePriceText","_tochangePriceNumber","_tochangeQuantityText","_tochangeQuantityNumber","_invItem"];
disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;
_able = LIFE_SETTINGS(getNumber,"ah_listing_limit");
private _auctioneers = LIFE_SETTINGS(getArray,"ah_auctioneers");
private _percent = LIFE_SETTINGS(getNumber,"ah_percent");
private _nearAH = false;
{if (player distance (call compile _x) < 5) exitWith {_nearAH = true}} forEach _auctioneers;
if (!_nearAH) exitWith {hint localize "STR_AH_TooFar"};

if (!vAH_loaded) exitWith {["Auction house is busy at the moment, please try again in a short while!",false,"slow"] call life_fnc_notificationSystem;};

_bad = false;
_realName = "";
_uid = getPlayerUID player;
if (({(_x select 5) isEqualTo _uid} count all_ah_items) >= _able) exitWith {hint format["You can only have %1 items listed",_able];closeDialog 0;};
if (count all_ah_items >= 80) exitWith {["The auction house has reached its listing limit, please wait for an item expiry and try again",false,"slow"] call life_fnc_notificationSystem;closeDialog 0;};

_price = ctrlText 15603;
_quantity = ctrlText 15602;

if(! ([_price] call TON_fnc_isnumber)) exitWith {["You have to enter a number in the price field.",false,"slow"] call life_fnc_notificationSystem;};
if(! ([_quantity] call TON_fnc_isnumber)) exitWith {["You have to enter a number in the quantity field.",false,"slow"] call life_fnc_notificationSystem;};
_price = parseNumber _price;
_quantity = parseNumber _quantity;

if (lbCurSel _myListbox < 0) exitWith {["Please select an Item",false,"slow"] call life_fnc_notificationSystem;};
_selectedSell = call compile (_myListbox lbData (lbCurSel _myListbox));

_classname = (_selectedSell select 0);
if (_classname isEqualTo "yolo") exitWith {};
_typeb = (_selectedSell select 1);
_invItem = [_selectedSell,2,3,[3]] call BIS_fnc_param;
if !(_invItem isEqualTo 3) exitWith {["You cannot sell an item that is already on the auction house, expired, or sold!",false,"slow"] call life_fnc_notificationSystem;};
if (_typeb isEqualTo "ymenu") then {_type = 0} else {_type = 1};
if (_price < 1) exitWith {["Invalid value",false,"slow"] call life_fnc_notificationSystem;};
if (_price > 9000000) exitWith {["Invalid value. Must be lower than 9 mil",false,"slow"] call life_fnc_notificationSystem;};

_percent = (_percent / 1000);
_tax = round (_price * _percent);

switch (_type) do 
{
	case 0: {
				_realName = localize M_CONFIG(getText,"VirtualItems",_classname,"displayName");
				if (_quantity > 100) then {_bad = true; ["Are you fucking kidding me, dont be a dickhead, put a proper amount in!",false,"slow"] call life_fnc_notificationSystem;};
			};
	case 1: {if (_quantity > 1) then 
			{
				_details = [_classname] call life_fnc_fetchCfgDetails;
				if (!(_details select 6 isEqualTo "CfgMagazines")) then {
				["You can only sell 1 of any of this item!",false,"slow"] call life_fnc_notificationSystem;_bad = true;};
				_onGuy = {_classname isEqualTo _x} count (magazines player);
				if (_onGuy < _quantity) then {["You dont have that many!",false,"slow"] call life_fnc_notificationSystem;_bad = true;}
			};
			_realName = ([_classname] call life_fnc_fetchCfgDetails) select 1;
			};
};

if (_bad) exitWith {closeDialog 0;};
if (_classname == "relic1" || _classname == "relic2" || _classname == "relic3" || _classname == "relic4" || _classname == "relicTransport" || _classname == "relicFed" || _classname == "excavator" || _classname == "planeTreasure") exitWith {["You cannot sell relics",true,"slow"] call life_fnc_notificationSystem;};
_action = [format["You will be taxed $%1 . Continue?",_tax],"Auction Confirmation","CONTINUE","CANCEL"] call BIS_fnc_guiMessage;
if(_action) then {
		if(civRDMed < _tax) exitWith {["You don't have enough money in the bank to pay the tax",false,"slow"] call life_fnc_notificationSystem;_bad = true;};
	
	switch (_type) do 
		{
			case 0: {if(!([false,_classname,_quantity] call life_fnc_handleInv)) then {["You dont have that many!",false,"slow"] call life_fnc_notificationSystem;_bad = true;};};
			case 1: {
						_tquantity = _quantity +1;
						for [{_i=1}, {_i<_tquantity}, {_i=_i+1}] do 
							{
								[_classname,false] spawn life_fnc_handleItem;
							};
					};
		};
		if (_bad) exitWith {closeDialog 0;};
		[4,_type,_quantity,_price,_uid,_classname,_realName,name player] remoteExec ["TON_fnc_vAH_update",RSERV];
		["Auction Successfully Added",false,"slow"] call life_fnc_notificationSystem;
		civRDMed = civRDMed - _tax;
		closeDialog 0;
		[0] call SOCK_fnc_updatePartial;
		[3] call SOCK_fnc_updatePartial;
		} else {
			closeDialog 0;
		};

