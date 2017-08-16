/*
	File: fn_crafting_config.sqf
	Author: Barney

	Description:
	Crafting Config, THINGS U NEED!!!!!




	EXAMPLE:
	[
		"The Classname of Item being crafted",
		[[]],                 -            Array of Virtual Items u need for crafting!
		1                     -            Delay for Crafting, increase this for longer Crafting
	]


	If u have no clue what this aboce means DON´T TOUCH THIS!!!

	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

private ["_case","_item","_fail","_needed"];
_case = param[0,-1,[-1]];
_item = param[1,-1,[-1]];
_fail = false;
_needed = [];





switch (_case) do {   //LOL!

	case 0: {
			_needed =
			[
				["arifle_Katiba_F",[["iron_r",1]],1],
				["srifle_DMR_06_camo_F",[["iron_r",5]],1]




			];
	};





	case 1: {
			_needed =
			[
				["hgun_ACPC2_F",[["iron_r",1]],1],
				["hgun_Pistol_heavy_01_F",[["iron_r",5]],1]




			];
	};

	case 2: {
			_needed =
			[
				["U_B_CTRG_3",[["iron_r",1]],1]




			];
	};


	case 3: {
			_needed =
			[
				["B_MRAP_01_F",[["iron_r",5]],1]




			];
	};
	default {_fail = true;};
};


if(_fail) exitWith {hint "Fehler 2"; diag_log "Fehler Switch/case Anwendung - File: fn_crafting_config - line 79";};

if(_item != -1) then {
	_needed = _needed select _item;
};




_needed;




