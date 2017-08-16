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
		SleepTime								= 18001;
		MakePlayersHostileFor					= 360;
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
												"H_Cap_police", // Headgear
												"G_Aviator", // Glasses
												"U_Rangemaster", // Uniform
												"V_TacVest_blk_POLICE", // Vest
												"", // Backpack
												{"arifle_MX_khk_F", "30Rnd_65x39_caseless_mag", 5}, // Primary weapon, ammo and how many magazines
												{"hgun_P07_khk_F", "16Rnd_9x21_Mag", 1}, // Secondary weapon, ammo and how many magazines
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
				vehiclesInOrder[]				= {"B_MRAP_01_hmg_F","B_Truck_01_covered_F","B_MRAP_01_F"};
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
				markers[] 						= {"mav_convoy_waypoint1","mav_convoy_waypoint2","mav_convoy_waypoint3","mav_convoy_waypoint4","mav_convoy_waypoint5","mav_convoy_waypoint6","mav_convoy_waypoint7","mav_convoy_waypoint8","mav_convoy_waypoint9","mav_convoy_waypoint10","mav_convoy_waypoint11","mav_convoy_waypoint12"};
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
												"H_Cap_police", // Headgear
												"G_Aviator", // Glasses
												"U_Rangemaster", // Uniform
												"V_TacVest_blk_POLICE", // Vest
												"", // Backpack
												{"arifle_MX_khk_F", "30Rnd_65x39_caseless_mag", 5}, // Primary weapon, ammo and how many magazines
												{"hgun_P07_khk_F", "16Rnd_9x21_Mag", 1}, // Secondary weapon, ammo and how many magazines
				};
			};

			class Messages
			{
				// Enable messages?
				enabled							= 1;

				// Mission started announcement
				startAnnouncementHeader			= "Weapon Transport";
				startAnnouncementDescription	= "The local Police are currently transporting large amounts of weapons through Tanoa with ground vehicles.";

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
				vehiclesInOrder[]				= {"B_MRAP_01_hmg_F","B_Truck_01_covered_F","B_MRAP_01_F","B_MRAP_01_F"};
				vehiclesSpawnMarkersInOrder[]	= {"mav_convoy_spawng1","mav_convoy_spawng2","mav_convoy_spawng3","mav_convoy_spawng4"};
				vehiclesInheritDirection		= 1;
				mainVehicleAtIndex				= 2;
				maxSpeed						= 50;
				removeVehiclesAfterSeconds		= 600;
				additionalUnitsAmount			= 10;
			};

			class Route
			{
				// Route configuration
				markers[] 						= {"mav_convoy_waypointg1","mav_convoy_waypointg2","mav_convoy_waypointg3","mav_convoy_waypointg4","mav_convoy_waypointg5","mav_convoy_waypointg6","mav_convoy_waypointg7","mav_convoy_waypointg8","mav_convoy_waypointg9","mav_convoy_waypointg10","mav_convoy_waypointg11","mav_convoy_waypointg12"};
			};

			class Loot
			{
				type 							= "real";
				container						= "B_supplyCrate_F";
				data[] = {
												{"srifle_DMR_01_F", 1, "WEAPON"},
												{"optic_Hamr", 1, "ITEM"},
												{"10Rnd_762x54_Mag", 1, "MAGAZINE"},
												{"B_Kitbag_mcamo", 1, "BACKPACK"}
				};
			};
		};
	};
};