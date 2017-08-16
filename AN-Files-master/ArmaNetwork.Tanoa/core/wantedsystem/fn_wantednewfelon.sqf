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

    [1] call life_fnc_wantedMenuDisplay;

    TSOWantedCrimes = [];

    disableSerialization;
    private _display = findDisplay 56874;
    private _playerList = _display displayCtrl 3100;
    private _availableCrimes = _display displayCtrl 3500;
    private _chargedCrimes = _display displayCtrl 3501;

    lbClear _playerList;
    lbClear _availableCrimes;
    lbClear _chargedCrimes;

    private _fallBack = [];
    
    {
        if (alive _x && {side _x isEqualTo civilian}) then 
        {
            _fallBack pushBack _x;
        };
    } forEach (allPlayers - entities "HeadlessClient_F");


    {   
        private _name = name _x;
        private _index = _playerList lbAdd _name;
        _playerList lbSetData [_index,str(_x)];
    } forEach _fallBack;

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