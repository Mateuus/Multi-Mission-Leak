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

if(EQUAL(_data,"")) exitWith {hint "Du hast nichts zum Wegwerfen ausgewählt.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Du musst schon eine Zahl eingeben."};
if(parseNumber(_value) <= 0) exitWith {hint "Wieder herzaubern funktioniert nicht."};
if(EQUAL(ITEM_ILLEGAL(_data),1) && ([west,visiblePosition player,100] call life_fnc_nearUnits)) exitWith {titleText["Dieses Item ist illegal und es ist Polizei in der Nähe, wie stellst du dir das vor?","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Im Fahrzeug kannst du nichts wegwerfen.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "So funktioniert das nicht, vielleicht hast du nicht so viel?"};

hint format["Du hast erfolgreich %1 %2 weggeworfen.",(parseNumber _value),(localize ITEM_NAME(_data))];
	
[] call life_fnc_p_updateMenu;