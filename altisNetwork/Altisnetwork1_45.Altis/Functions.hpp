class Socket_Reciever {
    tag = "SOCK";
    class SQL_Socket {
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

	
    class Main_Menu
	{
		file = "core\mainmenu";
		class initMainMenu {};
		class continueGame {};
		class exitLobby {};
		class displayStats {};
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
	/*
	class vAH {
		file = "core\vAH";
		class vAH_load;
		class vAH_buy;
		class vAH_reciever;
		class vAH_loadInventory;
		class vAH_sell;
		class vAH_checkItem;
		class vAH_takeBack;
		class vAH_select;
	};
	*/
    class Actions {
        file = "core\actions";
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
        class medimpoundAction {};
        class mine {};
        class packupSpikes {};
        class pickupItem {};
        class pickupItem2 {};
        class pickupMoney {};
        class postBail {};
        class processAction {};
        class pulloutAction {};
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
		class robShops {};
        class robFed {};
		class ziptieAction {};
        class crushAction {};
        class playSound {};
        class collectWood {}; //Collect wood for smaller bail
		class collectPlanks {}; //Process for smaller bail
        class jaws {};
		class injectAction {};
		class craftAction {};
        class suicideBomb {}; // -- Added 10.4.17
        //class carC4 {}; // -- Added 11.4.17
    };

    class Nightclub {
		file = "core\nightclub";
		class nclights {};
		class ncLightsOn {};
		class ncstage {};
		class ncsmoke {};
		class ncflash {};
		class ncFlashOn {};
	};

	class jobs {
        file = "core\jobs";
        class Appraise {};
        class SearchWreck {};
        class TreasureHuntInit {};
        class TreasureHunt {};
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
		class adminFog {};
        class adminRevive {};
        class adminGear {};
    };

    class Custom {
        file = "core\Custom";
        class undercover {};
        class randomNameGenerator {};
        class radioCheck {};
        //class altgearsaving {};
    };

    class holy_help {
        file = "core\holy_help";
        class holy_bug;
        class holy_help;
    };

    class Civilian {
        file = "core\civilian";
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
		class handleDowned {};
        class demoChargeTimerBank {};
        class passeportCiv {};  
        //class civPasseport {};
		class zipTie {};
        //class civInteractionMenu {};
        //class civInteractionMenuZip {};
    };

    class Config {
        file = "core\config";
        class houseConfig {};
        class itemWeight {};
        class vehicleAnimate {};
        class vehicleWeightCfg {};
		class craftCfg {};
    };

    class Cop {
        file = "core\cop";
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
        class vehInvSeize {};
        class wantedGrab {};
		class copOpener {};
        class copEnter {};
        class copUniformUpdate {};
        class scrapVehicle {};
        class seizeMask {}; //new
        class seizeCommsPlayer {}; //new
        class seizeCommsAction {}; //new
        class seizeVehicle {}; //new
        class seizeVehicleCargo {}; //new
        class seizeMoneyAction {}; // -- Added 12.4.17
        class seizeMoney {}; // -- Added 12.4.17
        class radioCheck {}; //new
        class copRequestFunds {}; //new
        class showArrestDialog {}; //-- Added 21/3/17
        class arrestDialog_Arrest {}; //-- Added 21/3/17
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
        class safeInventoryBank {};
        class safeOpenBank {};
        class safeTakeBank {};
        //class licenseShopOpen {};//-- license Menu
		//class licenseShopUpdate {};//-- license Menu
    };

    class CopPlaceables	{  
	    file = "core\cop\placeables";  
	    class placeablesInit {};  
	    class placeablesMenu {};  
	    class placeablesRemoveAll {};
        class placeablesRemove {};
    	class placeablePlace {};  
    	class placeableCancel {};  
    	class placeablesPlaceComplete {};  
    };

    class CopLoadouts {  
	    file = "core\cop\loadouts";  
        class mxloadout {};
    };

    class Scripts
    {
        file = "core\Scripts";
		class statusBar {};
    };

    class Functions {
        file = "core\functions";
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
        class isDamaged {};
        class giveDiff {};
        class handleDamage {};
        class handleInv {};
        class handleItem {};
        class hideObj {};
        class hudSetup {};
        class hudUpdate {};
        class inventoryClosed {};
        class inventoryOpened {};
        class isUIDActive {};
        class keyHandler {};
        class loadDeadGear {};
        class loadGear {};
        class nearATM {};
        class nearestDoor {};
        class nearUnits {};
        class numberText {};
        class onFired {};
        class onTakeItem {};
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
        class stripDownPlayer {};
        class tazeSound {};
        class teleport {};
        class whereAmI {};
		class openEffect {};
		class hudUpdateWanted {};
		class loggedOut {};
        class seatbelt {};
        class pickupitems {};
        class speaking {};
        class purge {};
        class markers {};
        class phoneCall {};
        class phoneEnd {};
        class bankfast {};
        class seizeObjects {};
        class panicMarker {};
        class playerCount {};
        class paycheck {};
        class setupNPC{};
		class randomRound {};
		class playsound {};
        //class drawLine3D {};//-- New Added 
		//class drawText3D {};//-- New Added 
        class notification_system {}; //-- New Added 
    };

    class Gangs    {
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
        class gangIncome {}; 
        class areaCapture {};
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

    class Items {
        file = "core\items";
        class blastingCharge {};
        class boltcutter {};
        class defuseKit {};
        class flashbang {};
        class jerrycanRefuel {};
        class jerryRefuel {};
        class lockpick {};
        class placestorage {};
        class spikeStrip {};
        class storageBox {};
		class snapgun {};
		class GPSTracker {};
        class codeCracker {};
		class zipTieSound {};
		class morphine {};
        //class cprkit {};
        class panicButton {};
        class weed {};
		class alcohol {};
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
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class requestMedic {};
        class respawned {};
        class revived {};
        class revivePlayer {};
        class newLifeRule {};
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
        class dispatch {};
        class dispatchpanic {};
        class dispatchbank {};
    };

    class Player_Menu {
        file = "core\pmenu";
        class altisPhone {};
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
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
        class physicalPhone {};
        class cell_call {};
        class radioPhone {}
        //class showLicenses {};//-- Showing Errors Fix at a later date
    };

    class Shops    {
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
        class licenses {};
        class clothingFilterShop {};//-- New
    };

    class Vehicle {
        file = "core\vehicle";
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
        class civVInteractionMenu {};
        class medVInteractionMenu {};
        class vehTakeAllItem {};//-- Vehicle trunk
        class vehStoreAllItem {};//-- Vehicle trunk
        //class vehicleShopLBChange {};
    };
    
    class CivTieing {
		file = "core\civilian\CivTieing";
		class gagAction {};					
		class gagged {};
		class removeGagAction {};
		class tieing {};
		class tieingAction {};
		class tieingActionb {};
		class tieingb {};
		class untie {};
		class untieb {};
	};

	class autosave {
		file = "scripts\autosave";
		//class autoSaveInv {};
	};
};
