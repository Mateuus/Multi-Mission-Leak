/*
	File: fn_updateClothing.sqf
	Author: PerFecTiiNsKiLLz
*/

if (currentWeapon player in VerboteneWaffen) then {
    removeAllWeapons player;
};

if (vest player in VerboteneWesten) then {
    removevest player;
};

if ((call ES_adminlevel) == 0) then { 
    if (uniform player in VerboteneUniformen) then { removeUniform player; };
};

if (player getVariable "copSwitchSkin") exitWith {};

if(playerSide == civilian) then {

	if (uniform player == "U_C_Poloshirt_stripped") then {
	    player setObjectTextureGlobal [0,"Images\Skins\civ\zivi.paa"];
	};

	if (headgear player == "H_HelmetIA_net" && (license_civ_kskskin)) then {
	    player setObjectTextureGlobal [0,"Images\clans\ksk\headgear_helmet_canvas_co.paa"];
	};

	if (Backpack player == "B_Carryall_oucamo" && (license_civ_kskskin)) then {
		(unitBackpack player) setObjectTextureGlobal [0,""];
	};
	
	if (Backpack  player == "B_Carryall_oucamo" && ((call ES_donator) >= 2)) then {
    	(unitBackpack player) setObjectTextureGlobal [0,""];
	};

	if (uniform player == "U_C_Poloshirt_stripped" && ((call ES_donator) >= 2)) then {
	    player setObjectTextureGlobal [0, "Images\Skins\don\donyo.paa"];
    };
	
	if (uniform player == "U_C_Poloshirt_salmon" && ((call ES_donator) >= 2)) then {
	    player setObjectTextureGlobal [0, "Images\Skins\don\simp.paa"];
    };
	
	if (uniform player == "U_C_Poloshirt_redwhite" && ((call ES_donator) >= 2)) then {
	    player setObjectTextureGlobal [0, "Images\Skins\don\mario.paa"];
    };
	
	if (uniform player == "U_C_Poloshirt_burgundy" && ((call ES_donator) >= 2)) then {
	    player setObjectTextureGlobal [0, "Images\Skins\don\zed.paa"];
    };
	
	if (uniform player == "U_C_Poloshirt_blue" && ((call ES_donator) >= 2)) then {
	    player setObjectTextureGlobal [0, "Images\Skins\don\swag.paa"];
    };
	
	if (uniform player == "U_I_CombatUniform" && ((call ES_donator) >= 3)) then {
	    player setObjectTextureGlobal [0, "Images\Skins\don\mafia.paa"];
    };
	
	if (uniform player == "U_B_CombatUniform_mcam" && ((call ES_donator) >= 3)) then {
	    player setObjectTextureGlobal [0, "Images\Skins\civ\blackwolf.jpg"];
    };

	if (uniform player == "U_B_CombatUniform_mcam" && (license_civ_unitskin)) then {
	    player setObjectTextureGlobal [0,"Images\clans\Unit\kampfanzugmwt.paa"];
	};

	if (uniform player == "U_B_CombatUniform_mcam" && (license_civ_faaskin)) then {
	    player setObjectTextureGlobal [0,"Images\clans\faa\clothing1_co.jpg"];
	};

	if (uniform player == "U_B_CombatUniform_mcam" && (license_civ_aiskin)) then {
	    player setObjectTextureGlobal [0,"Images\clans\ai\clothing1_mtp_co.jpg"];
	};
	
	if (uniform player == "U_B_CombatUniform_mcam_vest" && (license_civ_aiskin)) then {
	    player setObjectTextureGlobal [0,"Images\clans\ai\AI_Member.jpg"];
	};

	if (uniform player == "U_I_CombatUniform" && (license_civ_kskskin)) then {
	    player setObjectTextureGlobal [0,"Images\clans\ksk\ia_soldier_01_clothing_co.jpg"];
	};

	if (uniform player == "U_I_CombatUniform" && (license_civ_twooneskin)) then {
	    player setObjectTextureGlobal [0,"Images\clans\ir\ia_soldier_01_clothing_co.jpg"];
	};
	
	if (uniform player == "U_I_CombatUniform" && (license_civ_skskins)) then {
	    player setObjectTextureGlobal [0,"Images\clans\sk\sk_skin.jpg"];
	};
	
	if (Backpack player == "B_Kitbag_cbr" && (license_civ_mecaskin)) then {
		(unitBackpack player) setObjectTextureGlobal [0,"Images\clans\meca\mecabackp.jpg"];
	};
	
	if (uniform player == "U_B_CombatUniform_mcam" && (license_civ_nobodyskins)) then {
	    player setObjectTextureGlobal [0,"Images\clans\nobody\clothing1_co.jpg"];
	};
	
	if (uniform player == "U_B_CombatUniform_mcam" && (license_civ_rektskins)) then {
	    player setObjectTextureGlobal [0,"Images\clans\rekt\REKTUniform.jpg"];
	};
	
	if (uniform player == "U_I_CombatUniform" && (license_civ_sasskins)) then {
	    player setObjectTextureGlobal [0,"Images\clans\sas\sasunifo.jpg"];
	};
	
	if (Backpack player == "B_Carryall_oli" && (license_civ_twooneskin)) then {
		(unitBackpack player) setObjectTextureGlobal [0,"Images\clans\ir\sfo_backpack.jpg"];
	};
	
	if (uniform player == "U_B_CombatUniform_mcam" && (license_civ_leskin)) then {
	    player setObjectTextureGlobal [0,"Images\clans\le\mcam.jpg"];
	};
	
	if (Backpack player == "B_Carryall_cbr" && (license_civ_leskin)) then {
		(unitBackpack player) setObjectTextureGlobal [0,"Images\clans\le\backpack_tortila_cbr_co.jpg"];
	};	
	
	if (uniform player == "U_B_CombatUniform_mcam_vest" && (license_civ_leskin)) then {
	    player setObjectTextureGlobal [0,"Images\clans\le\clothing1_co.jpg"];
	};
	
	if (Backpack player == "B_Carryall_oucamo" && (license_civ_leskin)) then {
		(unitBackpack player) setObjectTextureGlobal [0,"Images\clans\le\Rucksack.jpg"];
	};	
	
	if (uniform player == "U_B_CombatUniform_mcam" && (license_civ_amwskins)) then {
	    player setObjectTextureGlobal [0,"Images\clans\amw\U_B_CombatUniform_mcam.jpg"];
	};
};

if(playerSide == civilian) exitWith {};

if(playerSide == west) then {

	switch(true) do {

		case ((call ES_coplevel) == 1 && uniform player == "U_Rangemaster"): {player setObjectTextureGlobal [0,"Images\Skins\cop\cadet.paa"];};
		case ((call ES_coplevel) == 2 && uniform player == "U_Rangemaster"): {player setObjectTextureGlobal [0,"Images\Skins\cop\deputy.paa"];};
		case ((call ES_coplevel) == 3 && uniform player == "U_Rangemaster"): {player setObjectTextureGlobal [0,"Images\Skins\cop\officer.paa"];};
		case ((call ES_coplevel) == 4 && uniform player == "U_Rangemaster"): {player setObjectTextureGlobal [0,"Images\Skins\cop\detective.paa"];};
		case ((call ES_coplevel) == 5 && uniform player == "U_Rangemaster"): {player setObjectTextureGlobal [0,"Images\Skins\cop\inspector.paa"];};
		case ((call ES_coplevel) == 6 && uniform player == "U_Rangemaster"): {player setObjectTextureGlobal [0,"Images\Skins\cop\commissioner.paa"];};
		case ((call ES_coplevel) == 7 && uniform player == "U_Rangemaster"): {player setObjectTextureGlobal [0,"Images\Skins\cop\major.paa"];};
		case ((call ES_coplevel) == 8 && uniform player == "U_B_CombatUniform_mcam_vest"): {player setObjectTextureGlobal [0,"Images\Skins\cop\fbi_uniform.paa"];};
		// case ((call ES_coplevel) == 9 && uniform player == "U_I_CombatUniform_shortsleeve"): {player setObjectTextureGlobal [0,"Images\Skins\cop\swat.paa"];};
		case ((call ES_coplevel) == 10 && uniform player == "U_B_CombatUniform_mcam"): {player setObjectTextureGlobal [0,"Images\Skins\cop\chief.paa"];};
		case ((call ES_coplevel) == 11 && uniform player == "U_B_CombatUniform_mcam"): {player setObjectTextureGlobal [0,"Images\Skins\cop\chief.paa"];};
		case ((call ES_coplevel) == 12 && uniform player == "U_B_CombatUniform_mcam"): {player setObjectTextureGlobal [0,"Images\Skins\cop\chief.paa"];};
		default {};
	};

	if (uniform player == "U_Rangemaster" && (license_cop_cSO)) then { player setObjectTextureGlobal [0,"Images\Skins\cop\policeordenskin.paa"]; };

	if (uniform player == "U_B_CombatUniform_mcam" && (license_cop_ncis) && ((call ES_coplevel) == 9)) then { player setObjectTextureGlobal [0,"Images\Skins\cop\ncis_uniform.jpg"]; }else{ if (uniform player == "U_I_CombatUniform_shortsleeve" && (!license_cop_ncis) && ((call ES_coplevel) == 9)) then {player setObjectTextureGlobal [0,"Images\Skins\cop\swat.paa"];};};

	if (Backpack  player == "B_Bergen_blk") then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\policeback.paa"]; };
	if (Backpack  player == "B_Bergen_blk" && ((call ES_coplevel) == 8)) then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\fbi_backpack.paa"]; };

	if (uniform player == "U_B_CombatUniform_mcam_vest" && ((getPlayerUID player) in FBIOnlySkin)) then { player setObjectTextureGlobal [0,"Images\Skins\cop\fbi_uniform.paa"]; };
	if (Backpack  player == "B_Bergen_blk" && ((getPlayerUID player) in FBIOnlySkin)) then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\fbi_backpack.paa"]; };

	if (uniform player == "U_I_CombatUniform_shortsleeve" && ((getPlayerUID player) in SWATOnlySkin)) then { player setObjectTextureGlobal [0,"Images\Skins\cop\swat.paa"]; };

	if (Backpack  player == "B_Carryall_khk" && (!license_cop_ncis) && ((call ES_coplevel) == 9)) then { (unitBackpack player) setObjectTextureGlobal [0,"Images\Skins\cop\swat_backpack.paa"]; };

};

if(playerSide == independent) then {

	if (uniform player == "U_Rangemaster") then {

		switch(player getVariable["medSkin",0]) do {

			case 1: {player setObjectTextureGlobal [0,"Images\Skins\medic\1.jpg"];};
			case 2: {player setObjectTextureGlobal [0,"Images\Skins\medic\2.jpg"];};
			case 3: {player setObjectTextureGlobal [0,"Images\Skins\medic\fire3.jpg"];};
			case 4: {player setObjectTextureGlobal [0,"Images\Skins\medic\Kustenwache.jpg"];};
			case 5: {player setObjectTextureGlobal [0,"Images\Skins\medic\Ausbilder4.jpg"];};
			case 6: {player setObjectTextureGlobal [0,"Images\Skins\medic\coleitung.jpg"];};
			case 7: {player setObjectTextureGlobal [0,"Images\Skins\medic\Leitung.jpg"];};
			default {};
		};
	};

	if (uniform player == "U_I_pilotCoveralls" && (license_med_seuche)) then { player setObjectTextureGlobal [0,"Images\Skins\medic\seuche.jpg"]; };

};