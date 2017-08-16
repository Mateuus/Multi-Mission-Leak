class DS_life_player
{
	tag = "DS";

	class DB
	{
		file = "DB";
		class addToBase {};
		class compileData {};
		class enterPlayer {};
		class loadData {};
		class playerLogin;
		class syncData {};
	};

	class FUNCTIONS
	{
		file = "functions";
		class airVehicleEH {};
		class alterPrices {};
		class alterStats {};
		class animSync {};
		class checkBaseClosed {};
		class checkLicense {};
		class checkMoney {};
		class checkVehForAI {};
		class clientCleanup {};
		class copUniform {};
		class countPlayers {};
		class deathCam {};
		class deleteBuildItem {};
		class deleteGroup {};
		class disableIntro {};
		class disableUserInput {};
		class fixStuff {};
		class getBaseList {};
		class getBaseTexture {};
		class getConfigDLC {};
		class getCopScore {};
		class getNearestBase {};
		class getNearestHideout {};
		class getPartDamage {};
		class getPlayerBase {};
		class getPlayerBaseList {};
		class getWeightDiff;
		class globalMessage {};
		class globalRepairs {};
		class handleInventory {};
		class handleMoney {};
		class handleMoral {};
		class impoundPrice {};
		class isNumber {}
		class itemIndex {};
		class itemWeight {};
		class joinGroup {};
		class localBodyCleanup {};
		class moralAlter {};
		class nameError {};
		class nearbyPlayers {};
		class numberText {};
		class onEscape {};
		class packItem {};
		class playSound {};
		class playSounds {};
		class playSoundServer {};
		class policeConvoyEH {};
		class policeDiscount {};
		class pushBoat {};
		class realMode {};
		class removeDead {};
		class removeGear {};
		class removeWeapon {};
		class requestTag {};
		class serverIntro {};
		class setFuel {};
		class setUpItem {};
		class sortUnits {};
		class stamina {};
		class vehUnflip {};
	};

	class VARIABLES
	{
		file = "variables";
		class inventoryItems {};
		class setupLicenses {};
	};

	class RULES
	{
		file = "rules";
		class rulesMenu {};
		class rulesInfoReturn {};
		class rulesUpdateSubcat {};
		class rulesUpdateRule {};
		class rulesDisplayRule {};
		class rulesConfig {};
	};

	class SETUP_Player
	{
		file = "player";
		class keyPressed {};
		class setupHud {};
		class setupPlayerActions {};
		class setupPlayerEventHandlers {};
		class updateHud {};
	};

	class EVENTS
	{
		file = "player\events";
		class getIn {};
		class handleDamage {};
		class handleHeal {};
		class inventoryOpened {};
		class onFired {};
		class playerKilled {};
		class playerRespawn {};
		class respawnMe {};
		class seatSwitched {};
	};

	class GLOBAL
	{
		file = "player\global";
		class addCharge {};
		class health {};
		class jail {};
		class locationRecord {};
		class masterActionKey {};
		class removeCharges {};
		class removeLicenses {};
		class reportRDM {};
	};

	class GLOBAL_ACTIONS
	{
		file = "player\global\actions";
		class activateNitro {};
		class alcohol {};
		class alerts {};
		class areaDamage {};
		class bankRobbed {};
		class briefcaseItemTake {};
		class briefcaseItemTakeAll {};
		class catchBus {};
		class defuseIED {};
		class earPlugs {};
		class flash {};
		class fuelDartPlayer {};
		class getDeadGear {};
		class giveWeapon {};
		class handsUp {};
		class healFire {};
		class jailWork {};
		class jump {};
		class koed {};
		class loadDeadGear {};
		class moneyAction {};
		class NLR {};
		class openJailDoor {};
		class packBuilding {};
		class paraChute {};
		class payBail {};
		class payToll {};
		class pickupMoney {};
		class placeBuildingBox {};
		class putInVeh {};
		class quickDisplay {};
		class recordAdd {};
		class restrained {};
		class revive {};
		class revivedRebel {};
		class robbed {};
		class showPlayerStats {};
		class sicknessHealed {};
		class skyDiving {};
		class smack {};
		class spyClient {};
		class tazed {};
		class tearGas {};
		class treatSickness {};
		class xmasGift {};
	};

	class GLOBAL_ADMIN
	{
		file = "player\global\admin";
		class adminAddNote {};
		class adminCompensate {};
		class adminDebugConsole {};
		class adminFreeze {};
		class adminGodMode {};
		class adminIncreaseWeight {};
		class adminIncreaseWeightAll {};
		class adminJail {};
		class adminJailRelease {};
		class adminJailSend {};
		class adminKill {};
		class adminKillPlayer {};
		class adminMarkers {};
		class adminMassSync {};
		class adminMenu {};
		class adminMenuFunctions {};
		class adminMenuOpen {};
		class adminQuery {};
		class adminQuickKick {};
		class adminQuickKickPlayer {};
		class adminRemoveNLR {};
		class adminRequestJoinTS {};
		class adminSpectate {};
		class adminSpectateEG {};
		class adminSyncData {};
		class adminTeleport {};
		class adminTeleportHere {};
		class adminTempBan {};
		class adminTempBanPlayer {};
		class adminUnlockKeys {};
		class adminUnlockKeysPlayer {};
		class cheater {};
		class compRecieve {};
		class DarkSide_ShowAll {};
		class DarkSide_ShowAllAdmins {};
		class DarkSide_Warnings {};
		class increaseWeight {};
		class moneyPickup {};
		class playerQuery {};
		class queryReturn {};
		class reportBug {};
		class tempBanList {};
		class testing {};
		class toJailPlayer {};
		class warnAdmins {};
		class adminBaiters {};
	};

	class GLOBAL_ADMIN_COMPMENU
	{
		file = "player\global\admin\compMenu";
		class cmGear {};
		class cmGearFunctions {};
		class cmItems {};
		class cmItemsFunctions {};
		class cmMain {};
		class cmMoney {};
		class cmMoneyFunctions {};
		class cmVehicles {};
		class cmVehiclesFunctions {};
	};

	class GLOBAL_ADMIN_TOOLS
	{
		file = "player\global\admin\tools";
		class cleanUpVeh {};
		class repairBuildings {};
		class sidechatWarning {};
	};

	class GLOBAL_BANK
	{
		file = "player\global\bank";
		class bankReceive {};
		class deposit {};
		class insurance {};
		class transfer {};
		class withdraw {};
	};

	class GLOBAL_QUEST
	{
		file = "player\global\darkside_Quest";
		class copQuest {};
		class openQuestLog {};
		class questCompleted {};
		class questLBChange {};
		class questPrestige {};
		class questReward {};
		class returnInfo {};
		class returnQuestArray {};
	};

	class GLOBAL_DONOR
	{
		file = "player\global\donor";
		class animation {};
		class retextureDonor {};
		class playSoundDonor {};
		class changeBodyDonor {};
	};

	class GLOBAL_FINANCE
	{
		file = "player\global\finance";
		class moneyInfo {};
		class payments {};
	};

	class GLOBAL_MENUS
	{
		file = "player\global\globalMenus";
		class menuAtm {};
		class menuBoot {};
		class menuBriefcase {};
		class menuDonor {};
		class menuHouseInteraction {};
		class menuInteraction {};
		class menuInteractionVehicle {};
		class menuKeys {};
		class menuPhone {};
		class menuPlayer {};
		class menuShop {};
		class menuSpawnScreen {};
	};

	class GLOBAL_HELP
	{
		file = "player\global\help";
		class helpLBChange {};
		class openHelp {};
	};

	class GLOBAL_ITEMS
	{
		file = "player\global\items";
		class drink {};
		class eat {};
		class medikit {};
		class openItemPack {};
		class openPack {};
	};

	class GLOBAL_LOADOUT
	{
		file = "player\global\loadout";
		class loadGear {};
		class saveGear {};
		class randomizeBody {};
	};

	class GLOBAL_MESSAGES
	{
		file = "player\global\messages";
		class alarms {};
		class globalTextureClothes {};
		class impoundRequested {};
		class killInfo {};
		class killMessages {};
		class martialLawAlarm {};
		class motd {};
		class punishKiller {};
		class restartWarning {};
		class timerDisplays {};
	};

	class GLOBAL_PHONE
	{
		file = "player\global\phone";
		class blockNumber {};
		class messageAdminAll {};
		class messageAdminPlayer {};
		class messageAdmins {};
		class messageLog {};
		class messageMechanic {};
		class messageMedic {};
		class messagePlayer {};
		class messagePolice {};
		class messageSecurity {};
		class policePullover {};
		class quickPhone {};
		class reportRDMAdmin {};
		class showNews {};
	};

	class GLOBAL_PLAYERMENU
	{
		file = "player\global\playerMenu";
		class getItem {};
		class getMoney {};
		class giveItem {};
		class giveMoney {};
		class hotKeys {};
		class itemRemove {};
		class marketPrices {};
		class returnItem {};
		class useItem {};
		class viewDistance {};
	};

	class GLOBAL_POLICEENCOUNTERS
	{
		file = "player\global\policeInteractions";
		class checkChargesPlayer {};
		class checkLicenses {};
		class licenseRevoke {};
		class returnPlayerCharges {};
		class searchCiv {};
		class ticketPrompt {};
		class blindfolded {};
	};

	class GLOBAL_SHOPS
	{
		file = "player\global\shops";
		class attachType {};
		class buyBuilding {};
		class buyInsurance {};
		class buyKit {};
		class buyLicense {};
		class buyRealEstate {};
		class buyVehicle {};
		class buyVirtItem {};
		class buyWeapon {};
		class carShopLBChange {};
		class chopShop {};
		class chopVehicle {};
		class equipItem	{};
		class getPrice {};
		class retextureClothing	{};
		class retextureVehicle {};
		class sellRealEstate {};
		class sellVirtItem {};
		class setupBuilding {};
		class setupBusStops {};
		class setupCarShops {};
		class setupClothingRetexture {};
		class setupClothingShops {};
		class setupGarage {};
		class setupGarageHouse {};
		class setupImpoundLot {};
		class setupInsurance {};
		class setUpLicenseShops {};
		class setupMCU {};
		class setupMCUWater	{};
		class setupQuickBuyShops {};
		class setupRealEstate {};
		class setupRebelTokenShop {};
		class setupRepaint {};
		class setupUpgrades {};
		class setupVehicleRetexture {};
		class setupVirtShops {};
		class setupWeaponShops {};
		class shopLBChange {};
		class useRebelTokens {};
	};

	class GLOBAL_SHOPS_CONFIG
	{
		file = "player\global\shops\shopConfig";
		class buildingShopConfig {};
		class clothingShopConfig {};
		class insuranceShopConfig {};
		class itemStringConfig {};
		class itemTooltipConfig {};
		class licenseShopConfig {};
		class realestateConfig {};
		class shopInfoConfig {};
		class specialShopConfig {};
		class vehShopConfig {};
		class virtShopConfig {};
		class weaponShopConfig {};
	};

	class GLOBAL_SPAWN
	{
		file = "player\global\spawn";
		class getSpawnPoints {};
		class houseMarkers {};
		class moveSpawnMap {};
		class spawnLBChanged {};
		class spawnPlayer {};
	};

	class GLOBAL_VEHICLE
	{
		file = "player\global\vehicle";
		class autoMiner {};
		class clearVehAmmo {};
		class garageFull {};
		class getInVehicle {};
		class getVehWeight {};
		class globalLights {};
		class globalTexture {};
		class handleVehLights {};
		class impoundFee {};
		class impoundRetrieve {};
		class installNos {};
		class installUpgrades {};
		class keyGive {};
		class lights {};
		class moveInVehicle {};
		class receiveKey {};
		class reloadGarage {};
		class retrieveVehicle {};
		class retrieveVehicleHouse {};
		class sellVehicle {};
		class setupVeh {};
		class shopVehUpgrades {};
		class siphonKit	{};
		class siren {};
		class stationRefuel {};
		class storeVehicle {};
		class unlock {};
		class useFuel {};
		class vehBurn {};
		class vehCrash {};
		class vehDoors {};
		class vehGlobalLock {};
		class vehGPS {};
		class vehicleTextures {};
		class vehItemStore {};
		class vehItemTake {};
		class vehLights {};
		class vehLoad {};
		class vehLockpick {};
		class vehPullout {};
		class vehPulloutPlayer {};
		class vehRearm {};
		class vehRefuel {};
		class vehRepaint {};
		class vehRepair {};
		class vehReskin {};
		class vehSpiked {};
		class vehUnload	{};
		class vehUpgrades {};
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
		class repairSafeResearch {};
	};

	class POLICE_REWARDS
	{
		file = "player\police\rewards";
		class bailPaid {};
		class bonus {};
		class copRewards {};
		class getBounty {};
		class punishments {};
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
		class lottoDraw {};
		class lottoBuy {};
		class captureRebelKosAlert {};
		class hostageAreaVictim {};
		class takeItemResearch {};
		class crackSafeResearch {};
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
		class sellGangGoods {};
		class messageGang {};
		class clanStorage {};
		class clanItemStorage {};
		class gangAreaWarnings {};
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
		class dropCheck {};
		class dropPay {};
		class informPolice {};
	};
};