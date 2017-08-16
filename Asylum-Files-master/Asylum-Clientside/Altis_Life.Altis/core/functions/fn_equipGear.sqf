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
	case "U_O_PilotCoveralls": { if (life_coplevel > 0 && !(life_copRole in ["detective","all"])) then { "images\c_coveralls_police.jpg" } else { "" }; };
	case "U_Competitor": { "images\c_poloshirtpants_police_cadet_co.jpg" };
	case "U_O_CombatUniform_ocamo": { "images\c_uniform_csat.jpg" };
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
		if (uniform player != "") then { player setVariable ["customTexture", nil, true];  diag_log format["[equipGear 1] CT = %1", player getVariable ["customTexture", "Nadda"]]; };
		_hiddenTextures = getArray(configFile >> "CfgWeapons" >> (uniform player) >> "hiddenSelectionsTextures");
		if (count _hiddenTextures > 0) then { [[player,_hiddenTextures select 0],"life_fnc_setUniform",true,false] spawn life_fnc_MP; };
	}
	else
	{
		[[player,player getVariable ["customTexture", ["",""]]],"life_fnc_setUniform",true,false] spawn life_fnc_MP;
	};
}
else
{
	_customTexture = [uniform player, _customTexture];
	[[player,_customTexture],"life_fnc_setUniform",true,false] spawn life_fnc_MP;
	player setVariable ["customTexture", _customTexture, true];
};

if ((player getVariable ["customTextureBP", ["",""]]) select 0 != backpack player) then
{
	if (backpack player != "") then { player setVariable ["customTextureBP", nil, true]; };
	_hiddenTextures = getArray(configFile >> "CfgVehicles" >> (backpack player) >> "hiddenSelectionsTextures");
	if (count _hiddenTextures > 0) then { [[player,_hiddenTextures select 0, true],"life_fnc_setUniform",true,false] spawn life_fnc_MP; };
}
else
{
	[[player,player getVariable ["customTextureBP", ["",""]], true],"life_fnc_setUniform",true,false] spawn life_fnc_MP;
};