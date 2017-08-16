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

disableSerialization;
private _display = findDisplay 56874;
private _text = _display displayCtrl 1100;
private _pardon = _display displayCtrl 2400;
private _updateL = _display displayCtrl 2401;
private _bountyB = _display displayCtrl 2404;
private _additionalC = _display displayCtrl 2402;
private _map = _display displayCtrl 1101;
private _crimeList = _display displayCtrl 1501;

private _control = _this select 0;
private _index = _this select 1;

private _data = call compile (_control lbData _index);

if !(ctrlShown _crimeList) then 
{
    {
        _x ctrlShow true;
    } forEach [_crimeList,_pardon,_updateL,_bountyB,_additionalC];
};

lbClear _crimeList;

_data params [
    ["_id",0,[0]],
    ["_playerID","",[""]],
    ["_name","",[""]],
    ["_info","",[""]],
    ["_crimes",[],[[]]],
    ["_coords","",[""]],
    ["_bounty","",[""]]
];

_coords = call compile _coords;

_text ctrlSetStructuredText parseText format [
    "<t align = 'center'>%1</t><br/>
    <t align = 'left'> Additional Info: %2<br/>
    Bounty: $%3</t>",
    _name,
    _info,
    _bounty
];

_map ctrlMapAnimAdd [1, 0.1, _coords];
ctrlMapAnimCommit _map;

{
    private _displayName = getText (missionConfigFile >> "CfgWanted" >> _x select 0 >> "displayName");
    private _index = _crimeList lbAdd format ["%1x %2",str(_x select 1),_displayName];
} forEach _crimes;

if ((call life_coplevel) >= (getNumber (missionConfigFile >> "CfgWanted" >> "pardonlevel"))) then 
{
    _pardon ctrlEnable true;
}
else 
{
    _pardon ctrlEnable false;
};

if ((call life_coplevel) >= (getNumber (missionConfigFile >> "CfgWanted" >> "locationlevel"))) then 
{
    _updateL ctrlEnable true;
}
else 
{
    _updateL ctrlEnable false;
};

if (_bounty isEqualTo "0" && {(call life_coplevel) >= (getNumber (missionConfigFile >> "CfgWanted" >> "bountylevel"))}) then 
{
    _bountyB ctrlEnable true;
}
else
{
    _bountyB ctrlEnable false;
};

if ((call life_coplevel) >= (getNumber (missionConfigFile >> "CfgWanted" >> "chargelevel"))) then 
{
    _additionalC ctrlEnable true;
}
else 
{
    _additionalC ctrlEnable false;
};