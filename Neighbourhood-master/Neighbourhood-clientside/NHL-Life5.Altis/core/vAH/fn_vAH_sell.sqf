
/*
	File: fn_vAH_sell.sqf
	Author: Fresqo
	Description: sells items to our auction house and blah blah too much fml
*/

private["_able","_uid","_dialog","_myListbox","_myQuantity","_onGuy","_details","_tquantity","_myTotal","_price","_typeb","_type","_classname","_realName","_bad","_tax","_action","_selectedSell","_quantity","_tochangePriceText","_tochangePriceNumber","_tochangeQuantityText","_tochangeQuantityNumber","_invItem"];
disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;
_able = 3;

if (!vAH_loaded) exitWith {hint "Das Auktionshaus ist gerade überladen, warte kurz!"};

_bad = false;
_realName = "";
//level
if(life_erfahrung >=1100) then {_able = 5};
//

_uid = getPlayerUID player;
if (({_x select 5 == _uid} count all_ah_items) >= _able) exitWith {hint format["Du kannst nur %1 items inserieren",_able];closeDialog 0;};
if (count all_ah_items >= 100) exitWith {hint "Das Auktionshaus hat die MAXimale Anzahl an Items erreicht.";closeDialog 0;};

_price = ctrlText 15603;
_quantity = ctrlText 15602;

if(! ([_price] call TON_fnc_isnumber)) exitWith {hint "Du musst eine Zahl beim Preis angeben.";};
if(! ([_quantity] call TON_fnc_isnumber)) exitWith {hint "Du musst eine Zahl angeben..";};
_price = parseNumber _price;
_quantity = parseNumber _quantity;

if (lbCurSel _myListbox < 0) exitWith {hint "Bitte wähle ein Item";};
_selectedSell = call compile (_myListbox lbData (lbCurSel _myListbox));

_classname = _selectedSell select 0;
if (_classname == "yolo") exitWith {};
_typeb = _selectedSell select 1;
_invItem = [_selectedSell,2,3,[3]] call BIS_fnc_param;
if (_invItem != 3) exitWith {hint "Du kannst ein bereits verkauftes, eingestelltes oder nicht vorhandenes Item verkaufen!"};
if(_typeb == "ymenu") then {_type = 0} else {_type = 1};

if (_price < 1) exitWith {hint "Für $1 kannst du es auch verschenken..."};
if (_price > 20000000) exitWith {hint "Mehr als 20 mio, bist du verrückt?!"};
//Level
if(life_erfahrung >=8300) then {_tax = round (_price * 0.05);}
else {_tax = round(_price * 0.15);};
//
switch (_type) do 
{
	case 0: {
				_realName = [([_classname,0] call life_fnc_varHandle)] call life_fnc_varToStr;
				if (_quantity > 100) then {_bad = true; hint "Gib eine richtige Menge an..."};
			};
	case 1: {if (_quantity > 1) then 
			{
				_details = [_classname] call life_fnc_fetchCfgDetails;
				if (!(_details select 6 == "CfgMagazines")) then {
				hint "Du kannst dieses Item nur 1x verkaufen!";_bad = true;};
				_onGuy = {_classname == _x} count (magazines player);
				if (_onGuy < _quantity) then {hint "So viel hast du nicht!";_bad = true;}
			};
			_realName = ([_classname] call life_fnc_fetchCfgDetails) select 1;
			};
};

if (_bad) exitWith {closeDialog 0;};

_action = [format["Die Gebühren betragen $%1 . Bestätigen?",_tax],"Verkaufsbestätigung","KAUFEN","ABBRECHEN"] call BIS_fnc_guiMessage;
if(_action) then {
		if(life_atmcash < _tax) exitWith {hint "Du hast nicht so viel Geld für die Gebühr dabei.";_bad = true;};
	
	switch (_type) do 
		{
			case 0: {if(!([false,_classname,_quantity] call life_fnc_handleInv)) then {hint "So viele Items hast du nicht!";_bad = true;};};
			case 1: {
						_tquantity = _quantity +1;
						for [{_i=1}, {_i<_tquantity}, {_i=_i+1}] do 
							{
								[_classname,false] spawn life_fnc_handleItem;
							};
							[3] call SOCK_fnc_updatePartial;
					};
		};
		if (_bad) exitWith {closeDialog 0;};
		[[4,_type,_quantity,_price,getPlayerUID player,_classname,_realName,name player],"TON_fnc_vAH_update",false,false] call life_fnc_mp;
		hint "Auktion erfolgreich hinzugefügt";
		life_atmcash = life_atmcash - _tax;
		[3] call SOCK_fnc_updatePartial;
		[6] call SOCK_fnc_updatePartial;
		closeDialog 0;
		} else {
			closeDialog 0;
		};