/*
    ArmA.Network
    Rathbone
    (c) ArmA.Network 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
params [
	["_police",objNull,[objNull]]
];

if (isNull _police) exitWith {};
if (isNil "_police") exitWith {};

[AN_Licenses,player] remoteExecCall ["life_fnc_licenseRead",_police];
