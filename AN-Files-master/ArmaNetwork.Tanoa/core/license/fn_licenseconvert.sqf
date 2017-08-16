/*
    ArmA.Network
    Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
params [
	["_license","",["",0]],
    ["_type",false,[false]]
];

if (_license isEqualTo "" OR {_license isEqualTo 0}) exitWith {};

private _return = -1;

if (_type) then 
{
    _return = getText (missionConfigFile >> "CfgLicenseNumbers" >> format["license_%1",_license] >> "name");
}
else
{
    _return = getNumber (missionConfigFile >> "Licenses" >> _license >> "number");
};

if (_return isEqualTo -1) exitWith {};

_return