/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _licenses = param[3,[],[[]]];
if((count _licenses) isEqualTo 0) exitWith {};

disableSerialization;
if (!dialog) then 
{
    createDialog "dmv_shop";
};

private _display = findDisplay 79874;
if (isNull _display) exitWith {};

private _listbox = _display displayCtrl 1500;
{
    private _variable = _x;
    private _hasLicense = [_variable,"bool"] call life_fnc_licenseFind;
    if !(_hasLicense) then 
    {
        private _displayName = localize getText (missionConfigFile >> "Licenses" >> _variable >> "displayName");
        private _price = getNumber (missionConfigFile >> "Licenses" >> _variable >> "price");
        private _index = _listbox lbAdd format ["%1 ($%2)",_displayName,_price];
        _listbox lbSetData [_index,str([_variable,_price])];
    };
} forEach _licenses;
