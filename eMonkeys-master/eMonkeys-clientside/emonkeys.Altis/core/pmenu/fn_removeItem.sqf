/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind","_illegalItems"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;

_illegalItems = getArray(missionConfigFile >> "Cfgmaster" >> "illigalItems");

if(_data == "") exitWith {hint "Sie haben nichts zum wegwerfen ausgewählt";};
if(!([_value] call fnc_isnumber)) exitWith {hint "Das soll eine Zahl sein?"};
if(parseNumber(_value) <= 0) exitWith {hint "Netter Versuch."};
_ind = [_data,_illegalItems] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call EMonkeys_fnc_nearUnits)) exitWith {titleText["Spinnst du? Wenn du das jetzt wegwirfst, können die das doch sehen!","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Du kannst das nicht wegwerfen solange du dich in einem Fahrzeug befindest.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call EMonkeys_fnc_handleInv)) exitWith {hint "Ich glaube du hast nicht einmal so viel davon."};
_type = [_data,0] call EMonkeys_fnc_varHandle;
_type = [_type] call EMonkeys_fnc_varToStr;
hint format["Du hast %1x %2 weggeworfen.",(parseNumber _value), _type];
	
[] call EMonkeys_fnc_p_updateMenu;