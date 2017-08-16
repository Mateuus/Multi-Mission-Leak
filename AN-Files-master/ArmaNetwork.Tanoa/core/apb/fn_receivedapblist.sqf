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
    ["_apbList",[],[[]]]
];

try
{
    disableSerialization;
    private _display = findDisplay 56872;

    if (isNull _display) then 
    {
        throw "APB GUI doesn't exist";
    };

    private _title = _display displayCtrl 1003;
    private _list = _display displayCtrl 1500;

    if (_apbList isEqualTo [] OR {count _apbList isEqualTo 0}) then 
    {
        _title ctrlSetText "Active APBs (0 Found)";
        ctrlShow [2400,true];
        ctrlShow [2401,true];
        throw "No APBs Found";
    };

    lbClear _list;

    {
        private _description = _x select 2;
        if (_x select 6 isEqualTo 1) then
        {
            _description = _description + " [URGENT]";
        };
        if (_x select 5 isEqualTo profileName && {isNil "life_apb_task"}) then 
        {   
            private _coords = call compile (_x select 7);
            [1,(_x select 2),(_x select 3),_coords] call life_fnc_apbNotification;
        };
        private _index = _list lbAdd _description;
        _list lbSetData [_index,str(_x)];
    } forEach _apbList;

    _title ctrlSetText format ["Active APBs (%1 Found)",str (lbSize _list)];  
    ctrlShow [2400,true];
    ctrlShow [2401,true];   
}
catch
{
   hintSilent _exception;
};
