#define GVAR_UINS uiNamespace getVariable
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define steamid getPlayerUID player
#define SPY "spy_log"
/*
	File: fn_initSpy.sqf
	
	Description:
	Does some things that I made over-complicated / un-needed but blah.
	Will eventually include server-side checks but it's blah at this point.
	
	Will also become a standalone system which is why it's setup like this.
*/
private["_binConfigPatches","_cfgPatches","_endM"];
if(isServer && !hasInterface) exitWith {}; //Server doesn't need to know.

CONST(W_O_O_K_I_E_ANTI_ANTI_HAX,"false");
CONST(W_O_O_K_I_E_FUD_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_Pro_RE,"false");
CONST(E_X_T_A_S_Y_Car_RE,"false");
CONST(DO_NUKE,"false");
CONST(JxMxE_spunkveh,"false");
CONST(JxMxE_spunkveh2,"false");
CONST(JxMxE_spunkair,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_VEH,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON,"false");

/*
	Compile our list of allowed addon patches, by default this DOES NOT ALLOW ANY ADDONS.
	
	If you want to white-list addons such as JSRS or Blastcore you need to start a test instance (Host locally and not the mission) and first fill the SPY_cfg_patchList array, once you executed it (Filled it)
	Run the following code and it will copy the list of addons / patches not in the list to your clipboard (Ctrl + V) and then add it to the array.
	
	_cfgPatches = [];
	_binConfigPatches = configFile >> "CfgPatches";
	for "_i" from 0 to count (_binConfigPatches)-1 do {
		_patchEntry = _binConfigPatches select _i;
		if(isClass _patchEntry) then {
			if(!((configName _patchEntry) in SPY_cfg_patchList)) then {
				_cfgPatches set[count _cfgPatches,(configName _patchEntry)];
			};
		};
	};

	copyToClipboard str(_cfgPatches);
	
	i.e
	["cba_xeh","Extended_EventHandlers","CBA_Extended_EventHandlers","JSRS_Environment","WarFXPE","cba_common","cba_events","cba_hashes","cba_network","cba_strings","cba_ui","cba_vectors","JSRS2_120mm_Cannon","JSRS2_127","JSRS2_155mm_AMOS",
	"JSRS2_230mm_Titan","JSRS2_30mm_Cannon","JSRS2_35mm_Autocannon","JSRS2_4Five45","JSRS2_ACPC","JSRS2_Autocannon","JSRS2_Bullethits","JSRS2_DAGR","JSRS2_DAR","JSRS2_EBR","JSRS2_Explosions","JSRS2_Explosives","JSRS2_Filters","JSRS2_FS2000",
	"JSRS2_Gatling","JSRS2_GMG20","JSRS2_GMG40","JSRS2_Khaybar","JSRS2_LMGRCWS","JSRS2_M134","JSRS2_M200","JSRS2_M320R","JSRS2_M6","JSRS2_Minigun","JSRS2_MX","JSRS2_NLAW","JSRS2_P07","JSRS2_PDW","JSRS2_Rahim","JSRS2_Rook40","JSRS2_RPG32",
	"JSRS2_Scorpian","JSRS2_SDAR","JSRS2_Skalpel_ATGM","JSRS2_Skyfire","JSRS2_Sonic_Cracks","JSRS2_Titan","JSRS2_TRG20","JSRS2_Vector","JSRS2_Veh_Titan","JSRS2_Zafir","JSRS2_Zubr45","Blastcore_VEP","cba_ai","cba_arrays","cba_diagnostic","cba_help",
	"cba_ui_helper","cba_versioning","JSRS2_Movement","JSRS2_Silencers","cba_main","cba_main_a3","JSRS2_2S9_Sorcher","JSRS2_AFV4_Gorgon","JSRS2_AH99_Blackfoot","JSRS2_AH9_Pawnee","JSRS2_AMV7_Marshal","JSRS2_BTRK_Kamysh","JSRS2_CH49_Mohawk","JSRS2_Distance",
	"JSRS2_FighterPlane3","JSRS2_FV720_Mora","JSRS2_Hunter","JSRS2_Ifrit","JSRS2_IFV6a_Cheetah","JSRS2_IFV6c_Panther","JSRS2_M2A1_Slammer","JSRS2_M4_Scorcher","JSRS2_M5_Sandstorm","JSRS2_MBT52_Kuma","JSRS2_Mi48_Kajman","JSRS2_MSE3_Marid","JSRS2_Offroad",
	"JSRS2_Po30_Orca","JSRS2_Strider","JSRS2_SUV","JSRS2_T100_Varsuk","JSRS2_Truck1","JSRS2_Truck2","JSRS2_UAV_1","JSRS2_UH80_GhostHawk","JSRS2_Van","JSRS2_WY55_Hellcat","JSRS2_ZSU39_Tigris","cba_xeh_a3"]
*/
	
_patchList = 
["life_server","CAData","A3_BaseConfig_F","A3_Dubbing_Radio_F","A3_Functions_F","A3_Functions_F_EPA","A3_Functions_F_EPC","A3_Data_F","A3_Data_F_ParticleEffects","A3_Editor_F","A3_Functions_F_Curator",
"A3_Language_F","A3_Language_F_Beta","A3_Language_F_Curator","A3_Language_F_EPA","A3_Language_F_EPB","A3_Language_F_EPC","A3_Language_F_Gamma","A3_LanguageMissions_F","A3_LanguageMissions_F_Beta",
"A3_LanguageMissions_F_Gamma","A3_Misc_F","A3_Misc_F_Helpers","A3_Modules_F","A3_Modules_F_DynO","A3_Modules_F_Effects","A3_Modules_F_Events","A3_Modules_F_GroupModifiers","A3_Modules_F_HC",
"A3_Modules_F_Intel","A3_Modules_F_LiveFeed","A3_Modules_F_Marta","A3_Modules_F_Misc","A3_Modules_F_Multiplayer","A3_Modules_F_ObjectModifiers","A3_Modules_F_Sites","A3_Modules_F_Skirmish",
"A3_Modules_F_StrategicMap","A3_Modules_F_Supports","A3_Modules_F_UAV","A3_Modules_F_Beta","A3_Modules_F_Beta_FiringDrills","A3_Modules_F_EPB","A3_Modules_F_EPB_Misc","A3_Music_F","A3_Music_F_EPA",
"A3_Music_F_EPB","A3_Music_F_EPC","A3_Roads_F","A3_Rocks_F","A3_Sounds_F","A3_Sounds_F_EPB","A3_Sounds_F_EPC","A3_Structures_F","A3_Structures_F_Bridges","A3_Structures_F_Civ","A3_Structures_F_Civ_Accessories",
"A3_Structures_F_Civ_Ancient","A3_Structures_F_Civ_BellTowers","A3_Structures_F_Civ_Calvaries","A3_Structures_F_Civ_Camping","A3_Structures_F_Civ_Chapels","A3_Structures_F_Civ_Constructions","A3_Structures_F_Civ_Dead",
"A3_Structures_F_Civ_Garbage","A3_Structures_F_Civ_InfoBoards","A3_Structures_F_Civ_Lamps","A3_Structures_F_Civ_Market","A3_Structures_F_Civ_Offices","A3_Structures_F_Civ_Pavements","A3_Structures_F_Civ_PlayGround",
"A3_Structures_F_Civ_SportsGrounds","A3_Structures_F_Civ_Statues","A3_Structures_F_Dominants","A3_Structures_F_Dominants_Amphitheater","A3_Structures_F_Dominants_Castle","A3_Structures_F_Dominants_Church",
"A3_Structures_F_Dominants_Hospital","A3_Structures_F_Dominants_Lighthouse","A3_Structures_F_Dominants_WIP","A3_Structures_F_Furniture","A3_Structures_F_Households","A3_Structures_F_Households_Addons",
"A3_Structures_F_Households_House_Big01","A3_Structures_F_Households_House_Big02","A3_Structures_F_Households_House_Shop01","A3_Structures_F_Households_House_Shop02","A3_Structures_F_Households_House_Small01",
"A3_Structures_F_Households_House_Small02","A3_Structures_F_Households_House_Small03","A3_Structures_F_Households_Slum","A3_Structures_F_Households_Stone_Big","A3_Structures_F_Households_Stone_Shed",
"A3_Structures_F_Households_Stone_Small","A3_Structures_F_Households_WIP","A3_Structures_F_Ind","A3_Structures_F_Ind_AirPort","A3_Structures_F_Ind_Cargo","A3_Structures_F_Ind_CarService",
"A3_Structures_F_Ind_ConcreteMixingPlant","A3_Structures_F_Ind_Crane","A3_Structures_F_Ind_DieselPowerPlant","A3_Structures_F_Ind_Factory","A3_Structures_F_Ind_FuelStation","A3_Structures_F_Ind_FuelStation_Small",
"A3_Structures_F_Ind_Pipes","A3_Structures_F_Ind_PowerLines","A3_Structures_F_Ind_ReservoirTank","A3_Structures_F_Ind_Shed","A3_Structures_F_Ind_SolarPowerPlant","A3_Structures_F_Ind_Tank",
"A3_Structures_F_Ind_Transmitter_Tower","A3_Structures_F_Ind_WavePowerPlant","A3_Structures_F_Ind_Windmill","A3_Structures_F_Ind_WindPowerPlant","A3_Structures_F_Items","A3_Structures_F_Items_Documents",
"A3_Structures_F_Items_Electronics","A3_Structures_F_Items_Cans","A3_Structures_F_Items_Gadgets","A3_Structures_F_Items_Luggage","A3_Structures_F_Items_Stationery","A3_Structures_F_Items_Tools",
"A3_Structures_F_Items_Valuables","A3_Structures_F_Items_Vessels","A3_Structures_F_Mil","A3_Structures_F_Mil_BagBunker","A3_Structures_F_Mil_BagFence","A3_Structures_F_Mil_Barracks","A3_Structures_F_Mil_Bunker",
"A3_Structures_F_Mil_Cargo","A3_Structures_F_Mil_Flags","A3_Structures_F_Mil_Fortification","A3_Structures_F_Mil_Helipads","A3_Structures_F_Mil_Offices","A3_Structures_F_Mil_Radar","A3_Structures_F_Mil_Shelters",
"A3_Structures_F_Mil_TentHangar","A3_Structures_F_Naval","A3_Structures_F_Naval_Buoys","A3_Structures_F_Naval_Piers","A3_Structures_F_Naval_RowBoats","A3_Structures_F_Research","A3_Structures_F_System",
"A3_Structures_F_Training","A3_Structures_F_Training_InvisibleTarget","A3_Structures_F_Walls","A3_Structures_F_EPA_Civ_Camping","A3_Structures_F_EPA_Civ_Constructions","A3_Structures_F_EPA_Items_Electronics",
"A3_Structures_F_EPA_Items_Food","A3_Structures_F_EPA_Items_Medical","A3_Structures_F_EPA_Items_Tools","A3_Structures_F_EPA_Items_Vessels","A3_Structures_F_EPA_Walls","A3_Structures_F_EPB_Civ_Accessories",
"A3_Structures_F_EPB_Civ_Camping","A3_Structures_F_EPB_Civ_Dead","A3_Structures_F_EPB_Civ_Garbage","A3_Structures_F_EPB_Civ_Graffiti","A3_Structures_F_EPB_Civ_PlayGround","A3_Structures_F_EPB_Furniture",
"A3_Structures_F_EPB_Items_Documents","A3_Structures_F_EPB_Items_Luggage","A3_Structures_F_EPB_Items_Military","A3_Structures_F_EPB_Items_Vessels","A3_Structures_F_EPB_Naval_Fishing","A3_Structures_F_EPC_Civ_Accessories",
"A3_Structures_F_EPC_Civ_Camping","A3_Structures_F_EPC_Civ_Garbage","A3_Structures_F_EPC_Civ_InfoBoards","A3_Structures_F_EPC_Civ_Kiosks","A3_Structures_F_EPC_Civ_PlayGround",
"A3_Structures_F_EPC_Civ_Tourism","A3_Structures_F_EPC_Dominants_GhostHotel","A3_Structures_F_EPC_Dominants_Stadium","A3_Structures_F_EPC_Furniture","A3_Structures_F_EPC_Items_Documents",
"A3_Structures_F_EPC_Items_Electronics","A3_Structures_F_EPC_Walls","A3_UIFonts_F","A3_Animals_F","A3_Animals_F_AnimConfig","A3_Animals_F_Fishes","A3_Animals_F_Kestrel","A3_Animals_F_Rabbit",
"A3_Animals_F_Seagull","A3_Animals_F_Snakes","A3_Animals_F_Turtle","A3_Animals_F_Chicken","A3_Animals_F_Dog","A3_Animals_F_Goat","A3_Animals_F_Sheep","A3_Anims_F","A3_Anims_F_Config_Sdr",
"A3_Anims_F_EPA","A3_Anims_F_EPC","A3_Map_Data","A3_Map_Stratis","A3_Map_Stratis_Scenes","A3_Plants_F_Bush","A3_Signs_F","A3_Signs_F_AD","A3_UI_F","A3_UI_F_Curator","A3_Weapons_F",
"A3_Weapons_F_NATO","A3_Weapons_F_CSAT","A3_Weapons_F_AAF","A3_weapons_F_FIA","A3_Weapons_F_ItemHolders","A3_Weapons_F_Headgear","A3_Weapons_F_Uniforms","A3_Weapons_F_Vests","A3_Weapons_F_Ammoboxes",
"A3_Weapons_F_DummyWeapons","A3_Weapons_F_Explosives","A3_Weapons_F_Items","A3_Weapons_F_Launchers_NLAW","A3_Weapons_F_Launchers_LAW","A3_Weapons_F_EBR","A3_Weapons_F_LongRangeRifles_GM6",
"A3_Weapons_F_LongRangeRifles_M320","A3_Weapons_F_Machineguns_M200","A3_Weapons_F_Pistols_P07","A3_Weapons_F_Pistols_Rook40","A3_Weapons_F_Rifles_Khaybar","A3_Weapons_F_Rifles_MX","A3_Weapons_F_Rifles_SDAR",
"A3_Weapons_F_Rifles_TRG20","A3_Weapons_F_beta","A3_Weapons_F_Beta_Ammoboxes","A3_Weapons_F_Launchers_Titan","A3_Weapons_F_beta_EBR","A3_Weapons_F_Machineguns_Zafir","A3_Weapons_F_Pistols_ACPC2","A3_Weapons_F_beta_Rifles_Khaybar",
"A3_Weapons_F_Rifles_Mk20","A3_Weapons_F_beta_Rifles_MX","A3_Weapons_F_beta_Rifles_TRG20","A3_Weapons_F_Rifles_Vector","a3_weapons_f_rifles_SMG_02","A3_Weapons_F_EPA_LongRangeRifles_DMR_01","A3_Weapons_F_EPA_EBR",
"A3_Weapons_F_EPA_LongRangeRifles_GM6","A3_Weapons_F_Pistols_Pistol_heavy_01","A3_Weapons_F_Pistols_Pistol_heavy_02","A3_Weapons_F_EPA_Rifles_MX","A3_Weapons_F_EPB_LongRangeRifles_GM3","A3_Weapons_F_EPB_LongRangeRifles_M320",
"A3_Weapons_F_EPB_Rifles_MX_Black","A3_Weapons_F_gamma","A3_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_Pistols_PDW2000","A3_Characters_F","A3_Characters_F_BLUFOR","A3_Characters_F_Civil","A3_Characters_F_Heads",
"A3_Characters_F_OPFOR","A3_Characters_F_Proxies","A3_Characters_F_Beta","A3_Characters_F_INDEP","A3_Characters_F_EPB_Heads","A3_Characters_F_Gamma","A3_Data_F_Curator","A3_Data_F_Curator_Eagle","A3_Data_F_Curator_Intel",
"A3_Data_F_Curator_Misc","A3_Data_F_Curator_Respawn","A3_UAV_F_Characters_F_Gamma","A3_UAV_F_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_gamma_Items","A3_Map_Altis","A3_Map_Altis_Scenes","A3_Missions_F","A3_Missions_F_Beta",
"A3_Missions_F_Gamma","A3_Modules_F_Curator","A3_Modules_F_Curator_Animals","A3_Modules_F_Curator_CAS","A3_Modules_F_Curator_Curator","A3_Modules_F_Curator_Effects","A3_Modules_F_Curator_Environment","A3_Modules_F_Curator_Flares",
"A3_Modules_F_Curator_Intel","A3_Modules_F_Curator_Lightning","A3_Modules_F_Curator_Mines","A3_Modules_F_Curator_Misc","A3_Modules_F_Curator_Multiplayer","A3_Modules_F_Curator_Objectives","A3_Modules_F_Curator_Ordnance",
"A3_Modules_F_Curator_Respawn","A3_Modules_F_Curator_Smokeshells","A3_Static_F","A3_Static_F_Mortar_01","A3_Static_F_Beta_Mortar_01","A3_Static_F_Gamma","A3_Static_F_Gamma_AA","A3_Static_F_Gamma_AT","A3_Static_F_Gamma_Mortar_01",
"A3_Weapons_F_Acc","A3_Weapons_F_Beta_Acc","A3_Weapons_F_EPA","A3_Weapons_F_EPA_Acc","A3_Weapons_F_EPA_Ammoboxes","A3_Weapons_F_EPB","A3_Weapons_F_EPB_Acc","A3_Weapons_F_EPB_Ammoboxes","A3_Weapons_F_EPC","A3_Weapons_F_gamma_Acc",
"A3_Air_F","A3_Air_F_Heli_Light_01","A3_Air_F_Heli_Light_02","A3_Air_F_Beta","A3_Air_F_Beta_Heli_Attack_01","A3_Air_F_Beta_Heli_Attack_02","A3_Air_F_Beta_Heli_Transport_01","A3_Air_F_Beta_Heli_Transport_02","A3_Air_F_Beta_Parachute_01",
"A3_Air_F_Beta_Parachute_02","A3_Air_F_EPB_Heli_Light_03","A3_Air_F_EPC_Plane_CAS_01","A3_Air_F_EPC_Plane_CAS_02","A3_Air_F_Gamma_Plane_Fighter_03","A3_Armor_F","A3_armor_f_beta","A3_Armor_F_Panther","A3_armor_f_beta_APC_Tracked_02",
"A3_Armor_F_EPB_APC_tracked_03","A3_Armor_F_EPB_MBT_03","A3_Armor_F_Slammer","A3_Armor_F_T100K","A3_Boat_F","A3_Boat_F_Boat_Armed_01","A3_Boat_F_Boat_Transport_01","A3_Boat_F_Beta_Boat_Armed_01","A3_Boat_F_Beta_Boat_Transport_01",
"A3_Boat_F_SDV_01","A3_Boat_F_EPC_Submarine_01_F","A3_Boat_F_Civilian_Boat","A3_Boat_F_Trawler","A3_Boat_F_Gamma_Boat_Transport_01","A3_Characters_F_Common","A3_Characters_F_EPA","A3_Characters_F_EPB","A3_Characters_F_EPC",
"A3_Data_F_Curator_Characters","A3_Data_F_Curator_Virtual","A3_Air_F_Gamma_UAV_01","A3_Air_F_Gamma_UAV_02","A3_Missions_F_EPA","A3_Missions_F_EPB","A3_Missions_F_EPC","A3_Modules_F_Curator_Chemlights","A3_Soft_F","A3_Soft_F_MRAP_01",
"A3_Soft_F_MRAP_02","A3_Soft_F_Offroad_01","A3_Soft_F_Quadbike","A3_Soft_F_MRAP_03","A3_Soft_F_Beta_Quadbike","A3_Soft_F_HEMTT","A3_Soft_F_TruckHeavy","A3_Soft_F_EPC_Truck_03","A3_Soft_F_Car","A3_Soft_F_Gamma_Offroad",
"A3_Soft_F_Gamma_Quadbike","A3_Soft_F_SUV","A3_Soft_F_Gamma_HEMTT","A3_Soft_F_Gamma_TruckHeavy","A3_Soft_F_Truck","A3_Structures_F_Wrecks","A3_Structures_F_EPA_Mil_Scrapyard","A3_Air_F_EPC_Plane_Fighter_03",
"A3_Armor_F_AMV","A3_Armor_F_Marid","A3_Armor_F_EPC_MBT_01","A3_Armor_F_APC_Wheeled_03","A3_CargoPoses_F","A3_Soft_F_Crusher_UGV","A3_Missions_F_Curator","A3_Data_F_Kart_ParticleEffects","A3_Language_F_Kart",
"A3_LanguageMissions_F_Kart","A3_Structures_F_Kart_Civ_SportsGrounds","A3_Structures_F_Kart_Mil_Flags","A3_Anims_F_Kart","A3_Structures_F_Kart_Signs_Companies","A3_UI_F_Kart",
"A3_Weapons_F_Kart_Pistols_Pistol_Signal_F","A3_Data_F_Kart","A3_Missions_F_Kart","A3_Modules_F_Kart","A3_Modules_F_Kart_TimeTrials","A3_Weapons_F_Kart","A3_Characters_F_Kart","A3_Soft_F_Kart_Kart_01",
"A3_Structures_F_Civ_Graffiti","A3_Structures_F_Civ_Kiosks","A3_Structures_F_Civ_Tourism","A3_Structures_F_Items_Medical","A3_Structures_F_Items_Military","A3_Structures_F_Naval_Fishing","A3_Structures_F_Signs_Companies","A3_Structures_F_Mil_Scrapyard",
"A3_Soft_F_Bootcamp_Truck","A3_Soft_F_Bootcamp_Quadbike","A3_Soft_F_Bootcamp_Offroad_01","A3_Weapons_F_Bootcamp","A3_Modules_F_Bootcamp_Misc","A3_Modules_F_Bootcamp","A3_Characters_F_Bootcamp_Common","A3_Weapons_F_Bootcamp_Ammoboxes","A3_UI_F_Bootcamp",
"A3_Characters_F_Bootcamp","A3_Weapons_F_Bootcamp_LongRangeRifles_M320","A3_Weapons_F_Bootcamp_LongRangeRifles_GM6","A3_Structures_F_Bootcamp_Items_Food","A3_Structures_F_Bootcamp_Items_Electronics","A3_Structures_F_Bootcamp_Civ_SportsGrounds",
"A3_Structures_F_Bootcamp_Civ_Camping","A3_Language_F_Bootcamp","A3_Functions_F_Bootcamp","A3_Structures_F_Bootcamp_VR_Helpers","A3_Structures_F_Bootcamp_VR_CoverObjects","A3_Structures_F_Bootcamp_VR_Blocks","A3_Structures_F_Bootcamp_Training",
"A3_Structures_F_Bootcamp_System","A3_Structures_F_Bootcamp_Items_Sport","A3_Structures_F_Bootcamp_Ind_Cargo","A3_Sounds_F_Bootcamp","A3_Data_F_Bootcamp","A3_Map_VR_Scenes","A3_Missions_F_Bootcamp","A3_Music_F_Bootcamp","Map_VR","A3Data",
"A3_Data_F_Hook","A3_Air_F_RTD","A3_Functions_F_Heli","A3_Language_F_Heli","A3_Modules_F_Heli","A3_Modules_F_Heli_SpawnAi",
"A3_Music_F_Heli","A3_Structures_F_Heli_Civ_Accessories","A3_Structures_F_Heli_Civ_Constructions","A3_Structures_F_Heli_Civ_Garbage",
"A3_Structures_F_Heli_Civ_Market","A3_Structures_F_Heli_Furniture","A3_Structures_F_Heli_Ind_AirPort","A3_Structures_F_Heli_Ind_Cargo",
"A3_Structures_F_Heli_Ind_Machines","A3_Structures_F_Heli_Items_Airport","A3_Structures_F_Heli_Items_Luggage","A3_Structures_F_Heli_Items_Sport",
"A3_Structures_F_Heli_Items_Tools","A3_Structures_F_Heli_VR_Helpers","A3_Structures_F_Heli_Items_Electronics","A3_Structures_F_Heli_Items_Food",
"A3_Anims_F_Heli","A3_Supplies_F_Heli","A3_Supplies_F_Heli_Bladders","A3_Supplies_F_Heli_CargoNets","A3_Supplies_F_Heli_Fuel","A3_Supplies_F_Heli_Slingload",
"A3_Air_F_RTD","A3_Boat_F_Heli_Boat_Armed_01","A3_Boat_F_Heli_SDV_01","A3_Data_F_Heli","A3_Missions_F_Heli","A3_Soft_F_Heli_Car",
"A3_Soft_F_Heli_MRAP_01","A3_Air_F_Heli_Heli_Transport_04","A3_Soft_F_Heli_MRAP_02","A3_Soft_F_Heli_MRAP_03","A3_Soft_F_Heli_Quadbike","A3_Soft_F_Heli_SUV",
"A3_Soft_F_Heli_Truck","A3_UI_F_Heli","A3_Air_F_Heli","A3_Air_F_Heli_Heli_Attack_01","A3_Air_F_Heli_Heli_Attack_02","A3_Air_F_Heli_Heli_Light_01","A3_Air_F_Heli_Heli_Light_02","A3_Air_F_Heli_Heli_Light_03",
"A3_Air_F_Heli_Heli_Transport_01","A3_Air_F_Heli_Heli_Transport_02","A3_Air_F_Heli_Heli_Transport_03","A3_Air_F_Heli_Heli_Transport_04",
"A3_CargoPoses_F_Heli","A3_Soft_F_Heli_Crusher_UGV","A3_LanguageMissions_F_MP_Mark","A3_Language_F_MP_Mark","A3_LanguageMissions_F_MP_Mark","A3_Data_F_Mark",
"A3_Functions_F_Mark","A3_Functions_F_MP_Mark","A3_Language_F_Mark","A3_Modules_F_Mark","A3_Modules_F_Mark_FiringDrills",
"A3_Modules_F_MP_Mark","A3_Modules_F_Mark_Objectives","A3_Music_F_Mark","A3_Structures_F_Mark_Items_Military",
"A3_Structures_F_Mark_Items_Sport","A3_Structures_F_Mark_Mil_Flags","A3_Structures_F_Mark_Training",
"A3_Structures_F_Mark_VR_Helpers","A3_Structures_F_Mark_VR_Shapes","A3_Structures_F_Mark_VR_Targets",
"A3_Anims_F_Mark_Deployment","A3_UI_F_Mark","A3_UI_F_MP_Mark","A3_Weapons_F_Mark_LongRangeRifles_DMR_01",
"A3_Weapons_F_Mark_EBR","A3_Weapons_F_Mark_LongRangeRifles_GM6","A3_Weapons_F_Mark_LongRangeRifles_GM6_camo",
"A3_Weapons_F_Mark_LongRangeRifles_M320","A3_Weapons_F_Mark_LongRangeRifles_M320_camo","A3_Weapons_F_Mark_Machineguns_M200",
"A3_Weapons_F_Mark_Machineguns_Zafir","A3_Weapons_F_Mark_Rifles_Khaybar","A3_Weapons_F_Mark_Rifles_Mk20","A3_Weapons_F_Mark_Rifles_MX",
"A3_Weapons_F_Mark_Rifles_SDAR","A3_Weapons_F_Mark_Rifles_TRG20","A3_Characters_F_Mark","A3_Static_F_Mark_Designator_01",
"A3_Static_F_Mark_Designator_02","A3_Supplies_F_Mark","A3_Weapons_F_Mark_Acc","A3_Missions_F_Mark","A3_Missions_F_MP_Mark",
"A3_Weapons_F_Mark","A3_Weapons_F_Mark_LongRangeRifles_DMR_02","A3_Weapons_F_Mark_LongRangeRifles_DMR_03","A3_Weapons_F_Mark_LongRangeRifles_DMR_04",
"A3_Weapons_F_Mark_LongRangeRifles_DMR_05","A3_Weapons_F_Mark_LongRangeRifles_DMR_06","A3_Weapons_F_Mark_Machineguns_MMG_01",
"A3_Weapons_F_Mark_Machineguns_MMG_02","AiA_A1AlwaysDummy","CAVideo2_PMC","CA_AnimsHotfix","CA_CutSceneAnims","CAIntroAnims","CAUSMCD","CAVoice","CAweapons3_aks74pso","CAWeapons3_ammocrates","CAweapons3_ksvk",
"CAweapons3_m107","CAweapons3_m16a4_acg_gl","CAweapons3_m16a4_acg","CAweapons3_m16a4_gl","CAweapons3_m16a4","CAWeapons3","CTI_buildingsBmp2_hq","CTI_buildingsM113_hq","DSHkM_Mini","M2HD_Mini","MK19_Tripod","Warfare",
"WarfareBuildings_Stinger_Twice_static","WarfareBuildings_T72_RACS","WarfareBuildings_TOW_Tripod","AiA_cba_xeh_a2_Dummy","AiA_CBA_A2_xeh_Dummy","AiA_cba_xeh_oa_Dummy","AiA_CBA_OA_xeh_Dummy","AiA_CA_Data","AiA_A10_Data",
"AiA_Afghan_Data","AiA_Air2_Data","AiA_Air3_Data","AiA_Air_Data","AiA_Air_e_Data","AiA_Animations_Data","AiA_Animations_Config","AiA_Bohemia_Data","AiA_Bootcamp_acr_Data","AiA_Buildings2_Data","AiA_Buildings2_Ind_Cementworks_Data",
"AiA_Buildings_Data","AiA_Ca_acr_Data","AiA_CA_Config","AiA_CA_Config_Data_ParticleEffects","CAData_ParticleEffects","AiA_Ca_e_Data","AiA_Ca_pmc_Data","AiA_Characters2_Data","AiA_Chernarus_Data","AiA_Chernarus_Data_Data",
"AiA_Chernarus_Data_Layers_Data","AiA_Chernarus_Summer_Data","AiA_Cti_buildings_Data","AiA_CA_Data_Data_ParticleEffects","AiA_Data_baf_Data","AiA_Desert2_Data","Desert2_Objects","AiA_Desert_Data","AiA_Desert_e_Data","AiA_Hotfix_Data",
"AiA_Introanims_Data","CALanguage","AiA_Language_acr_Data","AiA_Language_baf_Data","AiA_Language_e_Data","AiA_Language_pmc_Data","CALanguage_missions","AiA_Languagemissions_acr_Data","AiA_Languagemissions_baf_Data","CALanguage_missions_e",
"AiA_Languagemissions_pmc_Data","AiA_Misc2_Data","AiA_Misc3_Data","AiA_Misc_Data","AiA_Misc_acr_Data","AiA_Misc_e_Data","AiA_Plants2_Bush_Data","AiA_Plants2_Clutter_Data","AiA_Plants2_Misc_Data","AiA_Plants2_Plant_Data","AiA_Plants2_Tree_Data",
"AiA_Plants_Data","AiA_Plants_Config","CAPlants","AiA_Plants_e2_Data","AiA_Plants_e_Data","AiA_Plants_pmc_Data","AiA_Provinggrounds_pmc_Data","AiA_Roads2_Data","AiA_Roads2_Config","CARoads2","CARoads2Bridge","CARoads2Dam","AiA_Roads_Data","AiA_Roads_Config",
"CARoads","AiA_Roads_e_Data","AiA_Roads_pmc_Data","AiA_Roads_pmc_Config","CARoads_PMC_Bridge","AiA_Rocks2_Data","AiA_Rocks2_Config","CARocks2","AiA_Rocks_Data","AiA_Rocks_Config","CARocks","AiA_Rocks_e_Data","AiA_Sara_Data","AiA_Saralite_Data","AiA_Shapur_baf_Data",
"AiA_Signs2_Data","AiA_Signs2_Config","CASigns2","AiA_Signs_Data","AiA_Signs_Config","CASigns","AiA_Signs_e_Data","AiA_Sounds_Data","AiA_Sounds_Config","CASounds","AiA_Sounds_e_Data","AiA_Structures_Data","pond_test","AiA_Structures_e_Data","AiA_Structures_pmc_Data",
"AiA_Takistan_Data","AiA_Takistan_Data_Data","AiA_Takistan_Data_Layers_Data","AiA_Tracked2_Data","AiA_Tracked_Data","AiA_Tracked_e_Data","AiA_Ui_Data","AiA_Utes_Data","AiA_Utes_Config","Utes","AiA_Water2_Data","CAWater2_LHD","AiA_Water_Data","AiA_Weapons2_Data",
"AiA_Weapons_Data","AiA_Weapons_e_Data","AiA_Weapons_pmc_Data","AiA_Wheeled2_Data","AiA_Wheeled_Data","AiA_Wheeled_e_Data","AiA_Zargabad_Data","AiA_Models_DBE1_Data","Music_DBE1","ploty_DBE1","Roads_DBE1","AiA_Sara_dbe1_Data","Disable_XEH_Logging","AiA_TKOH_Dummy","HSim_Data_H",
"HSim_Data_H_data_ParticleEffects","HSim_Data_H_data_ParticleEffects_rotor_blades","HSim_Dubbing_H","HSim_DubbingRadio_H","HSim_Editor_H","Intro_Island_H","HSim_Missions_H","HSim_ModulesCore_H","HSim_ModulesCore_H_AmbientCombat","HSim_ModulesCore_H_DynO","HSim_ModulesCore_H_Functions",
"HSim_ModulesCore_H_GarbageCollector","HSim_ModulesCore_H_Functions_E","HSim_ModulesCore_H_OO","HSim_ModulesCore_H_Functions_PMC","HSim_Music_H","HSim_Sounds_H","South_Asia_H","HSim_UIFonts_H","United_States_H","HSim_Animals_H","HSim_Animals_H_Anim_Config","HSim_Animals_H_Dog","HSim_Characters_H_Faces",
"HSim_Characters_H_Heads","HSim_Modules_H","HSim_UI_H","HSim_Weapons_H","HSim_Weapons_H_AK47","HSim_Weapons_H_DShKM","HSim_Weapons_H_Glock","HSim_Weapons_H_HandItems","HSim_Weapons_H_M16","HSim_Weapons_US_H","HSim_Characters_H","HSim_Characters_US_H","HSim_Missions_H_FreeFlight","HSim_Functions_Base_H",
"HSim_Water_H","HSim_Water_H_Civ_FishingBoat_Large","HSim_Water_H_Civ_Jetboat","HSim_Water_H_Civ_Yacht","HSim_Water_H_Container_Ship","HSim_Water_H_Cruise_Ship","HSim_Water_H_Destroyer","HSim_Water_H_Fishing_Boat","HSim_Water_H_Fregata","HSim_Water_H_LHD","HSim_Water_H_Oil_tanker","HSim_Water_H_Rubber_Boat",
"HSim_Water_H_Whales","HSim_Water_H_Whales_GreyWhale","HSim_Water_H_Whales_Whale1","HSim_Weapons_H_IGLA","HSim_Weapons_US_H_M2","HSim_Wheeled_H","HSim_Wheeled_H_Ambulance","HSim_Wheeled_H_FireTruck","HSim_Wheeled_H_Hatchback","HSim_Wheeled_H_Military_Offroad_LR","HSim_Wheeled_H_Military_Pickup_DSHKM",
"HSim_Wheeled_H_Offroad","HSim_Wheeled_H_Police_Car","HSim_Wheeled_H_TowingTractor","HSim_Wheeled_H_Tractor","HSim_Wheeled_H_Trailers","HSim_Wheeled_H_Truck_Light_Transport","HSim_Wheeled_H_Ural","HSim_Wheeled_H_Van_Passenger","HSim_Wheeled_US_H","HSim_Wheeled_US_H_Military_Offroad","HSim_Wheeled_US_H_Military_Truck",
"HSim_Wheeled_US_H_Pickup_01","HSim_Wheeled_US_H_Pickup_02","HSim_Wheeled_US_H_SUV","HSim_Wheeled_US_H_Truck_US_Type","HSim_Air_H","HSim_Air_H_Aircraft_A","HSim_Air_H_Aircraft_C","HSim_Air_H_Aircraft_D","HSim_Air_H_Aircraft_E_H","HSim_Air_H_Airliner_A","HSim_Air_H_Airliner_B","HSim_Air_H_Parachute","HSim_Air_US_H",
"HSim_Air_US_H_Helicopters_Heavy","HSim_Air_US_H_Helicopters_Light","HSim_Air_US_H_Helicopters_Medium","HSim_Misc_H","HSim_Misc_H_Antena","HSim_Misc_H_Barels","HSim_Misc_H_Bleacher","HSim_Misc_H_BoardsPack","HSim_Misc_H_CncBlock","HSim_Misc_H_Doghouse","HSim_Misc_H_Engine_Crane","HSim_Misc_H_Fence","HSim_Misc_H_Fire_Extinguisher",
"HSim_Misc_H_Fire_Suppression","HSim_Misc_H_First_Aid","HSim_Misc_H_Flagpole","HSim_Misc_H_Folding_Ladder","HSim_Misc_H_FuelCan","HSim_Misc_H_Heliport_Furniture","HSim_Misc_H_Helicopter_Parts","HSim_Misc_H_Helipads","HSim_Misc_H_Heliport_Objects","HSim_Misc_H_Helpers","HSim_Misc_H_Info_Board","HSim_Misc_H_Infostands",
"HSim_Misc_H_Inspection_Visuals","HSim_Misc_H_Interior","HSim_Misc_H_Loudspeakers","HSim_Misc_H_Market","HSim_Misc_H_Office_Objects","HSim_Misc_H_Perimeter_Ligh","HSim_Misc_H_Pike","HSim_Misc_H_Platform_Cart","HSim_Misc_H_Portable_Generator","HSim_Misc_H_Props","HSim_Misc_H_SawHorse","HSim_Misc_H_Shooting_Range","HSim_Misc_H_Signs",
"HSim_Misc_H_Sink","HSim_Misc_H_Targets","HSim_Misc_H_Tent","HSim_Misc_H_Toilet","HSim_Misc_H_Tools","HSim_Misc_H_Tools_Racking","HSim_Misc_H_Trash","HSim_Misc_H_Weather_Station","HSim_Misc_H_Weld_Gastank","HSim_Misc_H_Wheel_Chocks","HSim_Misc_H_Wheeled_Scaffolding","HSim_Misc_H_wheeled_tool_cart","HSim_Misc_H_Wheeled_Whiteboard",
"HSim_Misc_H_Winch","HSim_Misc_H_Windsock","HSim_Misc_H_Workbench","HSim_Misc_H_Wrecks","HSim_Structures_H","HSim_Structures_H_Airport_Papi","HSim_Structures_H_Harbour","HSim_Structures_H_Heliports_Heliport_Big","HSim_Structures_H_Heliports_Heliport_Small","HSim_Structures_H_Industrial_A_CraneCon","HSim_Structures_H_Industrial_Rooftop_Objects",
"HSim_Structures_US_H","HSim_Structures_US_H_Bld_US","HSim_Structures_US_H_Landmarks_Space_Needle","HSim_Tracked_H","HSim_Tracked_H_BMP2","HSim_Tracked_US_H","HSim_Tracked_US_H_M1A2","HSim_Tracked_US_H_MLRS","HSim_Data_H_EditorGroups","HSim_Anims_H","HSim_Anims_H_config_sdr","HSim_Anims_H_config_wmn","Hsim_Language_H","Hsim_Language_missions_H",
"AiA_StandaloneTerrainPack_Dummy","CA_ACR","CA_Animals2_Anim_Config","CA_Anims_Char","CA_Anims_E_Wmn","CA_E","CA_PMC","CAAir","CACharacters","CATracked","CAUI","CAWater","CAWater2","CAWater2_seafox","CAWeapons","CAWeapons_Warfare_weapons","CAWheeled","CAWheeled_E","CAWheeled2","6G30_DBE1","Arma2_Ka52","BI_SRRS","CA_AH64D","CA_AIR_E_MQ9PredatorB",
"CA_AIR_E_Su25","CA_AIR2_Su25","CA_Animals_E","CA_Animals2","CA_Animals2_Chicken","CA_Animals2_Cow","CA_Animals2_Dogs","CA_Animals2_Dogs_Fin","CA_Animals2_Dogs_Pastor","CA_Animals2_Goat","CA_Animals2_Rabbit","CA_Animals2_Sheep","CA_Animals2_WildBoar","CA_Anims","CA_Anims_E","CA_Anims_E_Sdr","CA_Anims_Sdr","CA_Anims_Wmn",
"CA_CommunityConfigurationProject_E","CA_CruiseMissile","CA_Dubbing","CA_Dubbing_Baf","CA_Dubbing_Counterattack","CA_Dubbing_E","CA_Dubbing_PMC","CA_DubbingRadio_E","CA_DubbingRadio_PMC","CA_E_ParticleEffects","CA_Editor","CA_HC_Sounds","CA_Heads","CA_HighCommand","CA_L39","CA_Missions","CA_Missions_AlternativeInjurySimulation","CA_Missions_AmbientCombat",
"CA_Missions_Armory1","CA_Missions_Armory2","CA_Missions_BAF","CA_Missions_BAF_2","CA_Missions_BAF_Templates_SecOps","CA_Missions_BattlefieldClearance","CA_Missions_E","CA_Missions_E_Armory2","CA_Missions_E_SecOps","CA_Missions_E_Templates_SecOps","CA_Missions_FirstAidSystem","CA_Missions_GarbageCollector","CA_Missions_PMC","CA_Missions_SecOps","CA_Missions_Templates_SecOps",
"CA_Missions2_PMC","CA_Modules","CA_Modules_Alice","CA_Modules_Animals","CA_Modules_ARTY","CA_Modules_clouds","CA_Modules_Coin","CA_Modules_DynO","CA_Modules_E","CA_Modules_E_DynO","CA_Modules_E_Jukebox","CA_Modules_E_OO","CA_Modules_E_UAV","CA_Modules_E_UAV_Heli","CA_Modules_E_Weather","CA_Modules_Functions","CA_Modules_Marta","CA_Modules_PMC","CA_Modules_PMC_SimpleFIrstAid","CA_Modules_Silvie",
"CA_Modules_StratLayer","CA_Modules_UAV","CA_Modules_ZoRA","CA_MPA","CA_MPA_Challenges","CA_MPA_Core","CA_MPA_MP","CA_MPA_Scenarios","CA_Sounds_Baf","CA_SoundsMissions_E","CA_Support","CAA10","CAAir_BAF","CAAir_BAF_CH_47F","CAAir_E","CAAir_E_A10","CAAir_E_AH64D","CAAir_E_AH6J","CAAir_E_An2","CAAir_E_C130J","CAAir_E_CH_47F","CAAir_E_Halo","CAAir_E_Mi24","CAAir_E_MI8","CAAir_E_UH1H_EP1","CAAir_E_UH60M",
"CAAir_PMC","CAAir_PMC_KA137","CAAir_PMC_KA60","CAAir2","CAAir2_C130J","CAAir2_ChukarTarget","CAAir2_F35B","CAAir2_MQ9PredatorB","CAAir2_MV22","CAAir2_Pchela1T","CAAir2_UH1Y","CAAir3","CAAir3_Su34","CAAnimals","CACharacters_BAF","CACharacters_BAF_Head","CACharacters_E","CACharacters_E_Head","CACharacters_PMC","CACharacters_PMC_Head","CACharacters_W_BAF","CACharacters2","CAFonts","CAMisc_fix","CAMisc_fix_A2FREE",
"CAMisc_fix_air","CAMisc_fix_Ch2","CAMisc_fix_Str","CAMisc_fix_Weap","CAMP_Armory_Misc","CAMP_Armory_Misc_Concrete_Wall","CAMP_Armory_Misc_Entrance_Gate","CAMP_Armory_Misc_Info_Board","CAMP_Armory_Misc_Infostands","CAMP_Armory_Misc_Laptop","CAMP_Armory_Misc_Loudspeakers","CAMP_Armory_Misc_Plasticpole","CAMP_Armory_Misc_Red_Light","CAMP_Armory_Misc_Sign_Armex","CAMP_Armory_Misc_Sign_Direction","CAMusic","CAMusic_E","CAMusic_PMC",
"CASounds_E","CASounds_Missions","CATracked_BAF","CATracked_E","CATracked_E_BMP2","CATracked_E_M1_Abrams","CATracked_E_M113","CATracked_E_M2A2_Bradley","CATracked_E_T34","CATracked_E_T55","CATracked_E_T72","CATracked_E_us_m270mlrs","CATracked_E_ZSU","CATracked_W_BAF","CATracked2","CATracked2_2S6M_Tunguska","CATracked2_AAV","CATracked2_BMP3","CATracked2_T34","CATracked2_T90","CATracked2_us_m270mlrs","CAWater2_Destroyer","CAWater2_fishing_boat",
"CAWater2_Fregata","CAWater2_smallboat_1","CAWeapons_2b14_82mm_Mortar","CAWeapons_AK","CAWeapons_AmmoBoxes","CAWeapons_BAF","CAWeapons_bizon","CAWeapons_Colt1911","CAWeapons_DMR","CAWeapons_E","CAWeapons_E_AGS","CAWeapons_E_AK","CAWeapons_E_AmmoBoxes","CAWeapons_E_Colt1911","CAWeapons_E_D30","CAWeapons_E_DSHKM","CAWeapons_E_FIM92_static","CAWeapons_E_fnfal","CAWeapons_E_G36","CAWeapons_E_GrenadeLauncher","CAWeapons_E_Igla","CAWeapons_E_Javelin",
"CAWeapons_E_KORD","CAWeapons_E_ksvk","CAWeapons_E_LeeEnfield","CAweapons_E_m107","CAWeapons_E_M110","CAWeapons_E_M119_Howitzer","CAWeapons_E_M136","CAWeapons_E_M14","CAWeapons_E_M16","CAWeapons_E_M240","CAWeapons_E_M252_81mm_Mortar","CAWeapons_E_M2StaticMG","CAWeapons_E_M47","CAWeapons_E_M9","CAWeapons_E_MAAWS","CAWeapons_E_Makarov","CAWeapons_E_Metis","CAWeapons_E_Mk19_MiniTriPod","CAWeapons_E_PK",
"CAWeapons_E_Podnos_2b14_82mm","CAWeapons_E_RPG18","CAWeapons_E_RPG7","CAWeapons_E_scar","CAWeapons_E_Searchlight","CAWeapons_E_SPG9","CAWeapons_E_STATIC","CAWeapons_E_Stinger","CAWeapons_E_Strela","CAWeapons_E_TOW","CAWeapons_E_ZU23","CAWeapons_Kord","CAweapons_ksvk","CAWeapons_M1014","CAweapons_m107","CAWeapons_M252_81mm_Mortar","CAWeapons_Metis_AT_13","CAWeapons_PMC","CAWeapons_PMC_AA_12","CAWeapons_PMC_AS50",
"CAWeapons_PMC_XM8","CAWeapons_Saiga12K","CAWeapons_SPG9","CAWeapons_VSS_vintorez","CAWeapons_ZU23","CAWeapons2","CAWeapons2_HuntingRifle","CAWeapons2_RPG18","CAWeapons2_SMAW","CAWheeled_D_BAF","CAWheeled_E_ATV","CAWheeled_E_BRDM2","CAWheeled_E_BTR40","CAWheeled_E_BTR60","CAWheeled_E_HMMWV","CAWheeled_E_Ikarus","CAWheeled_E_LADA","CAWheeled_E_LandRover","CAWheeled_E_M1030","CAWheeled_E_MTVR","CAWheeled_E_Offroad",
"CAWheeled_E_Old_bike","CAWheeled_E_Old_moto","CAWheeled_E_Pickup","CAWheeled_E_s1203","CAWheeled_E_SCUD","CAWheeled_E_stryker","CAWheeled_E_SUV","CAWheeled_E_TT650","CAWheeled_E_UAZ","CAWheeled_E_Ural","CAWheeled_E_V3S","CAWheeled_E_Volha","CAWheeled_Offroad","CAWheeled_Pickup","CAWheeled_PMC","CAWheeled_PMC_ArmoredSUV","CAWheeled_W_BAF","CAWheeled2_BTR90","CAWheeled2_GAZ39371","CAWheeled2_HMMWV_Ambulance","CAWheeled2_HMMWV_BASE",
"CAWheeled2_Ikarus","CAWheeled2_Kamaz","CAWheeled2_LADA","CAWheeled2_LAV25","CAWheeled2_M1114_Armored","CAWheeled2_M998A2_Avenger","CAWheeled2_MMT","CAWheeled2_MTVR","CAWheeled2_TowingTractor","CAWheeled2_V3S","CAWheeled2_VWGolf","CAWheeled3","CAWheeled3_M1030","CAWheeled3_TT650","Datsun_armed_DBE1","DBE1","DBE1_UI","DC3_DBE1","HALO_Test","Hilux_armed_DBE1","Warfare2","Warfare2_E","Warfare2Vehicles","AiA_Buildings_Config","CABuildings",
"CABuildings_Misc","Desert2_Buildings","CA_desert2_Characters","DBE1_Hotfix","AiA_Language_acr_Config","CALanguage_ACR","AiA_Language_e_Config","CALanguage_e","AiA_Language_pmc_Config","CALanguage_PMC","AiA_Languagemissions_acr_Config","CALanguage_missions_ACR","AiA_Languagemissions_pmc_Config","CALanguage_missions_PMC","AiA_Misc_Config","CAMisc","CAWater2_seafox_EP1","AiA_Roads_e_Config","CARoads_E","AiA_Rocks_e_Config","CARocks_E",
"AiA_Sara_Config","Sara","AiA_Saralite_Config","SaraLite","AiA_Structures_Config","CAStructures","CAStructures_A_BuildingWIP","CAStructures_A_CraneCon","CAStructuresLand_A_MunicipalOffice","CAStructuresBarn_W","CAStructures_Castle","CAStructuresHouse","CAStructuresHouse_A_FuelStation","CAStructuresHouse_A_Hospital","CAStructuresHouse_A_Office01","CAStructuresHouse_A_Office02","CAStructuresHouse_a_stationhouse","CAStructuresHouse_Church_02",
"CAStructuresHouse_Church_03","CAStructuresHouse_Church_05R","CAStructuresHouse_HouseBT","CAStructuresHouse_HouseV2","CAStructuresHouse_HouseV","CAStructuresLand_Ind_Stack_Big","CAStructures_IndPipe1","CAStructuresInd_Quarry","Ind_SawMill","CAStructures_Mil","CAStructures_Misc","CAStructures_Misc_Armory","CAStructures_Misc_Armory_Armor_Popuptarget","CAStructures_Misc_Powerlines","CAStructures_Nav","CAStructuresLand_Nav_Boathouse","CAStructures_Proxy_BuildingParts",
"CAStructures_Proxy_Ruins","CAStructures_Rail","CAStructuresHouse_rail_station_big","CAStructures_Ruins","CAStructuresShed_Small","CAStructuresHouse_Shed_Ind","CAStructures_Wall","AiA_Models_DBE1_Config","Models_DBE1","Anims_DBE1","HMMWV_DBE1","Kamenolom_DBE1","Mercenary_DBE1","Misc_DBE1","NPCs_DBE1","Pila_DBE1","Prisoners_DBE1","UH60Desert","UI_DBE1","Vysilac_DBE1","Zakladna_DBE1","AiA_Sara_dbe1_Config","Sara_dbe1","AiA_Buildings2_Config","CABuildings2","A_Crane_02",
"A_GeneralStore_01","CABuildings2_A_Pub","A_statue","Barn_Metal","CABuildingParts","CABuildingParts_Signs","CATEC","Church_01","Farm_Cowshed","Farm_WTower","CAHouseBlock_A","CAHouseBlock_B","CAHouseBlock_C","CAHouseBlock_D","HouseRuins","Ind_Dopravnik","Ind_Expedice","Ind_MalyKomin","Ind_Mlyn","Ind_Pec","ind_silomale","Ind_SiloVelke","Ind_Vysypka","Ind_Garage01","CAStructures_IndPipe1_todo_delete","IndPipe2","Ind_Shed_01","Ind_Shed_02","Ind_Tank","Ind_Workshop01",
"CABuildings2_Misc_Cargo","Misc_PowerStation","Misc_WaterStation","Rail_House_01","Shed_small","Shed_wooden","particle_effects","AiA_Chernarus_Config","Chernarus","AiA_Chernarus_Summer_Config","Chernarus_Summer","AiA_Desert2_Config","Porto","AiA_Desert_Config","Desert","AiA_Hotfix_Config","CA_Hotfix","CA_QGClutterHotfix","CA_Hotfix_vez_ropa","AiA_Misc2_Config","CAMisc2","AiA_Misc3_Config","CAMisc3","WarfareBuildings","AiA_Misc_e_Config","CAMisc_E","CAMisc_E_WF",
"AiA_Signs_e_Config","CASigns_E","A_TVTower","CAStructures_Nav_pier","CAStructures_Railway","AiA_Structures_e_Config","CAStructures_E","CAStructures_E_HouseA","CAStructures_E_HouseA_A_BuildingWIP","CAStructures_E_HouseA_A_CityGate1","CAStructures_E_HouseA_A_Minaret","CAStructures_E_HouseA_A_Minaret_Porto","CAStructures_E_HouseA_A_Mosque_big","CAStructures_E_HouseA_A_Mosque_small","CAStructures_E_HouseA_A_Office01","CAStructures_E_HouseA_a_stationhouse",
"CAStructures_E_HouseA_A_Statue","CAStructures_E_HouseA_A_Villa","CAStructures_E_HouseC","CAStructures_E_HouseK","CAStructures_E_HouseL","CAStructures_E_Ind","CAStructures_E_Ind_Ind_Coltan_Mine","CAStructures_E_Ind_Ind_FuelStation","CAStructures_E_Ind_Ind_Garage01","CAStructures_E_Ind_Oil_Mine","CAStructures_E_Ind_IndPipes","CAStructures_E_Ind_Misc_PowerStation","CAStructures_E_Ind_Ind_Shed","CAStructures_E_Mil","CAStructures_E_Misc",
"CAStructures_E_Misc_Misc_cables","CAStructures_E_Misc_Misc_Construction","CAStructures_E_Misc_Misc_Garbage","CAStructures_E_Misc_Misc_Interier","CAStructures_E_Misc_Misc_Lamp","CAStructures_E_Misc_Misc_Market","CAStructures_E_Misc_Misc_powerline","CAStructures_E_Misc_Misc_Water","CAStructures_E_Misc_Misc_Well","CAStructures_E_Wall","CAStructures_E_Wall_Wall_L","AiA_Structures_pmc_Config","CAStructures_PMC","CAStructures_PMC_Buildings",
"CAStructures_PMC_Buildings_Bunker","CAStructures_PMC_Buildings_GeneralStore_PMC","CAStructures_PMC_Buildings_Ruin_Cowshed","CAStructures_PMC_Ind","CAStructures_PMC_FuelStation","CAStructures_PMC_Misc","CAStructures_PMC_Misc_Shed","CAStructures_PMC_Ruins","CAStructures_PMC_Walls","AiA_Takistan_Config","Takistan","AiA_Zargabad_Config","zargabad","AiA_Afghan_Config","Mountains_ACR","AiA_Bohemia_Config","Woodland_ACR","AiA_Bootcamp_acr_Config",
"Bootcamp_ACR","AiA_Data_baf_Config","CA_BAF","AiA_Desert_e_Config","Desert_E","AiA_Language_baf_Config","CALanguage_Baf","AiA_Languagemissions_baf_Config","CALanguageMissions_baf","AiA_Misc_acr_Config","CAMisc_ACR","CAMisc_ACR_3DMarkers","CAMisc_ACR_Container","CAMisc_ACR_Dog","CAMisc_ACR_Helpers","CAMisc_ACR_PBX","CAMisc_ACR_ScaffoldingSmall","CAMisc_ACR_Shooting_range","CAMisc_ACR_Sign_Mines","CAMisc_ACR_Targets","CAMisc_ACR_Targets_InvisibleTarget",
"CAMisc_ACR_TestSphere","AiA_Provinggrounds_pmc_Config","ProvingGrounds_PMC","AiA_Shapur_baf_Config","Shapur_BAF","AiA_BaseConfig_F","AiA_Core","AiA_Worlds","AiA_Worlds_Ambient","AiA_Worlds_Clutter","AiA_Worlds_ClutterDist","AiA_Worlds_Delete","AiA_Worlds_DisableInfiniteTerrain","AiA_Worlds_DustEffects","AiA_Worlds_EnvSounds","AiA_Worlds_FullDetailDist","AiA_Worlds_Intros","AiA_Worlds_Lighting","AiA_Worlds_Lighting_Chernarus","AiA_Worlds_Lighting_Desert",
"AiA_Worlds_MapSize","AiA_Worlds_MidDetailTexture","AiA_Worlds_NoDetailDist","AiA_Worlds_PictureMap","AiA_Worlds_PictureShot","AiA_Worlds_Seabed","AiA_Worlds_SkyTexture","AiA_Worlds_StreetLamp","AiA_Worlds_Surfaces","AiA_Worlds_Water","AiA_StandaloneTerrainPack_Core","AiA_StandaloneTerrainPack_Core_Faction","AiA_StandaloneTerrainPack_Core_VehicleClass",
"AiA_Worlds_Author","AiA_Worlds_Grid","rhs_c_heavyweapons","rhs_c_radars","rhs_c_weapons","rhs_decals","rhs_heavyweapons","rhs_radars","rhs_sounds","rhs_weapons2","rhs_weapons","rhsusf_a2port_car","rhsusf_c_a2port_car","rhsusf_c_weapons","rhsusf_decals","rhsusf_weapons","A3_Air_F","A3_Air_F_Heli_Light_01","A3_Air_F_Heli_Light_02","A3_Air_F_Beta","A3_Air_F_Beta_Heli_Attack_01","A3_Air_F_Beta_Heli_Attack_02","A3_Air_F_Beta_Heli_Transport_01","A3_Air_F_Beta_Heli_Transport_02",
"A3_Air_F_Beta_Parachute_01","A3_Air_F_Beta_Parachute_02","A3_Air_F_EPB_Heli_Light_03","A3_Air_F_EPC_Plane_CAS_01","A3_Air_F_EPC_Plane_CAS_02","A3_Air_F_Gamma_Plane_Fighter_03","A3_Air_F_Heli","A3_Air_F_Heli_Heli_Attack_01","A3_Air_F_Heli_Heli_Attack_02","A3_Air_F_Heli_Heli_Light_01","A3_Air_F_Heli_Heli_Light_02","A3_Air_F_Heli_Heli_Light_03","A3_Air_F_Heli_Heli_Transport_01","A3_Air_F_Heli_Heli_Transport_02","A3_Air_F_Heli_Heli_Transport_03","A3_Air_F_Heli_Heli_Transport_04",
"A3_Armor_F","A3_armor_f_beta","A3_Armor_F_Panther","A3_armor_f_beta_APC_Tracked_02","A3_Armor_F_EPB_APC_tracked_03","A3_Armor_F_EPB_MBT_03","A3_Armor_F_Slammer","A3_Armor_F_T100K","A3_Boat_F","A3_Boat_F_Boat_Armed_01","A3_Boat_F_Boat_Transport_01","A3_Boat_F_Beta_Boat_Armed_01","A3_Boat_F_Beta_Boat_Transport_01","A3_Boat_F_SDV_01","A3_Boat_F_EPC_Submarine_01_F","A3_Boat_F_Civilian_Boat","A3_Boat_F_Trawler","A3_Boat_F_Gamma_Boat_Transport_01","A3_Boat_F_Heli_Boat_Armed_01",
"A3_Boat_F_Heli_SDV_01","A3_Characters_F_Common","A3_Characters_F_Bootcamp_Common","A3_Characters_F_EPA","A3_Characters_F_EPB","A3_Characters_F_EPC","A3_Characters_F_Kart","A3_Data_F_Curator_Characters","A3_Data_F_Curator_Virtual","A3_Data_F_Heli","A3_Air_F_Gamma_UAV_01","A3_Air_F_Gamma_UAV_02","A3_Missions_F_Bootcamp","A3_Missions_F_Curator","A3_Missions_F_EPA","A3_Missions_F_EPB","A3_Missions_F_EPC","A3_Missions_F_Heli","A3_Missions_F_Mark","A3_Missions_F_MP_Mark",
"A3_Modules_F_Bootcamp_Misc","A3_Modules_F_Curator_Chemlights","A3_Soft_F","A3_Soft_F_MRAP_01","A3_Soft_F_MRAP_02","A3_Soft_F_Offroad_01","A3_Soft_F_Quadbike","A3_Soft_F_MRAP_03","A3_Soft_F_Beta_Quadbike","A3_Soft_F_HEMTT","A3_Soft_F_TruckHeavy","A3_Soft_F_EPC_Truck_03","A3_Soft_F_Car","A3_Soft_F_Gamma_Offroad","A3_Soft_F_Gamma_Quadbike","A3_Soft_F_SUV","A3_Soft_F_Gamma_HEMTT","A3_Soft_F_Gamma_TruckHeavy","A3_Soft_F_Truck","A3_Soft_F_Heli_Car","A3_Soft_F_Heli_MRAP_01",
"A3_Soft_F_Heli_MRAP_02","A3_Soft_F_Heli_MRAP_03","A3_Soft_F_Heli_Quadbike","A3_Soft_F_Heli_SUV","A3_Soft_F_Heli_Truck","A3_Soft_F_Kart_Kart_01","A3_Static_F_Gamma_AA","A3_Static_F_Gamma_AT","A3_Structures_F_Mil_Scrapyard","A3_Structures_F_Wrecks","A3_Structures_F_EPA_Mil_Scrapyard","A3_Weapons_F_Bootcamp","A3_Weapons_F_Mark","A3_Weapons_F_Mark_LongRangeRifles_DMR_02","A3_Weapons_F_Mark_LongRangeRifles_DMR_03","A3_Weapons_F_Mark_LongRangeRifles_DMR_04","A3_Weapons_F_Mark_LongRangeRifles_DMR_05",
"A3_Weapons_F_Mark_LongRangeRifles_DMR_06","A3_Weapons_F_Mark_Machineguns_MMG_01","A3_Weapons_F_Mark_Machineguns_MMG_02","rhs_c_cars","rhs_c_troops","rhs_infantry","rhs_tigr","rhsusf_c_fmtv","rhsusf_c_HEMTT_A2","rhsusf_c_rg33","rhsusf_c_troops","rhsusf_fmtv","rhsusf_hemtt_a2","rhsusf_infantry","rhsusf_rg33","A3_Air_F_EPC_Plane_Fighter_03","A3_Armor_F_AMV","A3_Armor_F_Marid","A3_Armor_F_EPC_MBT_01","A3_Armor_F_APC_Wheeled_03","A3_CargoPoses_F","A3_CargoPoses_F_Heli","A3_Soft_F_Crusher_UGV",
"A3_Soft_F_Bootcamp_Offroad_01","A3_Soft_F_Bootcamp_Quadbike","A3_Soft_F_Bootcamp_Truck","A3_Soft_F_Heli_Crusher_UGV","rhs_c_2s3","rhs_c_a2port_air","RHS_A2_AirImport","rhs_c_a2port_car","RHS_A2_CarsImport","rhs_c_a3retex","rhs_c_bmd","rhs_c_bmp3","rhs_c_bmp","rhs_c_btr","rhs_c_rva","rhs_c_sprut","rhs_c_t72","rhs_c_tanks","rhs_c_trucks","rhs_gaz66","rhs_sprut","rhs_ss21","rhs_t72","rhs_t80","rhs_t80u","rhsusf_c_heavyweapons","rhsusf_vehicles","rhsusf_c_hmmwv","rhsusf_c_m109",
"rhsusf_c_m113","rhsusf_c_m1a1","rhsusf_c_m1a2","rhsusf_heavyweapons","rhsusf_hmmwv","rhsusf_m109","rhsusf_m113","rhsusf_m1a1","rhsusf_m1a2","rhsusf_sounds","rhs_2s3","rhs_a2port_air","rhs_a2port_car","rhs_a3retex","rhs_bmd","rhs_bmd_34","rhs_bmp3","rhs_bmp","rhs_btr70","rhs_btr80","rhs_c_a2port_armor","rhs_cti_insurgents","RHS_US_A2_AirImport","RHS_US_A2Port_Armor","rhs_a2port_armor","rhsusf_a2port_air2","rhsusf_a2port_air",
"rhsusf_a2port_armor"]
];

uiNamespace setVariable["RscDisplayRemoteMissions",displayNull]; //For Spy-Glass..
uiNamespace setVariable["RscDisplayMultiplayer",displayNull];

_binConfigPatches = configFile >> "CfgPatches";
for "_i" from 0 to count (_binConfigPatches)-1 do {
	_patchEntry = _binConfigPatches select _i;
	if(isClass _patchEntry) then {
		if(!((configName _patchEntry) in _patchList)) exitWith {
			[[profileName,steamid,(configName _patchEntry)],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[profileName,format["Unknown Addon Patch: %1",(configName _patchEntry)]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			[[SPY,[(format["Unknown Addon Patch: %1",(configName _patchEntry)])],profileName,steamid],"TON_fnc_logIt",false,false] call life_fnc_MP;
			sleep 0.5;
			failMission "SpyGlass";
		};
	};
};

//Check for copy-pasters of Dev-Con styled execution.
//Because I am nice, add these to the following below to allow CBA; "CBA_CREDITS_CONT_C","CBA_CREDITS_M_P
private["_children","_allowedChildren"];
_children = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;
_allowedChildren = [
"Title","MissionTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn","ButtonOptions",
"ButtonVideo","ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints","ButtonAbort","DebugConsole",
"Version","TraffLight","Feedback","MessageBox"
];

{
	if(!((configName _x) in _allowedChildren)) exitWith {
		[[profileName,steamid,"Modified_MPInterrupt"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
		[[profileName,"Devcon like executor detected"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
		[[SPY,["Devcon like executor detected"],profileName,steamid],"TON_fnc_logIt",false,false] call life_fnc_MP;
		sleep 0.5;
		failMission "SpyGlass";
	};
} foreach _children;

/*
	Display Validator
	Loops through and makes sure none of the displays were modified..
	
	TODO: Run check every x minutes and validate all displays.
*/
{
	_onLoad = getText(configFile >> (_x select 0) >> "onLoad");
	_onUnload = getText(configFile >> (_x select 0) >> "onUnload");
	if(_onLoad != (_x select 1) OR _onUnload != (_x select 2)) exitWith {
		[[profileName,steamid,format["Modified_Method_%1",_x select 0]],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
		[[profileName,format["Modified Display Method %1 (Memory Edit)",_x select 0]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
		[[SPY,[(format["Modified Display Method %1 (Memory Edit)",_x select 0])],profileName,steamid],"TON_fnc_logIt",false,false] call life_fnc_MP;
		sleep 0.5;
		vehicle player setVelocity[1e10,1e14,1e18]; //It's a surprise.
		sleep 3;
		preProcessFile "SpyGlass\endoftheline.sqf";
		sleep 2.5;
		failMission "SpyGlass";
	};
}
foreach [												
	["RscDisplayMainMap","[""onLoad"",_this,""RscDiary"",'MpMarkDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'MpMarkDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayGetReady","[""onLoad"",_this,""RscDiary"",'MpMarkDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'MpMarkDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayInventory","[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayLoadMission","[""onLoad"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayInterrupt","[""onLoad"",_this,""RscDisplayInterrupt"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInterrupt"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayOptionsVideo","[""onLoad"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayOptions","[""onLoad"",_this,""RscDisplayOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayAVTerminal","[""onLoad"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayConfigureAction","[""onLoad"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayConfigureControllers","[""onLoad"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayControlSchemes","[""onLoad"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayCustomizeController","[""onLoad"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayDebriefing","[""onLoad"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayDiary","[""onLoad"",_this,""RscDiary"",'MpMarkDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'MpMarkDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayGameOptions","[""onLoad"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayJoystickSchemes","[""onLoad"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayLoading","[""onLoad"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayMicSensitivityOptions","[""onLoad"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayOptionsAudio","[""onLoad"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayOptionsLayout","[""onLoad"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayStart","[2] call compile preprocessfilelinenumbers gettext (configfile >> 'CfgFunctions' >> 'init'); ['onLoad',_this,'RscDisplayLoading','Loading'] call (uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayInsertMarker","[""onLoad"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"]
];

/* Forgot to include this but this is also also a popular method for "unreleased" stuff */
if(getText(configFile >> "CfgFunctions" >> "init") != "A3\functions_f\initFunctions.sqf") then {
	[[profileName,steamid,"Modified_Functions_Init"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Modified_Functions_Init"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	[[SPY,["Modified_Functions_Init"],profileName,steamid],"TON_fnc_logIt",false,false] call life_fnc_MP;
	sleep 0.5;
	vehicle player setVelocity[1e10,1e14,1e18]; //It's a surprise.
	sleep 3;
	preProcessFile "SpyGlass\endoftheline.sqf";
	sleep 2.5;
	failMission "SpyGlass";
};

[] execVM "SpyGlass\fn_cmdMenuCheck.sqf";
[] execVM "SpyGlass\fn_variableCheck.sqf";
[] execVM "SpyGlass\fn_menuCheck.sqf";
