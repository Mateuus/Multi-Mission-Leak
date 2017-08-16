#include "..\..\script_macros.hpp"
switch (playerSide) do {
	case civilian: { //Civil
		switch (uniform player) do {
			case "U_I_CombatUniform": { [[player,0,"textures\Tenues\Civil\costume.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_Rangemaster": { [[player,0,"textures\Tenues\Civil\cravate.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
		};
	};
	case west: { //Gendarmerie
		switch (uniform player) do {
			case "U_Rangemaster": { [[player,0,"textures\Tenues\Gendarme\polo-police.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_B_CombatUniform_mcam": { [[player,0,"textures\Tenues\Gendarme\uniforme-police.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_B_CombatUniform_mcam_worn": { [[player,0,"textures\Tenues\Gendarme\polaire.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_B_CTRG_3": { [[player,0,"textures\Tenues\Gendarme\gign.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_C_Scientist": { [[player,0,"textures\Tenues\Gendarme\tenue_bia.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_B_CombatUniform_mcam_vest": { [[player,0,"textures\Tenues\Gendarme\encadrement.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_O_OfficerUniform_ocamo": { [[player,0,"textures\Tenues\Gendarme\sombre.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_Marshal": { [[player,0,"textures\Tenues\Gendarme\polo-municipale.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_O_T_Officer_F": { [[player,0,"textures\Tenues\Gendarme\douane-grade.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_Competitor": { [[player,0,"textures\Tenues\Gendarme\douane-recru.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_B_CTRG_1": { [[player,0,"textures\Tenues\Gendarme\tenue-Haute-visibilite.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
		};
	};
	case independent: { //Samu
		switch (uniform player) do {
			case "U_Rangemaster": { [[player,0,"textures\Tenues\Samu\stagiaire.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
			case "U_B_CTRG_1": {
				switch (player GVAR["rank", 0]) do {
					case 2: { [[player,0,"textures\Tenues\Samu\infirmier.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
					case 3: { [[player,0,"textures\Tenues\Samu\interne.paa"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
					case 4: { [[player,0,"textures\Tenues\Samu\medecin.paa"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
					case 5: { [[player,0,"textures\Tenues\Samu\medecin-chef.paa"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
				};
			};
		};
	};
	case east: { //Armée
		switch (uniform player) do {
			case "U_B_CombatUniform_mcam": { [[player,0,"textures\Tenues\armer\Uniform126.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP; };
		};
	};
};
if(life_adac_onDuty && life_job > 0 && playerSide == civilian && {uniform player == "U_Rangemaster"}) then {
	[[player,0,"textures\Tenues\Dep\recruit_uniform_adac.paa"],"life_fnc_setTexture",true,false] call life_fnc_MP;
};
if(life_adac_onDuty && life_job > 0 && playerSide == civilian && {backpack player == "B_Kitbag_mcamo"}) then {
	[[unitBackpack player,0,"textures\Tenues\Dep\adac_backpack.paa"],"life_fnc_setTexture",true,false] call life_fnc_MP;
};
if(playerSide == west && (FETCH_CONST(life_donator)>= 2) && {uniform player == "U_BG_Guerrilla_6_1"}) then
{
	[[player,0,"textures\Tenues\Gendarme\froid.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP;
};
if(playerSide == west || playerSide == independent) then {
	if(backpack player != "") then {
		(unitBackpack player) setObjectTextureGlobal [0,""];
	};
};
//armer
if((playerSide == east) && {Backpack player == "B_Kitbag_mcamo"}) then {
  	(unitBackpack player) setObjectTextureGlobal [0,"textures\Tenues\armer\Sac126.jpg"];
};
