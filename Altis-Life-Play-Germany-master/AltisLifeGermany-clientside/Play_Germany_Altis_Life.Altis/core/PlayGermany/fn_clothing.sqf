#include <macro.h>
/*
	File : fn_clothing.sqf
	Author: RafiQuak for PlayGermany

	Description:
	Creates the custom clothing textures
*/
switch (playerSide) do {
	case west: {
		switch (uniform player) do {
			case "U_Rangemaster": {
				player setObjectTextureGlobal [0,"textures\uniforms\Anwaerter_Polizeimeister.paa"];
			};
			case "U_B_CombatUniform_mcam_vest": {
				player setObjectTextureGlobal [0,"textures\uniforms\SEK_Uniform.paa"];
			};
			case "U_B_CombatUniform_mcam": {
				switch (FETCH_CONST(life_coplevel)) do {
					case 1: {
						player setObjectTextureGlobal [0,"textures\uniforms\polizei_uniform_einsatz_coplvl1.paa"];
						};
					case 2: {
						player setObjectTextureGlobal [0,"textures\uniforms\polizei_uniform_einsatz_coplvl2.paa"];
						};
					case 3: {
						player setObjectTextureGlobal [0,"textures\uniforms\polizei_uniform_einsatz_coplvl3.paa"];
						};
					case 4: {
						player setObjectTextureGlobal [0,"textures\uniforms\polizei_uniform_einsatz_coplvl4.paa"];
						};
					case 5: {
						player setObjectTextureGlobal [0,"textures\uniforms\polizei_uniform_einsatz_coplvl5.paa"];
						};
					case 6: {
						player setObjectTextureGlobal [0,"textures\uniforms\polizei_uniform_einsatz_coplvl6.paa"];
						};
					case 8;
					case 7: {
						player setObjectTextureGlobal [0,"textures\uniforms\polizei_uniform_einsatz_coplvl7.paa"];
						};
				};
			};
			case "U_B_CombatUniform_mcam_worn": {
				player setObjectTextureGlobal [0,"textures\uniforms\Jaeger_Wald.paa"];
			};
			case "U_IG_Guerilla3_2": {
				switch (FETCH_CONST(life_coplevel)) do {
					case 4: {
						player setObjectTextureGlobal [0,"textures\uniforms\pulli_ok.paa"];
						};
					case 5: {
						player setObjectTextureGlobal [0,"textures\uniforms\pulli_hk.paa"];
						};
					case 6: {
						player setObjectTextureGlobal [0,"textures\uniforms\pulli_bp.paa"];
						};
					case 8;
					case 7: {
						player setObjectTextureGlobal [0,"textures\uniforms\pulli_chef.paa"];
						};
				};
			};
			default {
				_textureArray = getObjectTextures player;
				{player setObjectTextureGlobal [_forEachIndex,_x];} forEach _textureArray;
			};
		};
		if(backpack player == "B_Carryall_mcamo") then {
			unitBackpack player setObjectTextureGlobal [0,""];
		};
	};
	case east: {
		if(uniform player == "U_B_CombatUniform_mcam_vest") then {
			player setObjectTextureGlobal [0,"textures\uniforms\ASF_uniform.paa"];
		};
		if(backpack player != "") then {
			unitBackpack player setObjectTextureGlobal [0,""];
		};
	};
	case independent: {
		switch (uniform player) do {
		
			case "U_I_HeliPilotCoveralls": {
				switch (life_hsd) do {
					case "med": {
						player setObjectTextureGlobal [0,"textures\uniforms\THW_Uniform.paa"];
					};
					case "alac": {
						player setObjectTextureGlobal [0,"textures\uniforms\THW_Uniform.paa"];
					};
					case "thw": {
						player setObjectTextureGlobal [0,"textures\uniforms\THW_Uniform.paa"];
					};
					case "event": {
					};
				};
			};
			
			case "U_NikosAgedBody": {
				player setObjectTextureGlobal [0,"textures\uniforms\event.paa"];
			};
			
			case "U_Rangemaster": {
				player setObjectTextureGlobal [0,"textures\uniforms\THW_Praktikant.paa"];
			};
			
			case "U_O_OfficerUniform_ocamo": {
				player setObjectTextureGlobal [0,"textures\uniforms\THW_Praesident.paa"];
			};
		};
		
		switch (backpack player) do {
			case "B_Kitbag_sgg": {
				unitBackpack player setObjectTextureGlobal [0,"textures\uniforms\Medic_Backpack.paa"];
			};
			default {
				unitBackpack player setObjectTextureGlobal [0,""];
			};
		};
	};
	case civilian: {
		if (uniform player == "U_B_CombatUniform_mcam") then {
			//player setObjectTextureGlobal [0,"textures\uniforms\ALG_civ_uniform.paa"];
			switch (group player getVariable ["gang_id",-1]) do {
				case 2130: { //N7
					player setObjectTextureGlobal [0,"textures\uniforms\n7.paa"];
				};
				case 1202: { //th
					player setObjectTextureGlobal [0,"textures\uniforms\th.paa"];
				};
				case 1025: { //easy
					player setObjectTextureGlobal [0,"textures\uniforms\ez.paa"];
				};
				case 1301: { //vk
					player setObjectTextureGlobal [0,"textures\uniforms\vk.paa"];
				};
				case 1700: { //rs
					player setObjectTextureGlobal [0,"textures\uniforms\rs.paa"];
				};
				case 1: { //gssd
					player setObjectTextureGlobal [0,"textures\uniforms\gssd.paa"];
				};
				case 2829: { //ghost
					player setObjectTextureGlobal [0,"textures\uniforms\ghost.paa"];
				};
				case 1845: { //sec
					player setObjectTextureGlobal [0,"textures\uniforms\sec.paa"];
				};
				case 2605: { //ks
					player setObjectTextureGlobal [0,"textures\uniforms\ks.paa"];
				};
				case 2406: { //bb
					player setObjectTextureGlobal [0,"textures\uniforms\bb.paa"];
				};
				case 2402: { //gjr
					player setObjectTextureGlobal [0,"textures\uniforms\gjr.paa"];
				};
				case 2165: { //sh
					player setObjectTextureGlobal [0,"textures\uniforms\sh.paa"];
				};
				case 2563: { //br
					player setObjectTextureGlobal [0,"textures\uniforms\br.paa"];
				};
				case 1845: { //hfu
					player setObjectTextureGlobal [0,"textures\uniforms\hfu.paa"];
				};
				case 2756: { //bw
					player setObjectTextureGlobal [0,"textures\uniforms\bw.paa"];
				};
				case 2913: { //independent army
					player setObjectTextureGlobal [0,"textures\uniforms\ipa.paa"];
				};
				case 2749: { //deova
					player setObjectTextureGlobal [0,"textures\uniforms\deova.paa"];
				};
				case 2898: { //outlaw
					player setObjectTextureGlobal [0,"textures\uniforms\outlaw.paa"];
				};
			};
		} else {
			_textureArray = getObjectTextures player;
			{player setObjectTextureGlobal [_forEachIndex,_x];} forEach _textureArray;
		};
	};
};

player setVariable ["textures",getObjectTextures player,true];