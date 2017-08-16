/*
	File: fn_keyGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a copy of the key for the selected vehicle to the selected player.
	Player must be within range.
*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid","_vehicleName"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
_vehicle = _list lbData _sel;
_vehicle = EMonkeys_vehic164 select parseNumber(_vehicle);

_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
_unit = call compile format["%1", _unit];
if(isNull _unit OR isNil "_unit") exitWith {}; 

_uid = getPlayerUID _unit;
_owners = _vehicle getVariable "vehicle_info_owners";
_index = [_uid,_owners] call TON_fnc_index;
if(_index == -1) then 
{
	_owners pushBack [_uid,_unit getVariable["realname",name _unit]];
	_vehicle setVariable["vehicle_info_owners",_owners,true];
};

_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
hint format["Du hast %1 den Schlüssel für dein(en) %2 gegeben",_unit getVariable["realname",name _unit],_vehicleName];
[[_vehicle,_unit,profileName], "clientGetKey",_unit,false] call EMonkeys_fnc_mp;