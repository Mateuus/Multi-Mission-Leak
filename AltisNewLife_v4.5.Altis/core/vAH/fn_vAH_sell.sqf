#include <macro.h>
/*
	File: fn_vAH_sell.sqf
	Author: Fresqo
	Description: sells items to our auction house and blah blah too much fml
*/

private["_able","_uid","_dialog","_myListbox","_myQuantity","_onGuy","_details","_tquantity","_myTotal","_price","_typeb","_type","_classname","_realName","_bad","_tax","_action","_selectedSell","_quantity","_tochangePriceText","_tochangePriceNumber","_tochangeQuantityText","_tochangeQuantityNumber","_invItem"];
disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;
_able = 1;

if (!vAH_loaded) exitWith {hint "Le marché noir est occupé en ce moment, revenez dans quelques instants !"};

_bad = false;
_realName = "";
switch ((GETC(life_donator))) do {
	case 1: {_able = 4};
	case 2: {_able = 4};
	case 3: {_able = 5};
	case 4: {_able = 5};
	case 5: {_able = 6};
	case 6: {_able = 6};	
	default {_able = 3};
};

_uid = getPlayerUID player;
if (({_x select 5 == _uid} count all_ah_items) >= _able) exitWith {hint format["Vous ne pouvez avoir que 1% des articles en vente",_able];closeDialog 0;};
if (count all_ah_items >= 80) exitWith {hint "Le marché noir a atteint sa limite d'objet pour le moment !";closeDialog 0;};

_price = ctrlText 15603;
_quantity = ctrlText 15602;

if(! ([_price] call TON_fnc_isnumber)) exitWith {hint "Vous devez entrer un chiffre dans le champ prix.";};
if(! ([_quantity] call TON_fnc_isnumber)) exitWith {hint "Vous devez entrer un chffre dans le champ quantité.";};
_price = parseNumber _price;
_quantity = parseNumber _quantity;

if (lbCurSel _myListbox < 0) exitWith {hint "Merci de choissir un objet";};
_selectedSell = call compile (_myListbox lbData (lbCurSel _myListbox));

_classname = _selectedSell select 0;
if (_classname == "yolo") exitWith {};
_typeb = _selectedSell select 1;
_invItem = [_selectedSell,2,3,[3]] call BIS_fnc_param;
if (_invItem != 3) exitWith {hint "Vous ne pouvez pas vendre un objet qui est en vente sur le marché noir, a expiré ou vendu !"};
if(_typeb == "ymenu") then {_type = 0} else {_type = 1};

if (_price < 1) exitWith {hint "Valeur invalide"};
if (_price > 5000000) exitWith {hint "Valeur invalide. Ne peut pas dépasser Must be lower than 500 000"};

_tax = round (_price * 0.03);

switch (_type) do 
{
	case 0: {
				_realName = localize ITEM_NAME(_classname);
				if (_quantity > 100) then {_bad = true; hint "Merci de mettre une quantité valide !"};
			};
	case 1: {if (_quantity > 1) then 
			{
				_details = [_classname] call life_fnc_fetchCfgDetails;
				if (!(_details select 6 == "CfgMagazines")) then {
				hint "Vous ne pouvez vendre qu'un seul de cet objet !";_bad = true;};
				_onGuy = {_classname == _x} count (magazines player);
				if (_onGuy < _quantity) then {hint "Vous ne disposez pas d'autant !";_bad = true;}
			};
			_realName = ([_classname] call life_fnc_fetchCfgDetails) select 1;
			};
};

if (_bad) exitWith {closeDialog 0;};

_action = [format["Vous serez taxé de %1€ . Continuer ?",_tax],"Confirmation","CONTINUE","CANCEL"] call BIS_fnc_guiMessage;
if(_action) then {
		if(compte_banque < _tax) exitWith {hint "Vous n'avez pas asssez d'argent pour payer la taxe";_bad = true;};
	
	switch (_type) do 
		{
			case 0: {if(!([false,_classname,_quantity] call life_fnc_handleInv)) then {hint "Vous n'avez pas assez !";_bad = true;};};
			case 1: {
						_tquantity = _quantity +1;
						for [{_i=1}, {_i<_tquantity}, {_i=_i+1}] do 
							{
								[_classname,false] spawn life_fnc_handleItem;
							};
					};
		};
		if (_bad) exitWith {closeDialog 0;};
		[[4,_type,_quantity,_price,getPlayerUID player,_classname,_realName,name player],"TON_fnc_vAH_update",false,false] call life_fnc_mp;
		hint "Ajout dans le marché noir reussi";
		compte_banque = compte_banque - _tax;
		closeDialog 0;
		} else {
			closeDialog 0;
		};