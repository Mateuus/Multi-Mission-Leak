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
		throw "ERROR EMS - INFO DOESNT EXIST";
	};

	if (!isNil "life_coplevel" OR {!isNil "life_medicLevel"}) then
	{
		throw "ERROR EMS - VARIABLE DEFINED";
	};

	if !((getPlayerUID player) isEqualTo (_info select 0)) then
	{
		throw "ERROR EMS - INFO CORRUPT";
	};

	an_cash = parseNumber (_info select 1);
	an_bank = parseNumber (_info select 2);
	ancash_box = an_cash;
	anbank_box = an_bank;
	life_adminlevel = compileFinal str (_info select 3);
	life_donatorlevel = compileFinal str (_info select 4);

	life_coplevel = 0;
	life_medicLevel = 0;
	life_asqmedic = 0;
	life_swatlevel = 0;
	life_cglevel = 0;
	life_asqlevel = 0;
	life_detective = 0;

	life_medicLevel = compileFinal str (_side select 0);
	life_asqmedic = compileFinal str (_side select 1);
	life_coplevel = compileFinal str (life_coplevel);
	life_swatlevel = compileFinal str (life_swatlevel);
	life_cglevel = compileFinal str (life_cglevel);
	life_asqlevel = compileFinal str (life_asqlevel);
	life_detective = compileFinal str (life_detective);
	life_rambofactor = 10;
	call life_fnc_bebafacr;
	private _swuyecamar = profileNamespace getVariable "swuyecamar";
	if (!isNil "_swuyecamar" && {playerSide != independent}) then
	{
		if (playerSide isEqualTo _swuyecamar) then
		{
			life_gear = [];
			profileNamespace setVariable["swuyecamar",nil];
			saveProfileNamespace;
			AN_Inventory = [];
			[3] call life_fnc_maphuwres;
		};
	}
	else
	{
		life_gear = (_side select 2);
	};

	[life_gear] call life_fnc_thadresw;
	PlayerPrep = true;
}
catch
{
	diag_log _exception;
};
