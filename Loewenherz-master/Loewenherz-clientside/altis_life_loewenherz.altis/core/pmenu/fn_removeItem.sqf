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
if(_data == "") exitWith {hint "Du hast Nichts zum entfernen ausgewaehlt.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Keine gueltige Zahl wurde angegeben."};
if(parseNumber(_value) <= 0) exitWith {hint "Du musst eine richtige Menge angeben."};
_ind = [_data,lhm_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call lhm_fnc_nearUnits)) exitWith {titleText["Dies ist ein illegaler Gegenstand und Cops sind in der Naehe, du kannst diesen jetzt nicht wegwerfen *haha*","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Du kannst Items in Fahrzeugen nicht entfernen.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call lhm_fnc_handleInv)) exitWith {hint "Eine solche Menge von diesem Item konnte nicht entfernt werden, vll hast du nicht eine solche Menge?"};
_type = [_data,0] call lhm_fnc_varHandle;
_type = [_type] call lhm_fnc_varToStr;
hint format["You have successfully removed %1 %2 from your inventory.",(parseNumber _value), _type];
	
[] call lhm_fnc_p_updateMenu;