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
    ["_info",[],[[]]],
    ["_side",[],[[]]]
];

try
{
    if (count _info isEqualTo 0 OR {count _side isEqualTo 0}) then
    {
        throw "ERROR CIV - Obtaining Info";
    };

    if (!isNil "life_coplevel" OR {!isNil "life_medicLevel"} OR {!isNil "life_adminlevel"}) then
    {
        throw "ERROR CIV - VARIABLES DEFINED";
    };

    _info params [
        ["_uid","",[""]],
        ["_cash","",[""]],
        ["_bank","",[""]],
        ["_admin",0,[0]],
        ["_donator",0,[0]]
    ];

    if !((getPlayerUID player) isEqualTo _uid) then
    {
        throw "ERROR CIV - CORRUPT INFO";
    };
    an_cash = parseNumber _cash;
    an_bank = parseNumber _bank;
    ancash_box = an_cash;
    anbank_box = an_bank;

    life_adminlevel = compileFinal str (_admin);
    life_donatorlevel = compileFinal str (_donator);

    _side params [
        ["_licenses",[],[[]]],
        ["_gear",[],[[]]],
        ["_atime",0,[0]],
        ["_areason",[],[[]]],
        ["_level","",[""]],
        ["_exp","",[""]],
        ["_skill",[],[[]]],
        ["_spoints","",[""]],
        ["_gangData",[],[[]]],
        ["_voted",false,[false]],
        ["_newPlayer",false,[false]],
        ["_idDetails",[],[[]]],
        ["_lawyer",false,[false]]
    ];

    if !((count _licenses) isEqualTo 0) then
    {
        {
            private _stringL = [_x,true] call life_fnc_licenseConvert;
            AN_Licenses pushBack _stringL;
        } forEach _licenses;
    };

    private _swuyecamar = profileNamespace getVariable "swuyecamar";
    if (!isNil "_swuyecamar" && (playerSide != independent)) then
    {
        if (playerSide isEqualTo _swuyecamar) then
        {
            life_gear = [];
            profileNamespace setVariable ["swuyecamar",nil];
            saveProfileNamespace;
            [3] call life_fnc_maphuwres;
        };
    }
    else
    {
        life_gear = _gear;
    };

    life_coplevel = 0;
    life_medicLevel = 0;
    life_asqmedic = 0;
    life_swatlevel = 0;
    life_cglevel = 0;
    life_asqlevel = 0;
    life_detective = 0;

    life_arrested_time = _atime;
    if ((count _areason) > 0) then
    {
        life_arrested_reason = (_areason select 0);
    }
    else
    {
        life_arrested_reason = "";
    };

    life_level = parseNumber _level;
    life_exp = parseNumber _exp;

    if !((count _skill) isEqualTo 0) then
    {
        {
            private _string = [_x,true] call life_fnc_skillsConvert;
            AN_Skills pushBack _string;
        } forEach _skill
    };
    life_skillpoint = parseNumber _spoints;

    if ((count _gangData) isEqualTo 0) then
    {
        throw "Player Data Error - Gang Data";
    };
    life_gangData = _gangData;
    life_voted = _voted;
    life_newPlayer = _newPlayer;
    PlayerIDArray = _idDetails;
    life_lawyer = _lawyer;
    life_isGov = if ((getPlayerUID player) isEqualTo (life_gov select 0)) then {true} else {false};
    call life_fnc_bebafacr;
    life_coplevel = compileFinal str(life_coplevel);
    life_medicLevel = compileFinal str(life_medicLevel);
    life_swatlevel = compileFinal str(life_swatlevel);
    life_cglevel = compileFinal str(life_cglevel);
    life_asqlevel = compileFinal str(life_asqlevel);
    life_detective = compileFinal str(life_detective);
    life_asqmedic = compileFinal str(life_asqmedic);

    [life_gear] call life_fnc_thadresw;
    PlayerPrep = true;
}
catch
{
    diag_log _exception;
};
