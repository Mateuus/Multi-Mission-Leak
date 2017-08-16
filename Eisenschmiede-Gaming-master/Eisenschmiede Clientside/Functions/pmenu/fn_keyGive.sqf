#include "..\script_macros.hpp"
/*
	File: fn_keyGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a copy of the key for the selected vehicle to the selected player.
	Player must be within range.
*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid","_name"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
_vehicle = _list lbData _sel;
_vehicle = ES_vehicles select parseNumber(_vehicle);

if((_vehicle isKindOf "House_F")) exitWith {hint "Haus- und Garagenschlüssel kannst du nicht weitergeben!"};

_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
_unit = call compile format["%1", _unit];

if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(isNull _vehicle) exitWith {};

_uid = getPlayerUID _unit;
_owners = _vehicle getVariable "vehicle_info_owners";
_index = [_uid,_owners] call ES_fnc_index;
if(EQUAL(_index,-1)) then  {
	_owners pushBack [_uid,_unit getVariable ["realname",name _unit]];
	_vehicle setVariable ["vehicle_info_owners",_owners,true];
};

_name = getText(configFile>>"CfgVehicles">>typeOf _vehicle>>"DisplayName");

hint format["Du hast %1 Schlüssel von %2 gegeben",_unit getVariable ["realname",name _unit],_name];
[_vehicle,_unit,profileName] remoteExec ["ES_fnc_clientGetKey",0];