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
    ["_wantedList",[],[[]]]
];

try
{
    disableSerialization;
    private _display = findDisplay 56874;

    if (isNull _display) then 
    {
        throw "Wanted List GUI doesn't exist";
    };

    private _title = _display displayCtrl 1001;
    private _list = _display displayCtrl 1500;

    if (_wantedList isEqualTo [] OR {count _wantedList isEqualTo 0}) then 
    {
        _title ctrlSetText "Wanted Felons (0 Found)";
        ctrlShow [2403,true];
        ctrlShow [2405,true];
        ctrlEnable [2405,((call life_coplevel) >= (getNumber (missionConfigFile >> "CfgWanted" >> "addlevel")))];
        throw "No Active Wanted Felons";
    };

    lbClear _list;

    {
        private _index = _list lbAdd (_x select 2);
        _list lbSetData [_index,str(_x)];
    } forEach _wantedList;

    _title ctrlSetText format ["Wanted Felons (%1 Found)",str (lbSize _list)];  
    ctrlShow [2403,true];
    ctrlShow [2405,true];  
    ctrlEnable [2405,((call life_coplevel) >= (getNumber (missionConfigFile >> "CfgWanted" >> "addlevel")))];
}
catch
{
    hintSilent _exception;
};