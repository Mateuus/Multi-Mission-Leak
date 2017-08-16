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
		class launcherVersion {};
		class getrealdate {};
		class getnumber {};
		class protocol {};
		class kennzeichen {};
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
		class credits {};
		class survival {};
		class endCam {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
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
		class adminATM {};
		class crashPlayer {};
		class crashStart {};
		class repairBuild {};
		class massTeleport {};
		class adminSiren {};
		class adminhide {};
		class massteleportaction {};
		class adminfirework {};
		class adminVergabe {};
	};
	
	class AHW_System
	{
		file = "core\ahw";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class ahwLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class medicSiren2 {};
		class medShowLicense {};
		class medShowKrankmeldung {};
	    class ahwInteractionMenu {};
		class medMarkers {};
		class medDekon {};
		class xray {};
		class medicgather {};
		class ahwEinsatz {};
		class ahwCallAction {};
		class rechnungGive {};
		class rechnungPaid {};
		class rechnungpay {};
		class rechnungPrompt {};
		class einsatzzentrale {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class catchFish {};
		class catchTurtle {};
		class PostMissionFinish {};
		class dropFishingNet {};
		class getPostMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class packupholzb {};
		class packupsperre {};
		class packuphut {};
		class packupband {};
		class packupschild {};
		class packuplaterne {};
		class packupfeuer {};
		class packupklappstuhl {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class gather {};
		class surrender {};
		class fitness {};
		class takeOrgans {};
		class robShops {};
		class robShops2 {};
		class shopState {};
		class rechnungAction {};
		class gutAnimal {};
		class packupnetz {};
		class craftAction {};
		class kraftwerk {};
		class alkoholiker {};
		class funknetz {};
		class schatzsuchestart {};
		class gatherwasser {};
		class rarzeug {};
		class werkstattrepair {};
		class toilet {};
		class maut {};
		class zoneGather {};
		class gatherZone {};
		class gemaeldeklau {};
		class finishGemaelde {};
		class salzgather {};
		class hotel {};
		class donatorsupply {};
		class tutinfo {};
		class radio {};
		class grabung {};
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
		class glockenspiel {};
		class spendenhaus {};
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
		class varToShortStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class vehicleDeAnimate {};		
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		class seizeCfg {};
		class itemIcon {};
		class exptolevel {};
		class craftCfg {};
		class erfolge {};
		class hudcfg {};
		class apppreis {};
		class beschreibung {};
		class getrang {};
		class marker {};
		class versicherungspreise {};
		class classPrices {};
		class classColors {};
		class tooltips {};
	};
	
	class Config_Clothing 
	{
		file = "core\config\clothing";
		class updateClothing {};
		class clothing_cop {};
		class clothing_cop_krawall {};		
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_ahw {};
		class clothing_gruppe {};
		class clothing_presse {};
		class clothing_jagd {};
		class clothing_president {};
		class clothing_winter {};
		class clothing_bandit {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class wantedadd2 {};
		class wanted2 {};
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
		class keyRange {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class smartphone {};
		class newMsg {};
		class showMsg {};
		class AAN {};
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
		class erfolgeinfo {};
		class hudchange {};
		class inventory {};
		class appstore {};
		class guthaben {};
		class hilfe {};
		class altismaps {};
		class lizenzen {};
		class sms {};
		class notrufcheck {};
		class guthabencheck {};
		class protocolinfo {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class hudInfoUpdate {};
		class simDisable {};
		class dropItems {};
		class handleDamage {};
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
		class randomRound {};
		class fadeSound {};
		class onPlayerDisconnect {};
		class addsubstract {};
		class moneytransfer {};
		class zustand {};
		class aufzuschliessen {};
		class videoToTexture {};
		class levelAnnounce {};
		class expToAll {};
		class expinfo {};
		class sitdown {};
		class standup {};
		class addaction {};
		class spenden {};
		class gericht {};
		class spendometer {};
		class gettime {};
		class disableUserInput {};
		class lightpoints {};
		class showChat {};
		class bootslicht {};
		class markercfg {};
		class questitems {};
		class mailbox {};
		class handleInvCheck {};
		class closedialog {};
		class aufladen {};
		class computer {};
		class setChannel {};
		class legend {};
		class flugzeugsmoke {};
		class ausweis {};
		class versicherungCheck {};
		class inString {};
		class inBuilding {};
		class diamondmine {};
		class hideit {};
		class licenseTransfer {};
		class createVehicle {};
		class kfzproof {};
		class kennzeichencheck {};
		class fackel {};
		class texttiles {};
		class teargas {};
		class getIn {};
		class getOut {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
		class playsound {};
		class timemultiplier {};
		class skiptime {};
		class setVar {};
	};
	
	class crypt
	{
		file = "core\crypt";
		class SI6bOc7Yo8o5WVuKHgDCCnd9t {};
		class vxD93BOAnpKKWJhygRYOLkYxx {};
		class iivbt2MSXEtS5nyIDI3FESjRP {};
		class WU1BnhGNjvBNJNVsxCur30Gx6 {};
		class wvcYpftBcZcXNS52ake6f4tKi {};
		class 4lwyQ58yGET4wkCrTkcp7xPr4 {};
		class OK6MG6146wSXrPodM33mcCqS1 {};
		class sNd3T9ytOU6VeavcsHSsQNC5s {};
		class Ay2lhVFs2GFX6mxpshRCYcUMY {};
		class JPQBkE68YdLjChg1xDsMde0On {};
		class JG2CufyUQMPxJRZdCRwWvUJmE {};
		class FEykxDjBMLEfCMJy45Z1uP1tD {};
		class K2hUrgw4yWNpr7husft7v4Zkj {};
		class QFi487K8kb6660aG9wCF6lVpY {};
		class OmxR74OapcbWJjEX8lNCjDDAN {};
		class CsLejg6Dlw9gNhEA6k9N7HZrF {};
		class P6rQewfscyjagtcvnAqijWXTB {};
		class xCSZ5U7bbgXUiKMusoR7RDcw6 {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class demoChargeTimer {};
		class civLoadout {};
		class civInteractionMenu {};
		class freezePlayer {};
		class teleportPlayer {};
		class gangMarkers{};
		class rebInteractionMenu {};
		class ShowFahrerLicense {};
		class ShowAHWLicense {};
		class hasOrgan {};
		class npcMarker {};
		class presidentflag {};
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
		class flugzeug {};	
		class erollator {};
		class versicherung {};
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
		class ticketPrompt {};
		class copSiren {};
		class copSiren2 {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class seizePlayerWeapon {};
		class seizePlayerWeaponAction {};
		class copOpener {};
		class ticketPaid {};
		class copShowLicense {};
        class LicenseShown {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
		class scheinEntzug {};
        class scheinEntzugNow {};
		class breathalyzer {};
		class scancall {};
	};
	
	class Tanken
	{
		file = "core\Tanken";
		class diesel {};
		class super {};
		class superplus {};
		class kerosin {};		
		class fuelPrices {};
		class initFuelAction {};
		class vehicleCheck {};
		class fuel {};
	};

	class Gangs
	{
		file = "core\Gangs";
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
		class gangTag {};
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
		class vehicleShopColorChange {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virtVIP_buy {};
		class virtVIP_menu {};
		class virtVIP_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class gangVehShop {};
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class pumpe {};		
		class lockpick {};
		class spikeStrip {};
		class holzb {};
		class sperre {};
		class hut {};
		class band {};
		class schild {};
		class laterne {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class CarAlarmSound {};
		class weed {};
		class drinkbeer {};
		class drinkmoonshine {};
		class drinkwhiskey {};
		class gpsTracker {};
		class netz {};
		class refueljerryrefuel {};
		class feuer {};
		class klappstuhl {};
		class axeUse {};
		class verband {};
		class firework {};
		class rollator {};
		class airhorn {};
		class football {};
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
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class gangWithdraw {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class calldialog {};
		class sendChannel {};
		class camrotate {};
		class ringtone {};
		class immoScout {};
		class spawnSide {};
		class RespawnMenu {};
		class mapmarker {};
		class processBar {};
		class atm {};
		class radiomod {};
	};
	
	class Market
	{
		file = "core\market";
		class openMarketView {};
		class updateMarketView {};
		class refreshMarketView {};
		class marketShortView {};
		class marketBuy {};
		class marketSell {};
		class marketGetBuyPrice {};
		class marketGetSellPrice {};
		class marketconfiguration {};
		class marketReset {};
		class marketChange {};
		class marketGetRow {};
		class marketGetPriceRow {};
		class marketSetPriceRow {};
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
		class halloweenorb {};
		class halloweenstory {};
		class halloweenheal {};
		class darktrader {};
		class advent {};
		class snowevent {};
		class schlittschuh {};
		class geschenke {};
		class fireworks {};
		class preparefirework {};
		class em {};
		class volleyball {};
	};
	
	class anstrich
	{
		file = "core\repaint";
		class RepaintMenu {};
		class Repaintcolor {};
		class RepaintVehicle {};
	};

	class folter
	{
		file = "core\folter";
		class elektroschock {};
		class TorturePlayer {};
		class waterboarding {};
	};
	
	class muell
	{
		file = "core\muell";
		class MuellCfg {};
		class MuellDeponie {};
		class MuellDeponieSet {};
		class MuellInfo {};
		class MuellInfoChange {};
		class MuellInfoFinish {};
		class MuellContainer {};
		class SpawnNear {};
	};
	
	class Katastrophen
	{
		file = "Katastrophen";
		class earthquake {};
		class snow {};
		class endsnow {};
		class fallout {};
	};
	
	class Auktionshaus
    {
    	file = "core\Auktionshaus";
    	class CAH_Sell {};
    	class CAH_Buy {};
    	class CAH_reciever {};
    	class CAH_getPlayerObj {};
    	class CAH_loadOffers {};
    	//class CAH_updateOffers {};
    	class CAH_loadInventory {};
    	class CAH_fetchDetails {};
    	class CAH_loggedIn {};
    	class CAH_checkStorno {};
		class getAuktionen {};
    };
};