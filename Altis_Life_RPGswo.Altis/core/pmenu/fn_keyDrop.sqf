/*
	File: fn_keyDrop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Drops the key.
*/
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_sel = lbCurSel _list;
if(_sel == -1) exitWith {hint "Keine Daten ausgewählt";};
_index = (parseNumber(_list lbData _sel));
_vehicle = DWEV_vehicles select _index;
if(_vehicle isKindOf "House_F") exitWith {hint "Du kannst dein Hausschlüssel nicht wegwerfen."};
_owners = _vehicle getVariable "vehicle_info_owners";

_index2 = [(getPlayerUID player),_owners] call DWF_fnc_index;
DWEV_vehicles = DWEV_vehicles - [_vehicle];
_owners set[_index,-1];
_owners = _owners - [-1];
_vehicle setVariable["vehicle_info_owners",_owners,true];

[] spawn DWEV_fnc_keyMenu;