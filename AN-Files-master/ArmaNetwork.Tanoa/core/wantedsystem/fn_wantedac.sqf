/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

try
{
    if (isNull (findDisplay 56874)) then 
    {
        throw "Wanted GUI Error - GUI not Found";
    };

    if !(isNil "TSOWantedCrimes") then 
    {
        throw "Wanted Internal Error - Array not nil";
    };

    private _data = lbData [1500,lbCurSel 1500];

    _data = call compile _data;

    [2] call life_fnc_wantedMenuDisplay;

    TSOWantedCrimes = [];

    disableSerialization;
    private _display = findDisplay 56874;
    private _suspectName = _display displayCtrl 4004;

    private _availableCrimes = _display displayCtrl 4500;
    private _chargedCrimes = _display displayCtrl 4501;

    lbClear _availableCrimes;
    lbClear _chargedCrimes;

    _suspectName ctrlSetText format ["Felon's Name: %1",_data select 2];

    {
        private _requirement = getText (_x >> "requirement");
        if (_requirement isEqualTo "") then 
        {
            _requirement = compile "true";
        }
        else 
        {
            _requirement = compile _requirement;
        };
        if (call _requirement) then 
        {
            private _index = _availableCrimes lbAdd getText (_x >> "displayName");
            _availableCrimes lbSetData [_index,configName _x];
        };
    } forEach ("true" configClasses (missionConfigFile >> "CfgWanted"));
}
catch
{
    hintSilent _exception;
};