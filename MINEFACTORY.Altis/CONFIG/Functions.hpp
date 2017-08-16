class Socket_Reciever {
	tag = "SOCK";
	class SQL_Socket {
		file = "MINEFACTORY\session";
		class dataQuery {};
		class insertPlayerInfo {};
		class requestReceived {};
		class syncData {};
		class updatePartial {};
		class updateRequest {};
	};
};

class phoneCalls {
	tag = "phoneCalls";
	
	class phoneCallsFunctions {
		file = "MINEFACTORY\PhoneCalls";
		class partial {};
		class setUpClient {};
	};
};

class schlissfach {
	tag = "locker";
	class locker
	{
		file = "MINEFACTORY\locker";
		class lockerCreate {};
		class lockerInsertItem {};
		class lockerMenu {};
		class lockerMenuUpdate {};
		class lockerTakeItem {};
		class setLocker {};
	};
};


class Life_Client_Core {
	tag = "life";

	class Master_Directory {
		file = "MINEFACTORY";
		class initCiv {};
		class initCop {};
		class initMedic {};
		class setupActions {};
		class setupEVH {};
		class survival {};
		class welcomeNotification {};
	};
	
	class ConfigMineFactory {
		file = "CONFIG";
		class MineFactory_CraftConfig {};
		class MineFactory_CraftitemConfig {};
	};
	
	/*class MineFactoryMap {
		file = "MINEFACTORY\Map";
		class map {};
	};*/
	
	class CraftingSystem {
		file = "MINEFACTORY\CraftingSystem";
		class craft_updateFilteritem {};
		class craft_updateitem {};
		class craftActionitem {};
		class craftitem {};
	};
	
	class Regeln {
		file = "MINEFACTORY\Regeln";
		class regeln {};
	};
	
	class Zmenu {
		file = "MINEFACTORY\Zmenu";
		class adminmenuzmenu {};
		class copcomputerzmenu {};
		class fahndungslistezmenu {};
		class gangzmenu {};
		class absperrungen {};
	};
	
	class Shinji {
		file = "MINEFACTORY\Smartphone";
		class clearMessages {};
		class findUser {};
		class getMessage {};
		class getMessagePos {};
		class initMessages {};
		class openMessages {};
		class playerSent {};
		class recieveMessage {};
	};

	class Actions {
		file = "MINEFACTORY\actions";
		class arrestAction {};
		class buyLicense {};
		class captureHideout {};
		class catchFish {};
		class dpFinish {};
		class dropFishingNet {};
		class escortAction {};
		class gather {};
		class getDPMission {};
		class gutAnimal {};
		class healHospital {};
		class impoundAction {};
		class mine {};
		class packupSpikes {};
		class pickupItem {};
		class pickupMoney {};
		class postBail {};
		class processAction {};
		class pulloutAction {};
		class pushVehicle {};
		class putInCar {};
		class removeContainer {};
		class repairTruck {};
		class restrainAction {};
		class robAction {};
		class searchAction {};
		class searchVehAction {};
		class seizePlayerAction {};
		class serviceChopper {};
		class stopEscorting {};
		class storeVehicle {};
		class surrender {};
		class ticketAction {};
		class unrestrain {};
		class shopState {};
	};

	class Admin {
		file = "MINEFACTORY\admin";
		class adminCompensate {};
		class adminDebugCon {};
		class adminFreeze {};
		class admingetID {};
		class adminGodMode {};
		class adminid {};
		class admininfo {};
		class adminMarkers {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class EinwAdmin {};
	};

	class Civilian {
		file = "MINEFACTORY\civilian";
		class civLoadout {};
		class civMarkers {};
		class demoChargeTimer {};
		class freezePlayer {};
		class jail {};
		class jailMe {};
		class knockedOut {};
		class knockoutAction {};
		class removeLicenses {};
		class robPerson {};
		class robReceive {};
		class tazed {};
		class vInteraction_civ {};
		class civInteractionMenu {};
	};

	class Config {
		file = "MINEFACTORY\config";
		class houseConfig {};
		class itemWeight {};
		class taxRate {};
		class vehicleAnimate {};
		class vehicleWeightCfg {};
	};

	class Cop {
		file = "MINEFACTORY\cop";
		class bountyReceive {};
		class containerInvSearch {};
		class copInteractionMenu {};
		class copLights {};
		class copLoadout {};
		class copMarkers {};
		class copSearch {};
		class copSiren {};
		class doorAnimate {};
		class fedCamDisplay {};
		class licenseCheck {};
		class licensesRead {};
		class questionDealer {};
		class radar {};
		class repairDoor {};
		class restrain {};
		class searchClient {};
		class seizeClient {};
		class sirenLights {};
		class spikeStripEffect {};
		class ticketGive {};
		class ticketPaid {};
		class ticketPay {};
		class ticketPrompt {};
		class vehInvSearch {};
		class wantedGrab {};
		class copEnter {};
		class copOpener {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
	};
	
	class WantedSystem
	{
		file = "MINEFACTORY\WantedSystem";
		class pcinit {};
		class spielerinfo {};
		class playerQuery {};
		class initdatabase {};
		class straftaten {};
		class berichtverfassen {};
		class dropdown {};
		class deletebericht {};
		class wirdgesucht {};
		class berichtedit {};
	};

	class Dialog_Controls {
		file = "MINEFACTORY\dialog\function";
		class bankDeposit {};
		class bankTransfer {};
		class bankWithdraw {};
		class displayHandler {};
		class gangDeposit {};
		class gangWithdraw {};
		class garageLBChange {};
		class impoundMenu {};
		class progressBar {};
		class safeFix {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class sellGarage {};
		class setMapPosition {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class unimpound {};
		class vehicleGarage {};
		class wireTransfer {};
		class insureCar {};
	};

	class Functions	{
		file = "MINEFACTORY\functions";
		class accType {};
		class actionKeyHandler {};
		class animSync {};
		class calWeightDiff {};
		class clearVehicleAmmo {};
		class dropItems {};
		class escInterupt {};
		class fetchCfgDetails {};
		class fetchDeadGear {};
		class fetchVehInfo {};
		class giveDiff {};
		class handleDamage {};
		class handleInv {};
		class handleItem {};
		class hideObj {};
		class hudSetup {};
		class hudUpdate {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isnumeric {};
		class isUIDActive {};
		class keyHandler {};
		class loadDeadGear {};
		class loadGear {};
		class nearATM {};
		class nearestDoor {};
		class nearestObjects {};
		class nearUnits {};
		class numberText {};
		class onFired {};
		class onTakeItem {};
		class playerCount {};
		class playerTags {};
		class pullOutVeh {};
		class pushObject {};
		class receiveItem {};
		class receiveMoney {};
		class revealObjects {};
		class saveGear {};
		class searchPosEmpty {};
		class simDisable {};
		class stripDownPlayer {};
		class tazeSound {};
		class teleport {};
		class whereAmI {};
		class nachricht {};
		class nachrichtonload {};
		class autoSave {};
		class ohrstopsel {};
		class shredderContent {};
		class blinkerManage {};
		class blinkerLights {};
	};

	class Gangs	{
		file = "MINEFACTORY\gangs";
		class createGang {};
		class gangCreated {};
		class gangDisband {};
		class gangDisbanded {};
		class gangInvite {};
		class gangInvitePlayer {};
		class gangKick {};
		class gangLeave {};
		class gangMenu {};
		class gangNewLeader {};
		class gangUpgrade {};
		class initGang {};
	};

	class Housing {
		file = "MINEFACTORY\housing";
		class buyHouse {};
		class containerMenu {};
		class copBreakDoor {};
		class copHouseOwner {};
		class garageRefund {};
		class getBuildingPositions {};
		class houseMenu {};
		class initHouses {};
		class lightHouse {};
		class lightHouseAction {};
		class lockHouse {};
		class lockupHouse {};
		class placeContainer {};
		class PlayerInBuilding {};
		class raidHouse {};
		class sellHouse {};
	};

	class Items	{
		file = "MINEFACTORY\items";
		class blastingCharge {};
		class boltcutter {};
		class defuseKit {};
		class flashbang {};
		class jerryRefuel {};
		class lockpick {};
		class placedefinestorage {};
		class placestorageBig {};
		class placestorageSmall {};
		class spikeStrip {};
		class storageBoxBig {};
		class storageBoxSmall {};
		class CarAlarmSound {};
		class nagelpistole {};
	};

	class Medical_System {
		file = "MINEFACTORY\medical";
		class deathScreen {};
		class medicLights {};
		class medicLoadout {};
		class medicMarkers {};
		class medicRequest {};
		class medicSiren {};
		class medicSirenLights {};
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class requestMedic {};
		class respawned {};
		class revived {};
		class revivePlayer {};
		class mediccomputerabfrage {};
		class kommandomode {};
		class kommandozentrale {};
		class spielernotiz {};
	};

	class Network {
		file = "MINEFACTORY\functions\network";
		class broadcast {};
		class corpse {};
		class jumpFnc {};
		class say3D {};
		class setFuel {};
		class soundDevice {};
	};

	class Player_Menu {
		file = "MINEFACTORY\pmenu";
		class cellphone {};
		class giveItem {};
		class giveMoney {};
		class keyDrop {};
		class keyGive {};
		class keyMenu {};
		class p_openMenu {};
		class p_updateMenu {};
		class pardon {};
		class removeItem {};
		class s_onChar {};
		class s_onCheckedChange {};
		class s_onSliderChange {};
		class settingsMenu {};
		class updateViewDistance {};
		class useItem {};
		class wantedAddP {};
		class wantedInfo {};
		class wantedList {};
		class wantedMenu {};
	};

	class Shops	{
		file = "MINEFACTORY\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class clothingFilter {};
		class clothingMenu {};
		class FuelLBchange {};
		class FuelStatOpen {};
		class vehicleShop3DPreview {};
		class vehicleShopBuy {};
		class vehicleShopEnd3DPreview {};
		class vehicleShopInit3DPreview {};
		class vehicleShopLBChange {};
		class vehicleShopMenu {};
		class virt_buy {};
		class virt_menu {};
		class virt_sell {};
		class virt_update {};
		class weaponShopAccs {};
		class weaponShopBuySell {};
		class weaponShopFilter {};
		class weaponShopMags {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class equipGear {};
	};

	class Vehicle {
		file = "MINEFACTORY\vehicle";
		class addVehicle2Chain {};
		class colorVehicle {};
		class deviceMine {};
		class FuelRefuelcar {};
		class fuelStore {};
		class fuelSupply {};
		class lockVehicle {};
		class openInventory {};
		class vehiclecolor3DRefresh {};
		class vehicleOwners {};
		class vehicleWeight {};
		class vehInventory {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vInteractionMenu {};
	};
	
	class Einwanderung
	{
		file = "MINEFACTORY\Einwanderung";
		class ErsterText {};
		class ASAR_Rettung {};
		class Einwandern {};
		class Einwanderntp {};
	};
	
	class Bong_Rauchen
	{
		file = "MINEFACTORY\Drogen";
		class LSDnimm {};
		class Weednimm {};
		class Cocainenimm {};
		class Heroinnimm {};
		class suechtig {};
	};
	
	class News_paper
	{
		file = "MINEFACTORY\news";
		class news_open {};
		class new_news {};		
		class news_save {};
		class news_broadcast {};
	};
	
	class Scripts
	{
		file = "MINEFACTORY\Scripts";
		class goodbye {};
		class nitro {};
		class activateNitro {};
		class protest {};
		class globalSound {};
		class globalSoundClient {};
		class swat1 {};		
		class swat2 {};		 
		class swat3 {};		 
		class swat4 {};
		class UAV2 {};
		class UAV3 {};
		class interactiveMapMenu {};
		class busTravel {};
		class busTimer {};
		class soccer {};
		class chemlightUse {};
		class robShops {};
		class robShops2 {};
		class Lizenzsehen {};
        class Lizenzzeigen {};
		class markercreate {};
	};
	
	class vAH
	{
		file = "MINEFACTORY\vAH";
		class vAH_load;
		class vAH_buy;
		class vAH_reciever;
		class vAH_loadInventory;
		class vAH_sell;
		class vAH_checkItem;
		class vAH_takeBack;
		class vAH_select;
	};
	
    class DynMarket
    {
        file = "MINEFACTORY\DynMarket";
        class bought {};
        class update {};
        class DisplayPrices {};
        class LoadIntoListbox {};
        class ForcePrice {};
        class DYNMARKET_getPrice {};
    };
	
	class CopPlaceables
	{
		file = "MINEFACTORY\cop\placeables";
		class placeablesInit {};
		class placeablesMenu {};
		class placeablesRemoveAll {};
		class placeablePlace {};
		class placeableCancel {};
		class placeablesPlaceComplete {};
	};
	
	class Nummernschild
	{
		file = "MINEFACTORY\Nummernschild";
		class licensePlate {};
	};
};


class CHVD
{
    tag = "CHVD";
    class script
    {
        file = "MINEFACTORY\Scripts\CHVD";
        class onCheckedChanged {};
        class onSliderChange {};
        class onLBSelChanged {};
        class onEBinput {};
        class onEBterrainInput {};
        class selTerrainQuality {};
        class updateTerrain {};
        class updateSettings {};
        class openDialog {};
        class localize {};
        class init {postInit = 1;};
    };
};