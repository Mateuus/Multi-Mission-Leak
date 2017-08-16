/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[3201,(lbCurSel 3201)];
_value = ctrlText 3206;
if(_data == "") exitWith {hint "Du hast nichts ausgewählt.";};
if(!([_value] call SOA_fnc_isnumber)) exitWith {hint "Du hast keine Nummer eingegeben."};
_ind = [_data,life_illegal_items] call SOA_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {hint "Dies ist ein illegaler Gegenstand und Polizisten sind in der Nähe. Dies könnte als Beweisstück dienen..."};
if(parseNumber(_value) <= 0) exitWith {hint "Du musst eine Anzahl zum Entfernen eingeben."};
if!(isNull objectParent player) exitWith {hint "Du kannst im Fahrzeug nichts entfernen."};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Es konnte nicht so viel entfernt werden, bist du dir sicher das du so viel besitzt?"};

_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Es wurde(n) erfolgreich %1 %2 aus deinem Inventar entfernt.",(parseNumber _value), _type];

[] call life_fnc_inventory;