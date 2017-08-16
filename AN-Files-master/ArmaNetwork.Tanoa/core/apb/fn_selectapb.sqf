/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

if (lbCurSel 1500 isEqualTo -1) exitWith {};

if !(ctrlVisible 2402) then 
{
    ctrlShow [2402,true];
    ctrlShow [2403,true];
};

disableSerialization;
private _display = findDisplay 56872;
private _text = _display displayCtrl 1100;
private _deleteB = _display displayCtrl 2403;
private _respond = _display displayCtrl 2402;
private _map = _display displayCtrl 1101;

private _control = _this select 0;
private _index = _this select 1;

private _data = call compile (_control lbData _index);

_data params [
    ["_id",0,[0]],
    ["_playerID","",[""]],
    ["_title","",[""]],
    ["_desc","",[""]],
    ["_info","",[""]],
    ["_unit","",[""]],
    ["_emergency",0,[0]],
    ["_coords","",[""]]
];

_emergency = if (_emergency isEqualTo 1) then {"URGENT"} else {"OPTIONAL"};
_coords = call compile _coords;

_text ctrlSetStructuredText parseText format [
    "<t align = 'center'>%1</t><br/>
    <t align = 'left'> Description: %2<br/>
    Additional Info: %3<br/>
    Responding Units: %4<br/>
    Emergency: %5",
    _title,
    _desc,
    _info,
    _unit,
    _emergency
];

_map ctrlMapAnimAdd [1, 0.1, _coords];
ctrlMapAnimCommit _map;

if !(ctrlShown _deleteB) then 
{
    _deleteB ctrlShow true;
    _respond ctrlShow true;
};

if (_unit isEqualTo profileName && {!isNil "life_apb_task"}) then 
{
    _deleteB ctrlEnable true;
}
else
{
    _deleteB ctrlEnable false;
};

if (_unit isEqualTo "OPEN" && {isNil "life_apb_task"}) then 
{
    _respond ctrlEnable true; 
}
else
{
    _respond ctrlEnable false;
};