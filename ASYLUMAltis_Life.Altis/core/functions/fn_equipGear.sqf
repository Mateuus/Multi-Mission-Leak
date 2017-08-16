/*
	File: fn_equipGear.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initializes custom gear textures
*/

private ["_customTexture","_hiddenTextures"];

_customTexture = switch (uniform player) do
{
	case "U_Rangemaster":
	{
		switch(life_coplevel) do
		{
			case 0;
			case 1: { "images\c_poloshirtpants_police_cadet_co.jpg" };
			case 2: { "images\police_rangemaster_constable.jpg" };
			case 3: { "images\police_rangemaster_corporal.jpg" };
			default { "images\c_poloshirtpants_police_lieutenant_co.jpg" };
		};
	};
	case "U_Competitor": { "images\c_poloshirtpants_police_cadet_co.jpg" };
	case "U_B_CombatUniform_mcam_worn": 
	{ 
		if (life_activeSWAT) then { "images\c_combat_police_co.jpg" }
		else
		{
			switch(life_coplevel) do
			{
				case 4: { "images\police_combatu_sgt.jpg" };
				case 5: { "images\police_combatu_lt.jpg" };
				case 6: { "images\police_combatu_captain.jpg" };
				default { "images\police_combatu_sgt.jpg" };
			};
		};
	};
	case "U_I_CombatUniform_shortsleeve": { "images\medic_uniform.jpg" };
	case "U_C_Scientist": { "images\prisoner_uniform.jpg" };
	default { "" };
};

if (_customTexture == "") then
{
	if ((player getVariable ["customTexture", ["",""]]) select 0 != uniform player) then
	{
		if (uniform player != "") then { player setVariable ["customTexture", nil, true]; };
		_hiddenTextures = getArray(configFile >> "CfgWeapons" >> (uniform player) >> "hiddenSelectionsTextures");
		if (count _hiddenTextures > 0) then { [[player,_hiddenTextures select 0],"life_fnc_setUniform",true,false] spawn BIS_fnc_MP; };
	}
	else
	{
		[[player,player getVariable ["customTexture", ["",""]]],"life_fnc_setUniform",true,false] spawn BIS_fnc_MP;
	};
}
else
{
	_customTexture = [uniform player, _customTexture];
	[[player,_customTexture],"life_fnc_setUniform",true,false] spawn BIS_fnc_MP;
	player setVariable ["customTexture", _customTexture, true];
};