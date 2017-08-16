/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
params [
    ["_gui",-1,[0]],
    ["_toAdd",-1,[0]]
];

try
{
    if (isNull (findDisplay 56874)) then 
    {
        throw "Wanted List GUI doesn't exist";
    };

    if (_gui isEqualTo -1 OR {_toAdd isEqualTo -1}) then 
    {
        throw "Wanted GUI Error = IDC not given";
    };

    if (lbCurSel _gui isEqualTo -1) then 
    {
        throw "You need to select a charge to add!";
    };
    
    disableSerialization;
    private _display = findDisplay 56874;
    private _crime = lbData [_gui,(lbCurSel _gui)];
    private _chargedCrimes = _display displayCtrl _toAdd;

    [TSOWantedCrimes,_crime,1,true] call life_fnc_arrayAdd;

    lbClear _chargedCrimes;

    {
        private _cr = _x select 0;
        private _amount = _x select 1;
        private _index = _chargedCrimes lbAdd format ["%1x %2", str (_amount), getText (missionConfigFile >> "CfgWanted" >> _cr >> "displayName")];
        _chargedCrimes lbSetData [_index,_cr];
    } forEach TSOWantedCrimes;  
}
catch
{
    hintSilent _exception;
};