class Socket_Reciever {
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class dataQuery {};
		class insertPlayerInfo {};
		class requestReceived {};
		class syncData {};
		class updatePartial {};
		class updateRequest {};
	};
};

class Life_Client_Core {
	tag = "life";

	class Master_Directory {
		file = "core";
		class initCiv {};
		class initCop {};
		class initMedic {};
		class setupActions {};
		class setupEVH {};
		class survival {};
		class welcomeNotification {};
		class initPayChecks {};
	};


	class Market {
		file = "core\market";
		class openMarketView {};
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


	class Actions {
		file = "core\actions";
		class arrestAction {};
		class busTravel {};
		class buyLicense {};
		class captureHideout {};
		class catchFish {};
		class dpFinish {};
		class dropFishingNet {};
		class escortAction {};
		class gateOpener {};
		class gather {};
		class getDPMission {};
		class gutAnimal {};
		class healHospital {};
		class impoundAction {};
		class mine {};
		class newsBroadcast {};
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
		class robItems {};
		class searchAction {};
		class searchVehAction {};
		class seatbelt {};
		class seizePlayerAction {};
		class seizeVehAction {};
		class serviceChopper {};
		class skyDive {};
		class stopEscorting {};
		class storeVehicle {};
		class surrender {};
		class teleTimer {};
		class ticketAction {};
		class tieAction {};
		class unflip {};
		class unrestrain {};
		class untie {};
		class takeOrgan {};
		class injectAction {};
	};
	class Ausweis
    {
        file = "core\Ausweis";
        class Lizenzsehen {};
        class Lizenzzeigen {};
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

	class Admin {
		file = "core\admin";
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
	};

	class Civilian {
		file = "core\civilian";
		class civInteractionMenu {};
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
		class tie {};
		class hasOrgan {};
		class slotSpin {};
        class slotmachine {};
	};

	class Config {
		file = "core\config";
		class houseConfig {};
		class itemWeight {};
		class taxRate {};
		class vehicleAnimate {};
		class vehicleWeightCfg {};
		class updateClothing {};
	};
	class Cop {
		file = "core\cop";
		class arrestDialog_Arrest {};
		class bountyReceive {};
		class breathalyzer {};
		class copOpener {};
		class containerInvSearch {};
		class copInteractionMenu {};
		class copEnter {};
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
		class parkingTicket {};
		class payParkingTicket {};
		class radar {};
		class repairDoor {};
		class restrain {};
		class searchClient {};
		class seizeClient {};
		class seizeObjects {};
		class showArrestDialog {};
		class sirenLights {};
		class spikeStripEffect {};
		class ticketGive {};
		class ticketPaid {};
		class ticketPay {};
		class ticketPrompt {};
		class vehInvSearch {};
		class wantedGrab {};
		class copZones {};
	};

	class Dialog_Controls {
		file = "dialog\function";
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
	};

	class Functions	{
		file = "core\functions";
		class accType {};
		class bankFast {};
		class actionKeyHandler {};
		class animSync {};
		class calWeightDiff {};
		class clearVehicleAmmo {};
		class createMarker {};
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
		class introCam {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isDamaged {};
		class isnumeric {};
		class isUIDActive {};
		class keyHandler {};
		class loadDeadGear {};
		class loadGear {};
		class loggedOut {};
		class nearATM {};
		class nearestDoor {};
		class nearUnits {};
		class numberText {};
		class numberText2 {};
		class onFired {};
		class onTakeItem {};
		class playerCount {};
		class playerSkins {};
		class playerTags {};
		class pullOutVeh {};
		class pushObject {};
		class receiveItem {};
		class receiveMoney {};
		class revealObjects {};
		class saveGear {};
		class searchPosEmpty {};
		class simDisable {};
		class speaking {};
		class stripDownPlayer {};
		class tazeSound {};
		class teleport {};
		class whereAmI {};
		class jihad {};
		class radArea {};
		class robstore {};
		class heal {};
		class autoMessages {}; // Message Auto
		class randomRound {};
		class AAN {};
		class postNewsBroadcast {};
	};

	class Gangs	{
		file = "core\gangs";
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
	
	class Slotmachine {
      file = "Custom\Slotmachine";
			class slotSpin {};
			class slotmachine {};
    };

	class Housing {
		file = "core\housing";
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
		file = "core\items";
		class bankalarmsound {};
		class blastingCharge {};
		class boltcutter {};
		class defuseKit {};
		class drinkbeer {};
		class drinkmoonshine {};
		class drinkwhiskey {};
		class flashbang {};
		class jerryRefuel {};
		class lockpick {};
		class placedefinestorage {};
		class placestorageBig {};
		class placestorageSmall {};
		class spikeStrip {};
		class storageBoxBig {};
		class storageBoxSmall {};
		class useMarihuana {};
		class CarAlarmSound {};
		class cprkit {};
		class morphine {};
		class suicideBomb {};
		class heroin {};
		class weed {};
		class lizak {};
	};

	class Kamery
	{
		file = "core\kamery";
		class kamera1 {};
		class kamera2 {};
		class kamera3 {};
		class kamera4 {};	
	};
	
	class Medical_System {
		file = "core\medical";
		class deathScreen {};
		class medicLights {};
		class medicLoadout {};
		class medicMarkers {};
		class medicRequest {};
		class medicSiren {};
		class medicSirenLights {};
		class newLifeRule {};
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class requestMedic {};
		class respawned {};
		class revived {};
		class revivePlayer {};
		class cprrevived {};
	};

	class Network {
		file = "core\functions\network";
		class broadcast {};
		class corpse {};
		class jumpFnc {};
		class say3D {};
		class setFuel {};
		class soundDevice {};
	};

	class Placeables {
		file = "core\placeable";
		class placeablesInit {};
	    class placeablesMenu {};
	    class placeablesRemove {};
	    class placeablesRemoveAll {};
	    class placeablePlace {};
	    class placeableCancel {};
	    class placeablesPlaceComplete {};
	};

	class Player_Menu {
		file = "core\pmenu";
		class altisPhone {};
		class cellphone {};
		class cellphone2 {};
		class giveItem {};
		class giveMoney {};
		class keyDrop {};
		class keyGive {};
		class keyMenu {};
		class movesMenu {};
		class p_openMenu {};
		class p_updateMenu {};
		class pardon {};
		class removeItem {};
		class s_onChar {};
		class s_onCheckedChange {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class useItem {};
		class wantedAddP {};
		class wantedInfo {};
		class wantedList {};
		class wantedMenu {};
	};
	
	class CellPhone {
		file = "core\cellphone";
		class cellPhoneCheck {};
		class setupCellPhone {};
		class messagesMenu {};
		class lbChanged {};
		class deleteMessage {};
		class replyMessage {};
	};

	class Shops	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class clothingFilter {};
		class clothingMenu {};
		class fuelLBchange {};
		class fuelStatOpen {};
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
		class virt_sellAll {};
		class blackjack {};  //BlackJack
        class BJbet {};  //BlackJack
        class BJhit {};  //BlackJack
        class BJstay {};  //BlackJack
	};

	class Vehicle {
		file = "core\vehicle";
		class addVehicle2Chain {};
		class blinkerInit {};
		class blinkerLeft {};
		class blinkerRight {};
		class blinkerWarn {};
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
		class vehTakeAllItem {};
		class vehStoreAllItem {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vInteractionMenu {};
	};
};
