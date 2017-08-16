/*
	File: fn_changeClothes.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in the clothing store to show a 'preview' of the piece of clothing.
*/
disableSerialization;
private["_control","_selection","_data","_price","_total","_totalPrice"];
_control = (_this select 0) select 0;
_selection = (_this select 0) select 1;
_price = (findDisplay 3100) displayCtrl 3102;
_total = (findDisplay 3100) displayCtrl 3106;
if(_selection == -1) exitWith {hint localize "STR_Shop_NoSelection";};
if(isNull _control) exitWith {hint localize "STR_Shop_NoDisplay"};
if(lhm_cMenu_lock) exitWith {};
lhm_cMenu_lock = true;

lhm_clothing_purchase set[lhm_clothing_filter,(_control lbValue _selection)];
_data = _control lbData _selection;

if (_data isEqualTo "NONE") then {
    _item = switch (lhm_clothing_filter) do {
        case 0: {uniform player};
        case 1: {headGear player};
        case 2: {goggles player};
        case 3: {vest player};
        case 4: {backpack player};
    };

    [_item,false] call lhm_fnc_handleItem; // remove Item...
} else {
    [_data,true,nil,nil,nil,nil,nil,true] call lhm_fnc_handleItem; // add Item...
};

lhm_cMenu_lock = false;
_price ctrlSetStructuredText parseText format [(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%1</t>",[(_control lbValue _selection)] call lhm_fnc_numberText];

_totalPrice = 0;
{
	if(_x != -1) then
	{
		_totalPrice = _totalPrice + _x;
	};
} foreach lhm_clothing_purchase;

_total ctrlSetStructuredText parseText format [(localize "STR_Shop_Total")+ " <t color='#8cff9b'>$%1</t>",[_totalPrice] call lhm_fnc_numberText];