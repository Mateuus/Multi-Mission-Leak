#include "..\script_macros.hpp"

{
	switch (side _x) do {
		case civilian:{
			switch (uniform _x) do {
				case "U_I_CombatUniform": { _x setObjectTexture[0,"textures\Tenues\Civil\costume.jpg"] };
				case "U_Rangemaster": { if(life_adac_onDuty && life_job > 0) then {
											_x setObjectTexture[0,"textures\Tenues\Dep\recruit_uniform_adac.paa"];
											if(backpack _x == "B_Kitbag_mcamo") then {
												unitBackpack _x setObjectTexture[0,"textures\Tenues\Dep\adac_backpack.paa"];
											}
										} else { _x setObjectTexture[0,"textures\Tenues\Civil\cravate.jpg"] };
									  };
			};
		};
		case west:{
			switch (uniform _x) do {
				case "U_Rangemaster": { _x setObjectTexture[0,"textures\Tenues\Gendarme\polo-police.jpg"] };
				case "U_B_CombatUniform_mcam": { _x setObjectTexture[0,"textures\Tenues\Gendarme\uniforme-police.jpg"] };
				case "U_B_CombatUniform_mcam_worn": { _x setObjectTexture[0,"textures\Tenues\Gendarme\polaire.jpg"] };
				case "U_B_CTRG_3": { _x setObjectTexture[0,"textures\Tenues\Gendarme\gign.jpg"] };
				case "U_B_CTRG_1": { _x setObjectTexture[0,"textures\Tenues\Gendarme\tenue-Haute-visibilite.jpg"] };
				case "U_B_CombatUniform_mcam_vest": { _x setObjectTexture[0,"textures\Tenues\Gendarme\encadrement.jpg"] };
				case "U_O_OfficerUniform_ocamo": { _x setObjectTexture[0,"textures\Tenues\Gendarme\sombre.jpg"] };
				case "U_Marshal": { _x setObjectTexture[0,"textures\Tenues\Gendarme\polo-municipale.jpg"] };
				case "U_BG_Guerrilla_6_1": { if(FETCH_CONST(life_donator)>= 2) then { _x setObjectTexture[0,"textures\Tenues\Gendarme\froid.jpg"] } };
			    case "U_O_T_Officer_F": { _x setObjectTexture[0,"textures\Tenues\Gendarme\douane-grade.jpg"] };
			    case "U_Competitor": { _x setObjectTexture[0,"textures\Tenues\Gendarme\douane-recru.jpg"] };
			};
			unitBackpack _x setObjectTexture[0,""];
		};
		case independent:{
			switch (uniform _x) do {
				case :"U_Rangemaster": { _x setObjectTexture[0,"textures\Tenues\Samu\stagiaire.jpg"] };
				case :"U_B_CTRG_1": {
					switch (_x getVariable["rank", 0]) do {
						case 2: { _x setObjectTexture[0,"textures\Tenues\Samu\infirmier.jpg"] };
						case 3: { _x setObjectTexture[0,"textures\Tenues\Samu\interne.paa"] };
						case 4: { _x setObjectTexture[0,"textures\Tenues\Samu\medecin.paa"] };
						case 5: {_x setObjectTexture[0,"textures\Tenues\Samu\medecin-chef.paa"] };
				};
			}
			unitBackpack _x setObjectTexture[0,""];
		};

		case east:{
			if(uniform _x == "U_B_CombatUniform_mcam") then { _x setObjectTexture[0,"textures\Tenues\armer\Uniform126.jpg"] };
			if(Backpack _x == "B_Kitbag_mcamo") then { unitBackpack _x setObjectTexture[0,"textures\Tenues\armer\Sac126.jpg"] };
			unitBackpack _x setObjectTexture[0,""];
		};

	};
} forEach allPlayers;
