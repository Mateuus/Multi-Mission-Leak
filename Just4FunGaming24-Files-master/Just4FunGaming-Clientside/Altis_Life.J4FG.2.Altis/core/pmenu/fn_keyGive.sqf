/*
    File: fn_keyGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a copy of the key for the selected vehicle to the selected player.
    Player must be within range.
*/
private["_dialog","_list","_plist","_sel","_vehicle","_users","_index","_unit","_uid"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
_vehicle = _list lbData _sel;
_vehicle = XY_vehicles select parseNumber(_vehicle);

_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
_unit = call compile format["%1", _unit];
if(isNil "_unit" || {isNull _unit} ) exitWith {};

hint format["Du hast %1 die Schlüssel zu deinem %2 gegeben", name _unit, getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName") ];

[ _vehicle, profileName ] remoteExec ["XY_fnc_receiveKey", _unit];