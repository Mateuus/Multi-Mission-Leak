class Life_Settings {
	/* Persistent Settings */
	save_civ_weapons = 1; //Allow civilians to save weapons on them?
	save_virtualItems = 1; //Save Virtual items (all sides)?

	/* Revive system settings */
	revive_cops = 1; //true to enable cops the ability to revive everyone or false for only medics/ems.
	revive_fee = 500; //Revive fee that players have to pay and medics / EMS are rewarded

	/* House related settings */
	house_limit = 5; //Maximum amount of houses a player can own.

	/* Gang related settings */
	gang_price = 7500; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
	gang_upgradeBase = 1000; //The base cost for upgrading slots in a gang
	gang_upgradeMultiplier = 2.5; //Not sure if in use?

	/* Player-related systems */
	enable_fatigue = 1; //Set to false to disable the ARMA 3 false system.
	total_maxWeight = 104; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
	total_maxWeightT = 0;  //Static variable for the maximum weight allowed without having a backpack
	paycheck_period = 5; //Scaled in minutes

	/* Impound Variables */
	impound_car = 50; //Price for impounding cars
	impound_boat = 50; //Price for impounding boats
	impound_air = 90; //Price for impounding helicopters / planes
	impound_tank = 90;
	impound_truck = 90;

	/* Job-related stuff */
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };
	/*Truck Mission Points*/
	truck_missions[] = { "LIFOU", "PIER", "OUMERE", "AIRSTRIP", "GEORGETOWN", "MODDERGAT" };

	sellArray[] = {
		{"30Rnd_9x21_Mag", 0}
	};

};

class CfgIdentification {
  religion[] = {"Athiesm","Buddhism","Christianity","Confucianism","Deism","Hinduism","Jehovah's Witnesses","Judaism","Satanism","Taoism","Voodoo","No Religion"};
  eyes[] = {"Amber","Blue","Brown","Green","Grey","Hazel","Light Blue","Light Brown"};
  residence[] = {"Georgetown","Harcourt","Balavu","Belfort","Blerick","Bua Bua","Buawa","Cerebu","Boodstil","Galli","Lifou","Lijnhaven","Lobaka","Luganville","Moddergat","Momea","Muaceba","Namuvaka","Nandai","Nani","Nasua","Nicolet","Oua-Oué","Ouméré","Ovau","Pénélo","Petit Nicolet","Port-Boisé","Rautake","Regina","Rereki","Saint-Julien","Saint-Paul","Saioko","Savaka","Savu","Sosovu","Taga","Tanouka","Tavu","Tobakoro","Tuvanaka","Vagalala","Vatukoulo","Yanukka","Ba","Imone","Ipota","Katkoula","Kotomo","Koumac","Lösi","La Foa","La Rochelle","Laikoro","Lailai","Lakatoro","Lami","Leqa","Corazol","Gaula","Modesta","Obregan","Mercalillo","Bagango","Benoma","Everon","Ortego","Geraldo","Dolores","Iguana","Tiberia","Cayo","Arcadia","Estrella","Chantico","Rashidah","Paraiso","Gulan","Tialoc","Pacamao","Hunapu","Rahmadi"};
  gender[] = {"Male","Female"};
  fakeid[] = {"Mohamed Malo","Lowell Baynes","Benny Poteete","Chi Cotten","Heath Simmers","Ike Jagger","Jose Fielden","Malik Dahlke","Lupe Devaul","Russell Herrin","Orval Verner","Douglass Etheridge","Refugio Hertz","Kim Delaune","Cory Roehl","Virgil Glennon","Harris Greiner","Matt Rhines","Rosario Schulze","Louie Carmack","Dante Sewell","Houston Kua","Marty Mosier","Clarence Beamon","Doug Bernabe","Toby Curington","Rene Look","Clement Huppert","Todd Zynda","Nathanael Keeler","Dwayne Botsford","Brandon Bartels","Ash Wachowiak","Damien Kiker","Rueben Purdy","Raymon Elias","Brendon Warrior","Jay Looney","Landon Opp","Johnie Mcgray","Prince Zamarripa","Perry Rolland","Reed Lamons","Roy Burkhalter","Sammie Schexnayder","Mathew Maltby","Michel Maness","Lawrence Ells","Napoleon Holdridge","Felton Adolph"};
};

#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgSpawnpoints.hpp"
#include "CfgVirtualItems.hpp"
#include "CfgVehicles.hpp"
#include "CfgAnimations.hpp"
#include "CfgVehShops.hpp"
#include "CfgWeapons.hpp"
#include "CfgNotifications.hpp"
#include "CfgPaychecks.hpp"
#include "CfgSkills.hpp"
#include "CfgLicenses.hpp"
#include "CfgCustomization.hpp"
#include "CfgProcess.hpp"
#include "CfgLockers.hpp"
#include "CfgGather.hpp"
#include "CfgGangs.hpp"
#include "CfgVirtualShops.hpp"
#include "CfgWanted.hpp"