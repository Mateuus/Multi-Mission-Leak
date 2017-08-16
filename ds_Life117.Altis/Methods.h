class DS_life_player
{
	tag = "DS";
	class DB
	{
		file = "DB";
		class compileData {};
		class playerLogin {};
		class enterPlayer {};
		class loadData {};
		class syncData {};
		class addToBase {};
	};
	
	class SETUP_Player
	{
		file = "player";
		class setupPlayerActions {};
		class setupPlayerEventHandlers {};
		class keyPressed {};
		class setupHud {};
		class setupSettings {};
		class updateHud {};
	};

	class CIVGEAR
	{
		file = "player\civilian\loadout";
		class civLoadGear {};
	};

	class GLOBAL
	{
		file = "player\global";
		class jail {};
		class locationRecord {};
		class removeCharges {};
		class removeLicenses {};
		class addCharge {};
		class masterActionKey {};
		class reportRDM {};
		class health {};
	};
	
	class GLOBAL_MENUS
	{
		file = "player\global\globalMenus";
		class updateHud {};
		class menuAtm {};
		class menuPlayer {};
		class menuShop {};
		class menuBoot {};
		class menuPhone {};
		class menuSpawnScreen {};
		class menuInteractionVehicle {};
		class menuKeys {};
		class menuInteraction {};
		class menuHouseInteraction {};
	};
	
	class GLOBAL_QUEST
	{
		file = "player\global\darkside_Quest";
		class questCompleted {};
		class returnQuestArray {};
		class returnInfo {};
		class openQuestLog {};
		class questLBChange {};
		class questReward {};
		class copQuest {};
	};
	
	class GLOBAL_BANK
	{
		file = "player\global\bank";
		class deposit {};
		class withdraw {};
		class transfer {};
		class bankReceive {};
		class insurance {};
	};

	class GLOBAL_PLAYERMENU
	{
		file = "player\global\playerMenu";
		class giveMoney {};
		class getMoney {};
		class itemRemove {};
		class giveItem {};
		class getItem {};
		class returnItem {};
		class useItem {};
		class marketPrices {};
		class viewDistance {};
		class hotKeys {};
	};
	
	class GLOBAL_SHOPS
	{
		file = "player\global\shops";
		class shopLBChange {};
		class setupCarshops {};
		class carShopLBChange {};
		class buyVehicle {};
		class getPrice {};
		class buyVirtItem {};
		class setupVirtShops {};
		class sellVirtItem {};
		class setupWeaponshops {};
		class buyWeapon {};
		class equipItem {};
		class attachType {};
		class setUpLicenseShops {};
		class buyLicense {};
		class setupClothingShops {};
		class setupQuickbuyShops {};
		class buyKit {};
		class setupGarage {};
		class setupRealEstate {};
		class buyRealEstate {};
		class setupUpgrades {};
		class setupMCU {};
		class chopShop {};
		class chopVehicle {};
		class setupBusstops {};
		class sellRealEstate {};
		class setupRepaint {};
		class setupBuilding {};
		class buyBuilding {};
		class setupInsurance {};
		class buyInsurance {};
		class setupClothingRetexture {};
		class retextureClothing {};
		class setupVehicleRetexture {};
		class retextureVehicle {};
		class useRebelTokens {};
		class setupRebelTokenShop {};
	};

	class GLOBAL_SHOPS_CONFIG
	{
		file = "player\global\shops\shopConfig";
		class vehShopConfig {};
		class shopInfoConfig {};
		class virtShopConfig {};
		class itemStringConfig {};
		class itemTooltipConfig {};
		class weaponShopConfig {};
		class clothingShopConfig {};
		class licenseShopConfig {};
		class specialShopConfig {};
		class realestateConfig {};
		class buildingShopConfig {};
		class insuranceShopConfig {};
	};

	class GLOBAL_VEHICLE
	{
		file = "player\global\vehicle";
		class unlock {};
		class vehicleTextures {};
		class globalTexture {};
		class vehItemStore {};
		class getVehWeight {};
		class vehItemTake {};
		class vehRepair {};
		class vehRefuel {};
		class vehPullout {};
		class vehPulloutPlayer {};
		class vehDoors {};
		class vehLockpick {};
		class vehBurn {};
		class siphonKit {};
		class clearVehAmmo {};
		class keyGive {};
		class receiveKey {};
		class setupVeh {};
		class vehReskin {};
		class retrieveVehicle {};
		class storeVehicle {};
		class stationRefuel {};
		class siren {};
		class lights {};
		class globalLights {};
		class useFuel {};
		class impoundFee {};
		class sellVehicle {};
		class vehUpgrades {};
		class installNos {};
		class vehSpiked {};
		class vehGPS {};
		class vehGlobalLock {};
		class installUpgrades {};
		class autoMiner {};
		class vehRepaint {};
		class vehRearm {};
		class vehLoad {};
		class vehUnload {};
		class vehCrash {};
		class shopVehUpgrades {};
	};

	class GLOBAL_MESSAGES
	{
		file = "player\global\messages";
		class killMessages {};
		class killInfo {};
		class punishKiller {};
		class timerDisplays {};
		class alarms {};
		class martialLawAlarm {};
		class globalTextureClothes {};
		class motd {};
		class impoundRequested {};
	};

	class GLOBAL_PHONE
	{
		file = "player\global\phone";
		class messagePlayer {};
		class messagePolice {};
		class messageMedic {};
		class messageMechanic {};
		class messageSecurity {};
		class messageAdminPlayer {};
		class messageAdminAll {};
		class messageAdmins {};
		class blockNumber {};
		class reportRDMAdmin {};
		class messageLog {};
		class quickPhone {};
		class showNews {};
		class policePullover {};
	};
	
	class GLOBAL_SPAWN
	{
		file = "player\global\spawn";
		class moveSpawnMap {};
		class spawnLBChanged {};
		class spawnPlayer {};
		class houseMarkers {};
		class getSpawnPoints {};
	};

	class GLOBAL_DONOR
	{
		file = "player\global\donor";
		class animation {};
		class retextureDonor {};
		class playSoundDonor {};
	};

	class GLOBAL_ACTIONS
	{
		file = "player\global\actions";
		class jump {};
		class handsUp {};
		class payBail {};
		class jailWork {};
		class treatSickness {};
		class alerts {};
		class revive {};
		class revivedRebel {};
		class tazed {};
		class stunned {};
		class moneyAction {};
		class pickupMoney {};
		class quickDisplay {};
		class NLR {};
		class pickupItem {};
		class restrained {};
		class loadDeadGear {};
		class getDeadGear {};
		class smack {};
		class koed {};
		class robbed {};
		class activateNitro {};
		class recordAdd {};
		class skyDiving {};
		class flash {};
		class fuelDartPlayer {};
		class openJailDoor {};
		class showPlayerStats {};
		class alcohol {};
		class tearGas {};
		class catchBus {};
		class sicknessHealed {};
		class spyClient {};
		class bankRobbed {};
		class paraChute {};
		class healFire {};
		class giveWeapon {};
		class defuseIED {};
		class placeBuildingBox {};
		class packBuilding {};
		class earPlugs {};
		class areaDamage {};
	};

	class GLOBAL_ITEMS
	{
		file = "player\global\items";
		class medikit {};
		class drink {};
		class eat {};
		class openPack {};
		class openItemPack {};
	};
	
	class GLOBAL_ADMIN
	{
		file = "player\global\admin";
		class adminCompensate {};
		class adminDebugCon {};
		class adminFreeze {};
		class adminGodMode {};
		class adminKill {};
		class adminKillPlayer {};
		class adminMarkers {};
		class adminMenu {};
		class adminQuery {};
		class adminRestart {};
		class adminSpectate {};
		class adminSync {};
		class adminTeleport {};
		class adminTpHere {};
		class compRecieve {};
		class Darkside_ShowAll {};
		class Darkside_ShowAllAdmins {};
		class haxorKeys {};
		class haxorKeysDisable {};
		class increaseWeight {};
		class massSync {};
		class quickKick {};
		class quickKickPlayer {};
		class tempBan {};
		class tempBanPlayer {};
		class player_query {};
		class queryReturn {};
		class moneyPickup {};
		class warnAdmins {};
		class cheater {};
		class DarkSide_Warnings {};
		class reportBug {};
		class testing {};
		class toJail {};
		class toJailPlayer {};
		class unlockBugged {};
		class unlockBuggedPlayer {};
	};

	class GLOBAL_FINANCE
	{
		file = "player\global\finance";
		class payments {};
		class moneyInfo {};
	};
	
	class FUNCTIONS
	{
		file = "functions";
		class handleMoney {};
		class handleMoral {};
		class numberText {};
		class globalMessage {};
		class handleInventory {};
		class isNumber {};
		class checkMoney {};
		class itemWeight {};
		class nearbyPlayers {};
		class itemIndex {};
		class checkLicense {};
		class moralAlter {};
		class deathCam {};
		class serverIntro {};
		class playSounds {};
		class animSync {};
		class packItem {};
		class setUpItem {};
		class pushBoat {};
		class countPlayers {};
		class playSound {};
		class removeDead {};
		class alterPrices {};
		class displayTags {};
		class requestTag {};
		class returnTag {};
		class getTag {};
		class copUniform {};
		class removeWeapon {};
		class onEscape {};
		class alterStats {};
		class MPexec {};
		class MP {};
		class clientCleanup {};
		class localBodyCleanup {};
		class stamina {};
		class impoundPrice {};
		class checkBaseClosed {};
		class globalRepairs {};
		class getCopScore {};
	};
	
	class VARIABLES
	{
		file = "variables";
		class inventoryItems {};
		class shopItems {};
		class setupLicenses {};
	};

	class EVENTS
	{
		file = "player\events";
		class playerKilled {};
		class playerRespawn {};
		class respawnMe {};
		class handleDamage {};
		class onFired {};
		class inventoryOpened {};
	};
	
	class GLOBAL_POLICEENCOUNTERS
	{
		file = "player\global\policeInteractions";
		class addCharge {};
		class checkLicenses {};
		class searchCiv {};
		class ticketPrompt {};
		class checkChargesPlayer {};
		class returnPlayerCharges {};
		class licenseRevoke {};
	};

	class POLICE_ACTIONS
	{
		file = "player\police\actions";
		class repairBank {};
		class repairSafe {};
		class reclaimCP {};
		class repairPower {};
		class wantedLBChange {};
		class setupWantedMenu {};
		class setupTaskActions {};
		class closeBase {};
	};

	class POLICE_REWARDS
	{
		file = "player\police\rewards";
		class bailPaid {};
		class bonus {};
		class punishments {};
		class copRewards {};
		class getBounty {};
	};
	
	class CIVILIAN_ACTIONS
	{
		file = "player\civilian\actions";
		class crackSafe {};
		class takeMoney {};
		class takeMoneyBags {};
		class giveBattery {};
		class captureCP {};
		class captureRebelKos {};
		class rewardRebels {};
		class civPunishments {};
		class ziptied {};
		class lottoDraw {};
		class lottoBuy {};
		class captureRebelKosAlert {};
		class hostageAreaVictim {};
	};
	
	class CIVILIAN_AUCTION
	{
		file = "player\civilian\auctions";
		class receiveInformation {};
	};

	class CIVILIAN_GANGS
	{
		file = "player\civilian\gangs";
		class upgradeBase {};
		class baseSickness {};
		class baseRearm {};
		class kosAlert {};
		class repairBase {};

		class messageGang {};

	};

	class MEDIC
	{
		file = "player\whitelistcivilian\medic";
		class revivedMedic {};
		class medicLights {};
		class ticketPromptMedic {};
		class requestMedic {};
		class ticketPaidMedic {};
	};

	class MECHANIC
	{
		file = "player\whitelistcivilian\mechanic";
		class mechLights {};
		class mechVehLoad {};
		class mechVehUnload {};
		class mechRepairBuildings {};
	};

	class SECURITY
	{
		file = "player\whitelistcivilian\security";
		class paySecurity {};
		class closedShopCheck {};
		class openCloseShop {};
		class removeMoneyGas {};
		class removeMoneyHospital {};
		class openCloseBank {};
		class removeGoldBank {};
		class bountyDropCheck {};
		class bountyDropPay {};
		class bountyInformPolice {};
	};
};