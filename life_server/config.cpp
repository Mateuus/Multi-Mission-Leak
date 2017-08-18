class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\life_server\Functions\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
		};
	};
	
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\Functions\MySQL";
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
			class marketInsert {};
			class marketInsertTimes {};
		};
	};
	
	class Life_System
	{
		tag = "life";
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
			file = "\life_server\Functions\Jail";
			class jailSys {};
		};
		
		class Client_Code
		{
			file = "\life_server\Functions\Client";
		};
		
		class Tents
		{
			file = "\life_server\Functions\Tents";
			class initTents {};
			class getTents {};
			class killTent {};
		}
		
		//STOP THE STEALING!!!
		class SafeCode
		{
			file = "\life_server\Functions\SafeCode";
			//Admin menu
			class adminInfo {};
			class adminID {};
			class adminGetID {};
			class adminMenu {};
			class adminQuery {};
			class adminSpectate {};
			class adminTeleport {};
			class adminTpHere {};
			class adminDebugCon {};
			class adminCompensate {};
			class adminGodMode {};
			class adminFreeze {};
			class adminMarkers {};
			class adminHeal {};
			class adminFeed {};
			class adminRestrain {};
			class adminRestrainAction {};
			class adminUnrestrain {};
			class adminUnrestrainAction {};
			class adminSeizeWeapons {};
			class adminSeizeAction {};
			class adminGrantBH {};
			class adminTeleportTo {};
			class adminCompRequest {};
			class adminImpound {};
			class adminJailPre {};
			class adminArrest {};
			class adminJailDialog {};
			class adminJail {};
			class adminInvis {};
			class adminInvisHide {};
			class adminInvisReveal {};
			//Emp System
			class openEmpMenu {};
			class empVehicle {};
			class isEmpOperator {};
			class scanVehicles {};
			class vehicleEmpd {};
			class warnVehicle {};
			class vehicleWarned {};
			//Nightclub
			class ncFlash {};
			class ncLights {};
			class ncLightsOn {};
			class ncMusic {};
			class ncSmoke {};
			class ncTeargas {};
			//Police Dogs
			class dogFollow {};
			class dogGrowl {};
			class dogHeel {};
			class dogHide {};
			class dogInit {};
			class dogKilled {};
			class dogPlaySound {};
			class dogReturnIdle {};
			class dogRevive {};
			class dogSearchDrugs {};
			class dogSeek {};
			class dogShotAt {};
			class dogStop {};
			class dogVehicle {};
			class dogWhistle {};
			class searchDrugsClient {};
			//Custom Lighting System
			class copLights {};
			class medicLights {};
			//Medical
			class newLifeRule {};
			//Actions
			class compAction {};
			class copCrush {};
			class craftAction {};
			class destroyObject {};
			class placedObject {};
			class suicideBomb {};
			class surrender {};
			class takeOrgans {};
			class unzip {};
			class zipTieAction {};
			//Civilian
			class blindfold {};
			class blindfoldRemove {};
			class earPlugs {};
			class feedPlayer {};
			class freezePlayer {};
			class handleDowned {};
			class hasOrgan {};
			class waterChargeTimer {};
			//Config
			class craftCfg {};
			class itemIcon {};
			class seizeCfg {};
			//Cop
			class breakinMarker {};
			class breathalyzer {};
			class copHorn {};
			class copOpener {};
			class copSiren {};
			class copSiren2 {};
			class removeAllGear {};
			class removeBackpack {};
			class removeGear {};
			class removeGoggles {};
			class removeHeadgear {};
			class removeUniform {};
			class removeVest {};
			class revokeLicense {};
			class seizePlayerWeapon {};
			class seizePlayerWeaponAction {};
			class sirenLights {};
			//Functions
			class blindfolded {};
			class equipGear {};
			class fatigueReset {};
			class forceEject {};
			class insurance {};
			class lockCrate {};
			class restrictSlingLoad {};
			class setUniform {};
			class vehTurnSignal {};
			//Gangs
			class gangMarkers {};
			//Items
			class ammoBox {};
			class carAlarm {};
			class chainsawUse {};
			class crateMenu {};
			class demolitionCharge {};
			class drinkbeer {};
			class drinkmoonshine {};
			class drinkwhiskey {};
			class drugAffects {};
			class handleCrate {};
			class jointSmoke {};
			class pickupObject {};
			class placeObject {};
			class speedBomb {};
			class tent {};
			class underwaterCharge {};
			class vehAmmo {};
			class zipTie {};
			//Pmenu
			class craft {};
			class craft_update {};
			class craft_updateFilter {};
			class reportStolen {};
			class wantedPlus {};
			class wantedPlusAdd {};
			//Vehicle
			class gpsTracker {};
			//Initialize Code
			class initSafeCode {postInit=1;};
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
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
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};
			class goldUpdate {};
			class saveBounties {};
			class loadBounties {};
			class vehicleIsDead {};
			class vehicleInsurance {};
		};
		
		class Housing
		{
			file = "\life_server\Functions\Housing";
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
			file = "\life_server\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};
		
		class Smartphone
		{
			file = "\life_server\Functions\Smartphone";
			class handleMessages {};
			class msgRequest {};
			class cleanupMessages {};
		};
		
		class Market
		{
			file = "\life_server\Functions\Market";
			class marketconfiguration {};
		};
		
		class Paintball
		{
			file = "\life_server\Functions\Paintball";
			class paintball {};
			class game {};
		};
		
		class Airdrop
		{
			file = "\life_server\Functions\Airdrop";
			class generateAirdrop {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
};