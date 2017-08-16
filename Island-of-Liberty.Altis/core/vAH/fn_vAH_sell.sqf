#include "..\..\script_macros.hpp"
/*
	File: fn_vAH_sell.sqf
	Author: Fresqo
	Description: sells items to our auction house and blah blah too much fml
*/

private["_able","_uid","_dialog","_myListbox","_myQuantity","_onGuy","_details","_tquantity","_myTotal","_price","_typeb","_type","_classname","_realName","_bad","_tax","_action","_selectedSell","_quantity","_tochangePriceText","_tochangePriceNumber","_tochangeQuantityText","_tochangeQuantityNumber","_invItem"];
disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;
_able = LIFE_SETTINGS(getNumber,"ah_listing_limit");

if (!vAH_loaded) exitWith {hint "Das Auktionshaus ist im moment geschlossen, komm später wieder!"};

_bad = false;
_realName = "";
switch (FETCH_CONST(life_donorlevel)) do {
	case 1: {_able = _able + 1};
	case 2: {_able = _able + 2};
	case 3: {_able = _able + 3};
	case 4: {_able = _able + 4};
	case 5: {_able = _able + 5};
	default {};
};
_uid = steamid;
if (({SEL(_x,5) == _uid} count all_ah_items) >= _able) exitWith {hint format["You can only have %1 items listed",_able];closeDialog 0;};
if (count all_ah_items >= 80) exitWith {hint "Das Auktionshaus hat immoment kein Platz mehr, bitte komm Später wieder vorbei und versuche es erneut";closeDialog 0;};

_price = ctrlText 15603;
_quantity = ctrlText 15602;

if(! ([_price] call TON_fnc_isnumber)) exitWith {hint "Du hast eine Zahl ins Preisfeld eingegeben.";};
if(! ([_quantity] call TON_fnc_isnumber)) exitWith {hint "Sie haben eine Zahl in das Mengenfeld eingeben.";};
_price = parseNumber _price;
_quantity = parseNumber _quantity;

if (lbCurSel _myListbox < 0) exitWith {hint "Wähle ein Gegenstand";};
_selectedSell = call compile (_myListbox lbData (lbCurSel _myListbox));

_classname = SEL(_selectedSell,0);
if (_classname == "yolo") exitWith {};
_typeb = SEL(_selectedSell,1);
_invItem = [_selectedSell,2,3,[3]] call BIS_fnc_param;
if (_invItem != 3) exitWith {hint "You cannot sell an item that is already on the auction house, expired, or sold!"};
if(_typeb == "ymenu") then {_type = 0} else {_type = 1};

if (_price < 1) exitWith {hint "Ungültiger Wert"};
if (_price > 9000000) exitWith {hint "Ungültiger Wert. Muss niedriger sein als 9 Millionen sein."};

_tax = round (_price * 0.03);

switch (_type) do 
{
	case 0: {
				_realName = localize M_CONFIG(getText,"VirtualItems",_classname,"displayName");
				if (_quantity > 100) then {_bad = true; hint "Du solltest nicht Scherzen, und ein anstendiger Preis setzen!"};
			};
	case 1: {if (_quantity > 1) then 
			{
				_details = [_classname] call life_fnc_fetchCfgDetails;
				if (!(_details select 6 == "CfgMagazines")) then {
				hint "Du kannst nur 1 Gegenstand verkaufen";_bad = true;};
				_onGuy = {_classname == _x} count (magazines player);
				if (_onGuy < _quantity) then {hint "You dont have that many!";_bad = true;}
			};
			_realName = ([_classname] call life_fnc_fetchCfgDetails) select 1;
			};
};

if (_bad) exitWith {closeDialog 0;};

_action = [format["Die Pfandsteuer beträgt: $%1 . Fortsetzen?",_tax],"Auktion bestätigen","Fortsetzen","Abbrechen"] call BIS_fnc_guiMessage;
if(_action) then {
		if(BANK < _tax) exitWith {hint "Du hast nicht genug Geld auf deinem Bank Konto um die Pfandsteuer zu bezahlen!";_bad = true;};
	
	switch (_type) do 
		{
			case 0: {if(!([false,_classname,_quantity] call life_fnc_handleInv)) then {hint "You dont have that many!";_bad = true;};};
			case 1: {
						_tquantity = _quantity +1;
						for [{_i=1}, {_i<_tquantity}, {_i=_i+1}] do 
							{
								[_classname,false] spawn life_fnc_handleItem;
							};
					};
		};
		if (_bad) exitWith {closeDialog 0;};
		[4,_type,_quantity,_price,steamid,_classname,_realName,name player] remoteExec ["TON_fnc_vAH_update",RSERV];
		hint "Auktion erfolgreich erstellt";
		SUB(BANK,_tax);
		closeDialog 0;
		[0] call SOCK_fnc_updatePartial;
		[3] call SOCK_fnc_updatePartial;
		} else {
			closeDialog 0;
		};

