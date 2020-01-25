
class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class syncData {};
		class updatePartial {};
	};
};
class KBWFiles
{
	tag = "KBW";
	class KBW
	{
		file = "KBW";
		class openDuelUI {};
		class duelRequest {};
		class duelRequested {};
		class initRace {};
	};
};
class Life_Client_Core
{
	tag = "life";
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
	};
		
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class healperson {};
		class healself {};
		class revivePlayer {};
		class ApplyAir {};
		class CPRPlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
	};
	
	class Actions
	{
		file = "core\actions";
		class AntiSpam {};
		class AntiSpam2 {};
		class tieingActionb {};
		class gaggingActionb {};
		class tieingAction {};
		class breakout {};
		class spawntaxi {};
		class captureCrate {};
		class licensetest {};
		class bankteller {};
		class newsJobs {};
		class dropbody {};
		class dragbody {};
		class spawnmobile1 {};
		class Maintenance {};
		class createGarbage {};
		class createEvidence {};
		class Nos {};
		class seatbelt {};
		class destroyEvidence {};
		class gatherEvidence {};
		class lawyerSignup {};
		class shank {};
		class rope {};
		class race {};
		class race2 {};		
		class takeashit {};
		class middlefinger {};
		class punchSystem {};
		class trydriver {};
		class taxi {};
		class rally1 {};
		class skyDive {};
		class packupRoadcones {};
		class packupRoadblock {};
		class packupBarGate {};
		class buyLicense {};
		class spawnAnimal {};
		class doubleCharge {};
		class rechargePhone {};
		class standardPhone {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class rechargestand {};
		class fuckhooker {};
		class bronutsbrah {};
		class pizza {};
		class catchFish {};
		class sellBag {};
		class catchTurtle {};
		class dropFishingNet {};
		class postBail {};
		class phonecall {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class impoundActionTow {};
		class checkdefect {};
		class emspulloutAction {};
		class pulloutAction {};
		class pulloutDriverAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupItem2 {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class gather {};
		class lockvault {}; 
		class openvault {}; 
		class closevault {}; 
		class hackvault {}; 		
		class robStore {}; 
		class surrender {};
		class carSalesman {};
		//class robBank {};
	};	

	class Housing
	{
		file = "core\housing";
		class lootHouse {};
		class buyHouse {};
		class housePrice {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class prostitute {};
		class givekey1 {};
		class wipekeys {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};
	
	class Drugs
	{
		file = "core\drugs";
		class useMarijuana {};
		class useMeth {};
		class useMDMA {};
		class useCoke {};
		class useHeroin {};
		class useCigarette {};
		class useBEC {};
	};

	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class vehicleNameCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_ems {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
	};
	
	class Special
	{
		file = "core\special";
		class openEmpMenu {};
		class isEmpOperator {};
		class scanVehicles {};
		class warnVehicle {};
		class empVehicle {};
		class vehicleWarned {};
		class vehicleEmpd {};
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
		class removeItem2 {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class revokeLicense {};
	};
	
	class Functions
	{
		file = "core\functions";
		class A3L_bankrobbery {};
		class pettycash {};
		class handleCash {};
		class A3L_PlantCharge {};
		class calWeightDiff {};
		class seizeObjects {};
		class untie {};
		class untieb {};
		class EmergencyEject {};
		class ungag {};
		class electric {};
		class fetchCfgDetails {};
		class hh {};
		class handleInv {};
		class medWatch {};
		class hudSetup {};
		class HudElements {};
		class hudUpdate {};
		class pickupitems {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class enableActions {};
		class dropItems {};
		class handleDamage {};
		class onPlayerHit {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
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
		class enablecollisionwith {};
  		class disablecollisionwith {};
  		class fadeSound {};
  		class destroyComms {};
		class nearestSound {};
		class getTester {};
		class requestTestDrive {};
		class testDrive {};
		class broadcastCheck {};
		class actAirSiren {};
		class airSiren {}; 
		class medactAirSiren {};
		class medairSiren {}; 
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class setFuel {};
		class setTexture {};
		class say3D {};
		class HCC {};
		class MP {};
		class MPexec {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class tieing {};
		class throwcar {};
		class sprayCar {};
		class sprayCarFinish {};		
		class tieingb {};
		class gaggedb {};
		class jail {};
		class tazed {};
		class downed {};
		class sharphit {};
		class blunthit {};
		class knockedOut {};
		class crashTackled {};
		class knockoutAction {};
		class tackleAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
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
		class addVehicle2Chain {};
		class animateJonzies {};
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class craftMenu {};
		class chargeMenu {};
		class initCustomCharge {};
		class vehInvSearch {};
		class copSearch {};
		class parole {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class civInteractionMenu {};
		class emsInteractionMenu {};
		class copInteractionMenu {};
		class helpmenu {};
		class animmenu {};
		class licensesLook {};
		class repairDoor {};
		class doorAnimate {};
		class copLoadout {};
		class ticketPaid {};
		class testIntox {};	
		class testIntoxClient {};
		class intoxTestReturn {};
		class fastRope {};
		class removeWeaponAction {};
		class removeWeaponActionCiv {};	
		class teargas {};
		class soundloop {};
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
		class stretcherpls {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class customVehicleShopBuy {};
		class customTruckShopBuy {};
		class vehicleShopPreview {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class gift {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class slotmachine {};
		class BJbet {};
		class BJhit {};
		class BJstay {};
		class blackjack {};
		class slotSpin {};
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class spikeStripInstant {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class defuseKit {};
		class storageBox {};
		class RoadBlockWood {};
		class RoadBlockConc {};
		class RoadBlockRebel {};
		class RoadCone {};
		class RoadConeStrip {};
	};
	
	class Jail
	{
		file = "core\jail";
		class arrestButton {};
		class arrestMenu {};
		class jailSetup {};
		class jailTimer {};
		class releasePrison {};
		class sendToJail {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
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
		class doQuickMsg {};
		class doMsg {};
		class radioMenu {};
		class createColorUI {};
		class createTruckColorUI {};
		class updateVehicleColor {};
		class updateUI {};
		class populateSalesCredit {};
		class populateTestDrive {};		
	};
};