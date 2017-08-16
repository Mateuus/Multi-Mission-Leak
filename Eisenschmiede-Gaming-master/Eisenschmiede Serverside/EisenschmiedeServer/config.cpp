class DefaultEventhandlers;
class CfgPatches {
	class Eisenschmiede {
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F","3DEN"};
		fileName = "EisenschmiedeServer.pbo";
		author[]= {"Eisenschmiede"}; 
	};
};

class ES_Server_Settings {
	class EXTDB {
		DatabaseName = "EisenschmiedeAltisLife";
	};
};

class CfgFunctions {

	class StefanDerBoss
	{
		tag = "Eisenschmiede";
		class EisenschmiedeStart
		{
			file = "\EisenschmiedeServer\Eisenschmiede";
			class EisenschmiedeInit { preInit = 1; };
			class ServerSetting { preInit = 1; };
			class mapSpawn {};
			class EisenschmiedeASM { ext=".fsm"; preInit=1; };
			class Maverick { preInit = 1; };
		};
	};

	/*  <--  WEGEN TESTEN!

	class BIS_Overwrite {
		tag = "BIS";
		class MP
		{
		class MySQL
		{
			file = "\EisenschmiedeServer\Tonic\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class mresToArray {};
			class insertVehicle {};
			class bool{};
			class mresString {};
			class updatePartial {};
		};
		};
	};

	*/

	class ES_System {
		tag = "ES";
		class Systems 
		{
			file = "\EisenschmiedeServer\Tonic\Functions\Systems";
			class managesc {};
			class cleanup {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class logIt {};
			class logXP {};
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};
			class robShops {};
			class shopState {};
		};

		class MySQL
		{
			file = "\EisenschmiedeServer\Tonic\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class mresToArray {};
			class insertVehicle {};
			class bool{};
			class mresString {};
			class updatePartial {};
		};

		class Wanted_Sys 
		{
			file = "\EisenschmiedeServer\Tonic\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};
		
		class Housing 
		{
			file = "\EisenschmiedeServer\Tonic\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class initHouses {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
		};
		
		class Gangs 
		{
			file = "\EisenschmiedeServer\Tonic\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};
		
		class Paintball
		 {
			 file = "\EisenschmiedeServer\Tonic\Functions\paintball";
			 class paintball {};
			 class game {};
		 };
		
		class Actions 
		{
			file = "\EisenschmiedeServer\Tonic\Functions\Actions";
			class pickupAction {};
		};

		class Jail_Sys 
		{
			file = "\EisenschmiedeServer\Tonic\Functions\Jail";
			class jailSys {};
		};
		
		class Client_Code 
		{
			file = "\EisenschmiedeServer\Tonic\Functions\Client";
		};

		class DynMarket
        {
            file = "\EisenschmiedeServer\Tonic\Functions\DynMarket";
            class calculatePrices {};
            class config {};
            class getUpdate {};
            class HandleDB {};
            class playerLogged {};
            class changePrice {};
		};
	};
};

class CfgVehicles {
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian {
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F {
		class EventHandlers: EventHandlers {
			init = "(_this select 0) execVM ""\EisenschmiedeServer\Tonic\fix_headgear.sqf""";
		};
	};
};