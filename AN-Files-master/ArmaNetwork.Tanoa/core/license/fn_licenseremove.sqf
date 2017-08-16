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
	["_license","",[""]],
    ["_hint",false,[false]]
];

if (_license isEqualTo "") exitWith {};

private _success = false;
private _index = AN_Licenses find _license;

if !(_index isEqualTo -1) then
{
	AN_Licenses deleteAt _index;
    _success = true;
    if (_hint) then
    {
        hintSilent format ["%1 was removed!",localize getText (missionConfigFile >> "Licenses" >> _license >> "displayName")];
    };
};

_success
