/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];

disableSerialization;

_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {
    hint "Du hast nichts zum Entfernen ausgewählt";
};

if(!([_value] call XY_fnc_isnumber)) exitWith {
    hint "Das ist kein richtiges Zahlenformat"
};

if( parseNumber(_value) <= 0 ) exitWith {
    hint "Wieviel willst du löschen?"
};

_config = [_data] call XY_fnc_itemConfig;

if( _config select 5 && ([ west, getPos player, 75 ] call XY_fnc_nearUnits) ) exitWith {
    hint "Dieser Gegenstand ist illegal, du kannst ihn nicht entsorgen solange die Polizei in der Nähe ist";
};
if( !([false,_data,(parseNumber _value)] call XY_fnc_handleInv) ) exitWith {
    hint "Du hast nicht genug davon."
};

hint format["Du hast %1 %2 weggeworfen", (parseNumber _value), _config select 2];
	
[] call XY_fnc_p_updateMenu;