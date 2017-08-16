/*
	ArmA.Network
	Author: Rathbone
	Copyright (c) ArmA.Network 2016

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
		throw "ERROR COP - INFO DOESNT EXIST";
	};

	if (!isNil "life_coplevel" OR {!isNil "life_medicLevel"}) then
	{
		throw "ERROR COP - VARIABLE DEFINED";
	};

	if !((getPlayerUID player) isEqualTo (_info select 0)) then
	{
		throw "ERROR COP - INFO CORRUPT";
	};

	an_cash = parseNumber (_info select 1);
	an_bank = parseNumber (_info select 2);
	ancash_box = an_cash;
	anbank_box = an_bank;
	life_adminlevel = compileFinal str(_info select 3);
	life_donatorlevel = compileFinal str(_info select 4);

	life_coplevel = 0;
	life_medicLevel = 0;
	life_swatlevel = 0;
	life_cglevel = 0;
	life_asqlevel = 0;
	life_detective = 0;
	life_asqmedic = 0;

	life_coplevel = compileFinal str (_side select 0);
	life_swatlevel = compileFinal str (_side select 1);
	life_cglevel = compileFinal str (_side select 2);
	life_asqlevel = compileFinal str (_side select 3);
	life_detective = compileFinal str (_side select 4);
	life_medicLevel = compileFinal str (life_medicLevel);
	life_asqmedic = compileFinal str (life_asqmedic);
	life_rambofactor = 2;
	call life_fnc_bebafacr;
	private _swuyecamar = profileNamespace getVariable "swuyecamar";
	if (!isNil "_swuyecamar" && {playerSide != independent}) then
	{
		if (playerSide isEqualTo _swuyecamar) then
		{
			life_gear = [];
			profileNamespace setVariable["swuyecamar",nil];
			saveProfileNamespace;
			[3] call life_fnc_maphuwres;
		};
	}
	else
	{
		life_gear = (_side select 5);
	};

	[life_gear] call life_fnc_thadresw;
	["driver"] call life_fnc_licenseAdd;
	PlayerPrep = true;
}
catch
{
	diag_log _exception;
};
