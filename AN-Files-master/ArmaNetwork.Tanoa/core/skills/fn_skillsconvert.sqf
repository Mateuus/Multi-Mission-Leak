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
	["_skill","",["",0]],
    ["_type",false,[true]]
];

if (_skill isEqualTo "" OR {_skill isEqualTo 0}) exitWith {};

private _return = -1;

if (_type) then 
{
    _return = getText (missionConfigFile >> "CfgSkillNumbers" >> format["skill_%1",_skill] >> "name");
}
else
{
    _return = getNumber (missionConfigFile >> "Skills" >> _skill >> "number");
};

if (_return isEqualTo -1) exitWith {};

_return