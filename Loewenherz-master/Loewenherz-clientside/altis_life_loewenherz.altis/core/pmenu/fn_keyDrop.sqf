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
if(_sel == -1) exitWith {hint "No Data selected";};
_index = (parseNumber(_list lbData _sel));
_vehicle = lhm_vehicles select _index;
if(_vehicle isKindOf "House_F") exitWith {hint "Du kannst die Schluessel zu deinem Haus nicht wegwerfen!"};

_action = [
	"Wollen Sie wirklich den Schluessel wegwerfen?",
	"Bestätigung",
	"JA",
	"NEIN"
] call BIS_fnc_guiMessage;

if(!_action) exitWith{};
_owners = _vehicle getVariable "vehicle_info_owners";

_index2 = [(getPlayerUID player),_owners] call TON_fnc_index;
lhm_vehicles = lhm_vehicles - [_vehicle];
_owners set[_index,-1];
_owners = _owners - [-1];
_vehicle setVariable["vehicle_info_owners",_owners,true];

[] spawn lhm_fnc_keyMenu;