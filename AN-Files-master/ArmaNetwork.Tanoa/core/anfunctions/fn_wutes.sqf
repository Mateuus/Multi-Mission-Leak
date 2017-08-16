/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
if ((lbCurSel 1500) isEqualTo -1) exitWith 
{
    hintSilent "You need to select a License to buy!";
};

private _data = lbData [1500,(lbCurSel 1500)];
_data = call compile format["%1",_data];
private _variable = _data select 0;
private _price = _data select 1;

if(_variable in ["driver","boat","pilot","gun"] && {!("id" in AN_Licenses)} && {!((count PlayerIDArray) isEqualTo 0)}) exitWith 
{
    hintSilent "You do not have a completed ID! Make sure you buy one and fill out the necessary details!";
};

if (an_cash < _price) exitWith 
{
    hintSilent "Not enough Cash";
};

closeDialog 0;
[_price,0,1] call life_fnc_sewawruk;
[_variable] call life_fnc_licenseAdd;
[2] call life_fnc_maphuwres;

