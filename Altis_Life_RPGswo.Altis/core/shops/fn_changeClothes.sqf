/*
	File: fn_changeClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the clothing store to show a 'preview' of the piece of clothing.
*/
disableSerialization;
private ["_control","_selection","_data","_price","_total","_totalPrice"];
_control = (_this select 0) select 0;
_selection = (_this select 0) select 1;
_price = (findDisplay 3100) displayCtrl 3102;
_total = (findDisplay 3100) displayCtrl 3106;
if (_selection isEqualTo -1) exitWith {hint "Keine Auswahl";};
if (isNull _control) exitWith {hint "Keine Anzeige"};
if (DWEV_cMenu_lock) exitWith {};
DWEV_cMenu_lock = true;


DWEV_clothing_purchase set[DWEV_clothing_filter,(_control lbValue _selection)];
_data = _control lbData _selection;

if (_data isEqualTo "NONE") then {
    _item = switch (DWEV_clothing_filter) do {
        case 0: {uniform player};
        case 1: {headGear player};
        case 2: {goggles player};
        case 3: {vest player};
        case 4: {backpack player};
    };

//    [_item,false] call DWEV_fnc_handleItem;
} else {
    [_data,true,nil,nil,nil,nil,nil,true] call DWEV_fnc_handleItem;
};

DWEV_cMenu_lock = false;
if (actionSpendenziel1) then {_price = (_price*0.9);};
_price ctrlSetStructuredText parseText format [("Preis:")+ " <t color='#8cff9b'>$%1</t>",[(_control lbValue _selection)] call DWEV_fnc_numberText];

_totalPrice = 0;
{
    if (_x != -1) then {
        _totalPrice = _totalPrice + _x;
    };
} forEach DWEV_clothing_purchase;

if (actionSpendenziel1) then {_totalPrice = (_totalPrice*0.9);};

_total ctrlSetStructuredText parseText format [("Gesamt:")+ " <t color='#8cff9b'>$%1</t>",[_totalPrice] call DWEV_fnc_numberText];

[] spawn
{
	sleep 2;
	[player, uniform player] call DWEV_fnc_equipTextures;
	[player, backpack player] call DWEV_fnc_equipTextures;
};
