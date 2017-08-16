/*
	Author: Maverick Applications
	Convoy sidemission for Altis Life servers
*/

class Maverick_ConvoySidemission
{
	class Config
	{
		ConfigPool[] 							= {"GoldBarTransport","WeaponTransport"};
		ForceConfigAtIndex 						= -1;
		SleepTime								= 20;
		MakePlayersHostileFor					= 180;
		SidesNotAttackable[]					= {};
		AIDifficulty[] = {
												{"aimingAccuracy", 1},
												{"aimingShake", 1},
												{"aimingSpeed", 1},
												{"endurance", 1},
												{"spotDistance", 1},
												{"spotTime", 1},
												{"courage", 1},
												{"reloadSpeed", 1},
												{"commanding", 1},
												{"general", 1}
		};
	};
	class ConvoyConfigurationsPool
	{
		/*********************** EXAMPLE TRANSPORT FOR VIRTUAL ITEMS ***********************/
		class GoldBarTransport
		{
			class MapConfiguration
			{
				showMapMarker					= 1;
				text							= "Gold Transporter";
			};

			class AIUnits
			{
				gear[] = {
												"H_MilCap_gen_F", // Headgear
												"", // Glasses
												"U_B_GEN_Soldier_F", // Uniform
												"V_TacVest_gen_F", // Vest
												"", // Backpack
												{"arifle_SPAR_01_blk_F", "30Rnd_556x45_Stanag", 5}, // Primary weapon, ammo and how many magazines
												{"", "", 5}, // Secondary weapon, ammo and how many magazines
				};
			};

			class Messages
			{
				// Enable messages?
				enabled							= 1;

				// Mission started announcement
				startAnnouncementHeader			= "Gold Transport";
				startAnnouncementDescription	= "Schwer bewachter Transporter der Federal Reserve Bank bewegt derzeit größere Mengen an Gold.Bleiben sie fern es wird scharf geschossen";

				// Mission objective completed
				stoppedAnnouncementHeader		= "Gold Transporter disabled";
				stoppedAnnouncementDescription	= "Der Gold Transporter wurde von Räubern beschädigt und zum stehen gebracht.";

				// Mission completed announcement
				endAnnouncementHeader			= "Gold Transport ist beendet";
				endAnnouncementDescription  	= "Die Mission ist zu Ende.";
			}
			
			class Vehicles
			{
				// Vehicle configuration
				vehiclesInOrder[]				= {"O_T_LSV_02_armed_F","O_T_Truck_03_ammo_ghex_F","O_T_LSV_02_unarmed_F"};
				vehiclesSpawnMarkersInOrder[]	= {"mav_convoy_spawn2_1","mav_convoy_spawn2","mav_convoy_spawn3_3"};
				vehiclesInheritDirection		= 1;
				mainVehicleAtIndex				= 1;
				maxSpeed						= 30;
				removeVehiclesAfterSeconds		= 600;
				additionalUnitsAmount			= 10;
			};

			class Route
			{
				// Route configuration
				markers[] 						= {"mav_con_way1","mav_con_way2","mav_con_way3","mav_con_way4","mav_con_way5","mav_con_way6","mav_con_way7","mav_con_way8","mav_con_way10","mav_con_way11","mav_con_way12","mav_con_way13"};
			};

			class Loot
			{
				type 							= "virtual";
				container						= "Land_CargoBox_V1_F";
				data[] = {
												{"goldbar", 10}
				};
			};
		};


		/*********************** EXAMPLE TRANSPORT FOR REAL ITEMS ***********************/
		class WeaponTransport
		{
			class MapConfiguration
			{
				showMapMarker					= 1;
				text							= "Uran Transporter";
			};

			class AIUnits
			{
				gear[] = {
												"H_MilCap_gen_F", // Headgear
												"", // Glasses
												"U_B_GEN_Soldier_F", // Uniform
												"V_TacVest_gen_F", // Vest
												"", // Backpack
												{"arifle_SPAR_01_blk_F", "30Rnd_556x45_Stanag", 5}, // Primary weapon, ammo and how many magazines
												{"", "", 5}, // Secondary weapon, ammo and how many magazines
				};
			};

			class Messages
			{
				// Enable messages?
				enabled							= 1;

				// Mission started announcement
				startAnnouncementHeader			= "Uran Transport";
				startAnnouncementDescription	= "Die Regierung hat einen Illegalen Uran Transporter gesichtet und warnt vor Verstrahlung.";

				// Mission objective completed
				stoppedAnnouncementHeader		= "Illegaler Uran Transporter wurde gestoppt";
				stoppedAnnouncementDescription	= "Illegaler Uran Transporter wurde beschädigt.";

				// Mission completed announcement
				endAnnouncementHeader			= "Uran Transport ended";
				endAnnouncementDescription  	= "Die Mission ist zu Ende.";
			};

			class Vehicles
			{
				// Vehicle configuration
				vehiclesInOrder[]				= {"O_T_LSV_02_armed_F","O_T_LSV_02_unarmed_F","O_T_Truck_03_ammo_ghex_F","O_T_LSV_02_unarmed_F"};
				vehiclesSpawnMarkersInOrder[]	= {"mav_convoy_spawn11","mav_convoy_spawn22","mav_convoy_spawn33","mav_convoy_spawn44"};
				vehiclesInheritDirection		= 1;
				mainVehicleAtIndex				= 2;
				maxSpeed						= 50;
				removeVehiclesAfterSeconds		= 600;
				additionalUnitsAmount			= 10;
			};

			class Route
			{
				// Route configuration
				markers[] 						= {"mav_con_way111","mav_con_way22","mav_con_way33","mav_con_way44","mav_con_way55","mav_con_way66","mav_con_way77","mav_con_way88","mav_con_way99","mav_con_way1112","mav_con_way222","mav_con_way333","mav_con_way444"};
			};

			class Loot
			{
				type 							= "virtual";
				container						= "Land_CargoBox_V1_F";
				data[] = {
												{"uran2_refined", 10}
			};	};
		};
	};
};