#include "..\..\script_macros.hpp"

/*
    File: fn_copLoadout.sqf
    Author: Bryan "Tonic" Boardwine
    Edited: Itsyuka
    
    Description:
    Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
if(FETCH_CONST(life_coplevel) isEqualTo 8) then {
	player addUniform "U_B_GEN_Commander_F";
	player addVest "V_TacVest_gen_F";
	player addHeadgear "H_Beret_gen_F";
	player addGoggles "G_Spectacles_Tinted";
	
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	
	player addWeapon "SMG_05_F";
	player addPrimaryWeaponItem "optic_Holosight_blk_F";
	
	player addBackpack "B_ViperHarness_blk_F";
	_playerbackpack = unitBackpack player;
	_playerbackpack addItemCargoGlobal ["Toolkit", 1];
	_playerbackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag_SMG_02",5];
	} else {
		if(FETCH_CONST(life_coplevel) isEqualTo 7) then {
			player addUniform "U_B_GEN_Commander_F";
			player addVest "V_TacVest_gen_F";
			player addHeadgear "H_Beret_Colonel";
			player addGoggles "G_Spectacles_Tinted";
			
			player addMagazine "30Rnd_9x21_Mag";
			player addWeapon "hgun_P07_snds_F";
			
			player addWeapon "SMG_05_F";
			player addPrimaryWeaponItem "optic_Holosight_blk_F";
			
			player addBackpack "B_ViperHarness_blk_F";
			_playerbackpack = unitBackpack player;
			_playerbackpack addItemCargoGlobal ["Toolkit", 1];
			_playerbackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag_SMG_02",5];
			} else {
			if(FETCH_CONST(life_coplevel) isEqualTo 6) then {
				player addUniform "U_B_GEN_Commander_F";
				player addVest "V_TacVest_gen_F";
				player addHeadgear "H_Beret_02";
				player addGoggles "G_Spectacles_Tinted";
				
				player addMagazine "30Rnd_9x21_Mag";
				player addWeapon "hgun_P07_snds_F";
				
				player addWeapon "SMG_05_F";
				player addPrimaryWeaponItem "optic_Holosight_blk_F";
				
				player addBackpack "B_ViperHarness_blk_F";
				_playerbackpack = unitBackpack player;
				_playerbackpack addItemCargoGlobal ["Toolkit", 1];
				_playerbackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag_SMG_02",5];
					} else {
					if(FETCH_CONST(life_coplevel) isEqualTo 5) then {
						player addUniform "U_B_GEN_Commander_F";
						player addVest "V_TacVest_gen_F";
						player addHeadgear "H_Beret_blk";
						player addGoggles "G_Spectacles_Tinted";
						
						player addMagazine "30Rnd_9x21_Mag";
						player addWeapon "hgun_P07_snds_F";
						
						player addWeapon "SMG_02_F";
						player addPrimaryWeaponItem "optic_Aco_smg";
						
						player addBackpack "B_ViperHarness_blk_F";
						_playerbackpack = unitBackpack player;
						_playerbackpack addItemCargoGlobal ["Toolkit", 1];
						_playerbackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",4];
						} else {
						if(FETCH_CONST(life_coplevel) isEqualTo 4) then {
								player addUniform "U_B_GEN_Commander_F";
								player addVest "V_TacVest_gen_F";
								player addHeadgear "H_Cap_police";
								player addGoggles "G_Spectacles_Tinted";
								
								player addMagazine "30Rnd_9x21_Mag";
								player addWeapon "hgun_P07_snds_F";
								
																		
								player addWeapon "SMG_02_F";
								player addPrimaryWeaponItem "optic_Aco_smg";
								
								player addBackpack "B_ViperLightHarness_blk_F";
								_playerbackpack = unitBackpack player;
								_playerbackpack addItemCargoGlobal ["Toolkit", 1];
								_playerbackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",4];
								} else {
								if(FETCH_CONST(life_coplevel) isEqualTo 3) then {
									player addUniform "U_B_GEN_Commander_F";
									player addVest "V_TacVest_gen_F";
									player addHeadgear "H_Cap_police";
									player addGoggles "G_Spectacles_Tinted";
									
									player addMagazine "30Rnd_9x21_Mag";
									player addWeapon "hgun_P07_snds_F";
																			
									player addWeapon "hgun_PDW2000_F";
									player addPrimaryWeaponItem "optic_Aco_smg";
									
									player addBackpack "B_ViperLightHarness_blk_F";
									_playerbackpack = unitBackpack player;
									_playerbackpack addItemCargoGlobal ["Toolkit", 1];
									_playerbackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",4];
									} else {
									if(FETCH_CONST(life_coplevel) isEqualTo 2) then {
										player addUniform "U_B_GEN_Soldier_F";
										player addVest "V_TacVest_gen_F";
										player addHeadgear "H_Cap_police";
										player addGoggles "G_Spectacles_Tinted";
										
										player addMagazine "30Rnd_9x21_Mag";
										player addWeapon "hgun_P07_snds_F";
																				
										player addWeapon "hgun_PDW2000_F";
										player addPrimaryWeaponItem "optic_Aco_smg";
										
										player addBackpack "B_ViperLightHarness_blk_F";
										_playerbackpack = unitBackpack player;
										_playerbackpack addItemCargoGlobal ["Toolkit", 1];
										_playerbackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",4];
										} else {
										if(FETCH_CONST(life_coplevel) isEqualTo 1) then {
										player addUniform "U_B_GEN_Soldier_F";
										player addVest "V_TacVest_gen_F";
										player addHeadgear "H_Cap_police";
										player addGoggles "G_Spectacles_Tinted";
										
										player addMagazine "30Rnd_9x21_Mag";
										player addWeapon "hgun_P07_snds_F";
										
										player addWeapon "hgun_PDW2000_F";
										player addPrimaryWeaponItem "optic_Aco_smg";
										
										player addBackpack "B_ViperLightHarness_blk_F";
										_playerbackpack = unitBackpack player;
										_playerbackpack addItemCargoGlobal ["Toolkit", 1];
										_playerbackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",4];
											} else {
											player addUniform "U_B_GEN_Soldier_F";
											player addVest "V_Rangemaster_belt";
											player addHeadgear "H_MilCap_blue";
											player addGoggles "G_Spectacles_Tinted";
											
											player addMagazine "30Rnd_9x21_Mag";
											player addMagazine "30Rnd_9x21_Mag";
											player addMagazine "30Rnd_9x21_Mag";
											player addMagazine "30Rnd_9x21_Mag";
											player addMagazine "30Rnd_9x21_Mag";
											player addWeapon "hgun_P07_snds_F";
											
											player addWeapon "hgun_PDW2000_F";
											player addPrimaryWeaponItem "optic_Aco_smg";
											};
										};
									};
								};
						};
					};
			};
};

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;