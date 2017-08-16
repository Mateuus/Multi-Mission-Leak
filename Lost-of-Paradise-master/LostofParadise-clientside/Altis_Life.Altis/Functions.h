class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

//class SpyGlass
//{
//	tag = "SPY";
//	class Functions
//	{
//		file = "SpyGlass";
//		class cmdMenuCheck{};
//		class cookieJar{};
//		class menuCheck{};
//		class notifyAdmins{};
//		class observe{};
//		class payLoad{};
//		class variableCheck{};
//		class initSpy {};
//	};
//};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
	//	class initZeus {};
		class initCop {};
		class initMedic {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class admintp {}; //Admin Teleport
		class admintpmap {}; //Admin Teleport
		class admintptome {}; //Admin Teleport
		class godmodean {}; //Gott An
		class godmodeaus {}; //Gott Aus
		class destroy {}; //Destroy
		class spectate  {}; //Beobachten
		class playerespan  {}; //esp
		class playerespaus  {}; //esp
	};
	
	 class Ausweis
    {
        file = "script";
        class Lizenzsehen {};
        class Lizenzzeigen {};
    };
	
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class medicEnter {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class arsInteractionMenu {}; // escort civ
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class standup {}; //Aufstehen
		class sitdown {}; //Hinsetzen
		class blackjack {}; //Blackjack
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class takeOrgans {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class removeWeaponAction {}; //Waffen entziehen
		//class dpFinish {};
		class gathermuschel {};
		class gatherpils {};
		class gatheratom {};
		class gatherschrott {};
		class dropFishingNet {};
		class gatherApples {};
		class gatherCannabis {};
		class gathermais {};
		class gatherzucker {};
		class gatherHeroin {};
		//class packupmais {};
		//class packupzucker {};
		class baumoto {};
		class desti {};
		class maische {};
		class gatherUran {};
		class gatherOil {};
		//class getDPMission {};
		class postBail {};
		class processAction {};
		class suicideBomb {}; //Selbstmord Weste
		class surrender {}; //Ergeben
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class gatherMeth {};
		class gatherFrog {};
		class gatherGold {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class gatherPeaches {};
		class gatherCocaine {};
		class packupSpikes {};
		class packupmauer {}; //Pylone
		class packupgeld {}; //Falschgeld
		class packuplampe {}; //Cop Strahler
		class packupwand {}; //Cop Mauer
		class packupschranke {}; //Cop Schranke
		class packupsperre {}; //Barriere
		class packupdixi {}; //Dixi
		class packuptisch{}; //Tisch
		class packupgenerator{}; //Generator
		class packupmatratze{}; //Matratze
		class packupzelt {}; //zelt
		class sellGoldBars {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		// class gather {}; wird nicht gebraucht
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};
	
	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class AAN {}; //Channel 7 News
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class wantedadd2 {}; // Wanted+
		class wanted2 {}; // Wanted+
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class priceASK {}; //Handelspreise Legal
		class priceASK1 {}; //Handelspreise Illegale
		class priceASK2 {}; //BHC Handelspreise Illegale
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class jetmode {}; //Jet Godmode
		class handleItem {};
		class accType {};
		class fadeSound {}; // Ohr
		class receiveItem {};
		class giveDiff {};
		class vdmed {}; //Anti-VDM
		class receiveMoney {};
		class playerTags {};
		class Opener {}; //Schranken öffnen
		class equipGear {}; //Cop Skins
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
	//	class emptyFuel {}; // Spritverbrauch
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
//		class disableRope {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class removeWeapons {}; // Waffen entziehen
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class hasOrgan {};
		class civInteractionMenu {}; // escort civ
		class removeLicenses {};
		class zoneCreator {};
		class demoChargeTimer {};
		class civLoadout {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class copEnter {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class ticketPaid {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class showArrestDialog {}; //changed
		class arrestDialog_Arrest {}; //changed
		class copBroadcast {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class groupMarkers {}; //Map Marker
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class bier {};
		class lopbier {};
		class meth {};
		class heroin {};
		class kokain {};
		class pille {};
		class lsd {};
		class weed {};
		class usebrenn {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class mauer {}; //Pylone
		class lampe {}; //Cop Strahler
		class schranke {}; //Schranke
		class wand {}; //Cop Mauer
		class sperre {}; //Barriere
		class geld {}; //Falschgeld
		class dixi {}; //Toilette
		class tisch {}; //Tisch
		class generator {}; //generator
		class matratze {}; //matratze
		class zelt {}; //zelt
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class CarAlarmSound {}; //Alarmanlage
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class calldialog {}; //Channel7
		class sendChannel {}; //Channel7
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
	};
	
	class LostOfParadise
	{
		file = "core\lop";
		class initIntro {};
	};
};