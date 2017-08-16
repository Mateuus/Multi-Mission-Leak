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
	  ["_licenses",[],[[]]],
      ["_detainee",objNull,[objNull]]
];

try
{
    if (isNull _detainee) then
    {
        throw "Civilian doesn't exist";
    };

    if !(isNil "Detainee") then
    {
        throw "You're already checking someone else's licenses!";
    };

    if ((count _licenses) isEqualTo 0) then
    {
        throw "The Civilian does not have any licenses on him";
    };

    if (dialog) then
    {
        throw "Dialog Error";
    };

    Detainee = _detainee;

    createDialog "license_overview";
		hint format["Searching %1",name (Detainee)];

    private _display = findDisplay 85240;
    private _list = _display displayCtrl 1500;

    _display displayAddEventHandler ["Unload",
        {
            Detainee = nil;
        }
    ];

    lbClear _list;

    {
        private _license = _x;
        private _index = _list lbAdd format ["%1",localize getText (missionConfigFile >> "Licenses" >> _license >> "displayName")];
        _list lbSetData [_index,_license];
    } forEach _licenses;
}
catch
{
    hintSilent _exception;
};
