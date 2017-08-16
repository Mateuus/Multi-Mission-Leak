/*
    File: fn_giveDiff.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    ??A?SD?ADS?A -> this is exactly how it looks, screw you Tonic
*/

private _unit = param[0, objNull, [objNull]];
private _item = param[1, "", [""]];
private _val = param[2, -1, [0]];
private _from = param[3, objNull, [objNull]];
private _bool = param[4, false, [false]];

if( isNull _unit || { _unit != player } || { isNull _from } || { _val <= 0 } || { _item isEqualTo "" } ) exitWith {};

private _name = ([_item] call XY_fnc_itemConfig) select 2;

if(_bool) then {
    if(([true,_item,(parseNumber _val)] call XY_fnc_handleInv)) then {
        hint format[localize "STR_MISC_TooMuch",_from getVariable["realName",name _from],_val,_name];
    };
} else {
    if(([true,_item,(parseNumber _val)] call XY_fnc_handleInv)) then {
        hint format[localize "STR_MISC_TooMuch_2",_from getVariable["realName",name _from],_val,_name];
    };
};
[getPlayerUID player, 2, format ["Hat von %1 (%2) %3x %4 zurückerhalten (Ziel hatte kein Platz)", name _from, getPlayerUID _from, _val, _name]] remoteExec ["XYDB_fnc_log", XYDB];
XY_forceSaveTime = time + 5;