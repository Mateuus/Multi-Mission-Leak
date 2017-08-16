#include "..\..\macros.hpp"
/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Du hast nichts zum entfernen ausgewählt.";};
if(!([_value] call DWF_fnc_isnumber)) exitWith {hint "Das ist kein richtiges Zahlenformat.";};
if(parseNumber(_value) <= 0) exitWith {hint "Wieviel willst du vernichten?";};
if(_data == "muell") exitWith {hint "Müll muss bei der Mülldeponie verkauft werden!";};
if ((side player) == civilian && (__GETC__(DWEV_adminlevel) < 4 ) && ITEM_ILLEGAL(_data) isEqualTo 1 && ([west,visiblePosition player,200] call DWEV_fnc_nearUnits)) exitWith {titleText["Dieser Gegenstand ist illegal, du kannst ihn nicht entsorgen solange die Polizei in der nähe ist.","PLAIN"]};
if(player != vehicle player) exitWith {hint "Du kannst nichts aus dem Auto hinauswerfen.";};
if(!([false,_data,(parseNumber _value)] call DWEV_fnc_handlelnv)) exitWith {hint "Du hast nicht genug davon."};
hint format ["Du hast %1 %2 weggeworfen.",(parseNumber _value),(ITEM_NAME(_data))];
	
[] call DWEV_fnc_p_updateMenu;