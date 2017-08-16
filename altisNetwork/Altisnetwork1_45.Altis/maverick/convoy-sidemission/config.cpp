/*
	Author: Maverick Applications
	Convoy sidemission for Altis Life servers
*/

class Maverick_ConvoySidemission
{
	class Config
	{
		ConfigPool[] 							= {"GoldBarTransport","WeaponTransport"};
		ForceConfigAtIndex 						= 1;
		SleepTime								= 5;
		MakePlayersHostileFor					= 60;
		TimeoutBetweenMarkers					= 300;
		SidesNotAttackable[]					= {"WEST"};
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
				text							= "Gold Transport";
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
				startAnnouncementDescription	= "The Federal Reserve's guarded transporter is currently moving larger amounts of gold.";

				// Mission objective completed
				stoppedAnnouncementHeader		= "Gold Transporter disabled";
				stoppedAnnouncementDescription	= "The gold transporter has been disabled.";

				// Mission completed announcement
				endAnnouncementHeader			= "Gold Transport ended";
				endAnnouncementDescription  	= "The mission has ended.";
			};

			class Vehicles
			{
				// Vehicle configuration
				vehiclesInOrder[]				= {"O_T_LSV_02_armed_F","O_T_Truck_03_ammo_ghex_F","O_T_LSV_02_unarmed_F"};
				vehiclesSpawnMarkersInOrder[]	= {"mav_convoy_spawn1","mav_convoy_spawn2","mav_convoy_spawn3"};
				vehiclesInheritDirection		= 1;
				mainVehicleAtIndex				= 1;
				maxSpeed						= 50;
				removeVehiclesAfterSeconds		= 600;
				additionalUnitsAmount			= 10;
			};

			class Route
			{
				// Route configuration
				markers[] 						= {"mav_convoy_waypoint1","mav_convoy_waypoint2","mav_convoy_waypoint3","mav_convoy_waypoint4","mav_convoy_waypoint5"};
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
				text							= "Weapon Transport";
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
				startAnnouncementHeader			= "Weapon Transport";
				startAnnouncementDescription	= "The local army is currently transporting larger amounts of weapons through Altis with ground vehicles.";

				// Mission objective completed
				stoppedAnnouncementHeader		= "Weapon Transporter disabled";
				stoppedAnnouncementDescription	= "The Weapon transporter has been disabled.";

				// Mission completed announcement
				endAnnouncementHeader			= "Weapon Transport ended";
				endAnnouncementDescription  	= "The mission has ended.";
			};

			class Vehicles
			{
				// Vehicle configuration
				vehiclesInOrder[]				= {"O_T_LSV_02_armed_F","O_T_LSV_02_unarmed_F","O_T_Truck_03_ammo_ghex_F","O_T_LSV_02_unarmed_F"};
				vehiclesSpawnMarkersInOrder[]	= {"mav_convoy_spawn1","mav_convoy_spawn2","mav_convoy_spawn3","mav_convoy_spawn4"};
				vehiclesInheritDirection		= 1;
				mainVehicleAtIndex				= 2;
				maxSpeed						= 50;
				removeVehiclesAfterSeconds		= 600;
				additionalUnitsAmount			= 10;
			};

			class Route
			{
				// Route configuration
				markers[] 						= {"mav_convoy_waypoint1","mav_convoy_waypoint2","mav_convoy_waypoint3","mav_convoy_waypoint4","mav_convoy_waypoint5"};
			};

			class Loot
			{
				type 							= "real";
				container						= "B_CargoNet_01_ammo_F";
				data[] = {
												{"srifle_DMR_01_F", 1, "WEAPON"},
												{"optic_SOS", 1, "ITEM"},
												{"10Rnd_762x54_Mag", 1, "MAGAZINE"},
												{"B_Kitbag_mcamo", 1, "BACKPACK"}
				};
			};
		};
	};
};