#include "BIS_AddonInfo.hpp"
class DefaultEventhandlers;
class CfgPatches
{
	class EMonkeys_headless_client
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F"};
		fileName = "EMonkeys_hc.pbo";
		author[]= {"Tonic"}; 
	};
};

class CfgFunctions
{
	class EMonkeys_Headless_Client
	{
		tag = "HC1";
		class Headless_Startup
		{
			file = "EMonkeys_hc";
			class initHC {preInit = 1;};
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\EMonkeys_hc\Functions\Systems";
			class Log {};
			class getVehicles {};
			class getID {};
			class dbpaintball {};
			class loadBounties {};
			class saveBounties {};
			class vehicleCreate {};
			class vehicleStore {};
			class keyManagement {};
			class spikeStrip {};
			class chopShopSell {};
			class vehicleDead {};
			class vehicleDelete {};	
			class buyVehicle {};
			class parkoutVehicle {};
		};
		
		class Blackboard
		{
			file = "\EMonkeys_hc\Functions\EMonkeys\blackboard";
			class setNews {};
			class loadBlackboardNews {};
		};
		
		class Paintball
		{
			file = "\EMonkeys_hc\Functions\eMonkeys\paintball";
			class paintball {};
			class game {};
		};
		
		class lotto
		{
			file = "\EMonkeys_hc\Functions\eMonkeys\lotto";
			class lotto{};
			class lottoadd {};
		};	

		class Fuelstation
		{
			file = "\EMonkeys_hc\Functions\eMonkeys\fuelstation";
			class auction_selectFuelstations {};
			class auction_selectDate {};
			class addFuelstationBid {};
			class openFuelMenu {};
			class initFuelstation {};
			class fetchPlayerFuelstation {};
			class getFuelstationRob {};
			class getFuelstationData {};
			class getFuelstationInfo {};
			
			class updateFuelstation {};
			class robFuelstationGlobalReset {};
			class addFuelstation {};
		};
	};
	
	class EMonkeys_System
	{
		tag = "EMonkeys";	
		class Jail_Sys
		{
			file = "\EMonkeys_hc\Functions\Jail";
			class jailSys {};
			class jailTimer {};
			class jailPlayer {};
		};
		
		class Economy
		{
			file = "\EMonkeys_hc\Functions\eMonkeys\markt";
			class updateEconomy {};
			class queryBoerse {};
		};
		
		class ausweis_server
		{
			file = "\EMonkeys_hc\Functions\eMonkeys\ausweis";
			class ausweisload {};
			class ausweissave{};
			class ausweisdel {};
		};
		
		class Wanted_Sys
		{
			file = "\EMonkeys_hc\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};
		
		class Airdrop
		{
			file = "\EMonkeys_hc\Functions\eMonkeys\airdrop";
			class generateAirdrop {};
		};
		
		class auktion
		{
			file = "\EMonkeys_hc\Functions\eMonkeys\auktion";
			class Playerconnect {};
			class Playerdisconnect {};
		};
	};
	
	
	class house_inventory
	{
		tag = "house_inventory";
		class inventory
		{
			file = "\EMonkeys_hc\Functions\eMonkeys\houseInventory";
			class get_db_gear {};
			class update_db_gear{};
		};
	};
	
	class HOUSE_System
	{
		tag = "HOUSE";
		class House
		{
			file = "\EMonkeys_hc\Functions\eMonkeys\house";
			class writeData {};
			class requestCommand {};
			class requestSpawnMenu {};
			class writeDataToNearest {};
			
			//addon methods
			class DBbuyHouse {};
			class DBsellHouse {};
			class DBgiveKey {};
			class DBresetKeys {};
			class DBapplyInventory {};
			class DBuseFurniture {};
			class DBimpound {};
		};
	};
	
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\EMonkeys_hc\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class asyncCall{};
			class mresToArray {};
			class bool {};
			class mresString {};
			class updatePartial {};
			class updateRequest {};
			class insertVehicle {};
			class insertRequest {};
			class queryRequest {};
		};
	};
};