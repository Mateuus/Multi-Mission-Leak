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
    if ((lbCurSel 1500) isEqualTo -1) then
    {
        throw "You must select a License to remove";
    };

    if (isNil "Detainee") then
    {
        closeDialog 0;
        throw "You must detain someone to remove licenses";
    };

    private _license = lbData [1500,(lbCurSel 1500)];

    if (_license in ["id"]) then
    {
        throw "You cannot remove that License/Training";
    };
    /*
    if ((call life_coplevel) < 4) then
    {
        throw "You're not high enough rank to do this!";
    };
    */
    [_license,true] remoteExecCall ["life_fnc_licenseRemove",Detainee];

    hintSilent format ["You've removed %1's %2",Detainee getVariable ["name",name Detainee],localize getText (missionConfigFile >> "Licenses" >> _license >> "displayName")];

    closeDialog 0;
}
catch
{
    hintSilent _exception;
};
