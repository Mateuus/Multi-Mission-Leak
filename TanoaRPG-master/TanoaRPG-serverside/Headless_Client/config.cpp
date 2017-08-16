class DefaultEventhandlers;
class CfgPatches 
{
	class Headless_Client
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "Headless_Client.pbo";
		author[]= {"CooliMC"}; 
	};
};

class CfgFunctions
{
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\Headless_Client\Functions\MySQL";
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
			class repaintVehicle {};
		};
	};
	
	class Life_System
	{
		tag = "tanoarpg";
		class Wanted_Sys
		{
			file = "\life_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};
		
		class Jail_Sys
		{
			file = "\Headless_Client\Functions\Jail";
			class jailSys {};
		};
	};
	
	class TON_System
	{
		tag = "TEX";
		class Systems
		{
			file = "\Headless_Client\Functions\Systems";
			class cleanUpComplete {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class logIt {};
			class chopShopSell {};
			class cleanupRequest {};
			class vehicleRepaint {};
			class keyManagement {};
			class handleDBLog {};
		};
		
		class Smartphone
		{
			file = "\Headless_Client\Functions\Smartphone";
			class handleMessages {};
			class msgRequest {};
			class cleanupMessages {};
		};	
		
		class Housing
		{
			file = "\Headless_Client\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class sellHouse {};
			class initHouses {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
		};
		
		class Gangs
		{
			file = "\Headless_Client\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};
	};
};