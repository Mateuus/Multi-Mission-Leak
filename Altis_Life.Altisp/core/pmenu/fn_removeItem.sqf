#include "..\..\script_macros.hpp"
/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;

if(EQUAL(_data,"")) exitWith {hint localize "STR_NOTF_didNotSelectToRemove";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint localize "STR_NOTF_notNumberFormat";};
if(parseNumber(_value) <= 0) exitWith {hint localize "STR_NOTF_enterAmountRemove";};
if(EQUAL(ITEM_ILLEGAL(_data),1) && ([west,visiblePosition player,100] call life_fnc_nearUnits)) exitWith {titleText["This is an illegal item and cops are near by, you cannot dispose of the evidence","PLAIN"]};
if(player != vehicle player) exitWith {titleText["You cannot remove an item when you are in a vehicle.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint localize "STR_NOTF_couldNotRemoveThatMuch";};

hint format [localize "STR_NOTF_removedFromInventory",(parseNumber _value),(localize ITEM_NAME(_data))];
	
[] call life_fnc_p_updateMenu;