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
	["_license","",[""]]
];

if (_license isEqualTo "") exitWith {};

private _success = false;
private _has = _license in AN_Licenses;

if !(_has) then 
{
    AN_Licenses pushBack _license;
	_success = true;
};

_success