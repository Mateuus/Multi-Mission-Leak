/*
	File: fn_keyGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a copy of the key for the selected vehicle to the selected player.
	Player must be within range.
*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
_vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
_unit = call compile format["%1", _unit];
if(isNull _unit OR isNil "_unit") exitWith {}; 

_uid = getPlayerUID _unit;
_owners = _vehicle getVariable "vehicle_info_owners";
_index = [_uid,_owners] call life_fnc_index;
if(_index != -1) exitWith {};

_owners set[count _owners,[_uid,name _unit]];
_vehicle setVariable["vehicle_info_owners",_owners,true];

hint format["You have given %1 keys to your %2",name _unit,typeOf _vehicle];
[[_vehicle,_unit,name player], "life_fnc_clientGetKey",_unit,false] spawn life_fnc_MP;

//[[65, player, format["Gave keys for %1 to %2", typeOf _vehicle, name _unit]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;