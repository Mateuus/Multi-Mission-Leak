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

class PlayGermany_Core
{
    tag = "PG";

    class PlayGermany
    {
        file = "core\PlayGermany";
        class lights {};
        class vehicleAddEVH {};
        class getInMan {};
        class getOutMan {};
        class teargas {};
        class lostMarker {};
        class showID {};
        class IDshown {};
        class skyDive {};
        class skySpawn {};
        class introCam {};
        class newbieIntro {};
		class countMedics {};
        class nearMedics {};
		class changeCar {};
		class vShopCam {};
		class clothing {};
		class initActions {};
		class pushBoat {};
		class showLicenses {};
		class schutzSirene {};
		class radio {};
        class useVehicleInsurance {};
        class abortAction {};
		class hideObject {};
		class lockCargo {};
		class gearLog {};
		class houseMarkers {};
		class taxameter {};
    };

    class RadioNetwork
    {
        file = "core\PlayGermany\Smartphone";
        class providerAvailable {};
        class providerNetworkAvailable {};
        class hackCell {};
        class buySim {};
        class deliverMessage {};
        class disableRadioCell {};
        class initSimCardSeller {};
        class receiveMessage {};
        class repairHackedCell {};
    };

    class Interactionmenus
    {
        file = "core\PlayGermany\Interactionmenus";

        //pInteraction
        class pInteraction_civ {};
        class pInteraction_cop {};
        class pInteraction_asf {};
        class pInteraction_hsd {};
        //vInteraction
        class vInteraction_cop {};
        class vInteraction_civ {};
        class vInteraction_asf {};
        class vInteraction_hsd {};
        //hInteraction
        class HInteraction_civ {};
        class HInteraction_cop {};
    };

    class Fuelstations
    {
        file = "core\PlayGermany\fuelstations";

        class fuelStationAddAction {};
        class fuelStationFill {};
        class fuelStationMenu {};
        class fuelStationSelect {};
        class fuelStationSliderChange {};
        class initFuelstations {};
        class vehFuelCap {};
        class vehicleFuelConsumer {};
    };
    
    class Placeables
	{
		file = "core\PlayGermany\placeables";
		class placeablesInit {};
		class placeablesMenu {};
		class placeablesRemoveAll {};
		class placeablePlace {};
		class placeableCancel {};
		class placeablesPlaceComplete {};
	};
    
    class crafting
	{
		file = "core\PlayGermany\crafting";
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
		class craftAction {};
		class craftCfg {};
	};
};

class King_Client_Core
{
   tag = "king";

    class Gambling
    {
        file = "core\PlayGermany\Gambling";
        class gambling {};
        class gamble {};
        class gamble_timer {};
        class gamble_bandit {};
        class gamble_dice {};
        class gamblingSetJackpotVariable {};
        class gamblingWonJackpot {};
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
        class initASF {};
        class initMedic {};
        class initZeus {};
        class welcomeNotification {};
        class survival {};
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
    };

    class Medical_System
    {
        file = "core\medical";
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class respawned {};
        class revivePlayer {};
        class revived {};
        class medicMarkers {};
        class requestMedic {};
        class medicRequest {};
        class deathScreen {};
        class medicLoadout {};
        class medicSiren {};
        class medicSiren2 {};
    };

    class Actions
    {
        file = "core\actions";
        class buyLicense {};
        class healHospital {};
        class pushVehicle {};
        class repairTruck {};
        class serviceChopper {};
        class catchFish {};
        class catchTurtle {};
        class dpFinish {};
        class dropFishingNet {};
        class getDPMission {};
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
        class storeVehicle {};
        class robAction {};
        class captureHideout {};
        class gather {};
        class gutAnimal {};
        class surrender {};
        class robSmartphoneAction {};
        class dynprocess {};
		class robShops {};
        class gateOpener {};
    };

    class Housing
    {
        file = "core\housing";
        class buyHouse {};
        class buyHouse2 {};
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
        class garageRefund {};
        class secureHouse {};
        class webcamHouse {};
    };

    class Config
    {
        file = "core\config";
        class itemWeight {};
        class taxRate {};
        class vehicleAnimate {};
        class vehicleWeightCfg {};
		class varToStr {};
    };

    class Player_Menu
    {
        file = "core\pmenu";
        class wantedList {};
        class wantedInfo {};
        class wantedMenu {};
        class wantedAddP {};
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
        class s_onSliderChange {};
        class updateViewDistance {};
        class settingsMenu {};
        class s_onChar {};
        class s_onCheckedChange {};
        class smartphone {};
        class smartphone_MSG {};
        class newMsg {};
        class showMsg {};
        class AAN {};
		class p_prisonbreak {};
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
        class simDisable {};
        class keyHandler {};
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
        class isUIDActiveCiv {};
        class saveGear {};
        class loadGear {};
        class stripDownPlayer {};
        class nearATM {};
        class infoBerufeLegal {};
        class infoBerufeIllegal {};
        class infoBerufeTier3 {};
        class infoTastenbelegung {};
        class slingloadon {};
        class slingloadoff {};
		class prisonbreak {};
    };

    class Network
    {
        file = "core\functions\network";
        class broadcast {};
        class MP {};
        class corpse {};
        class jumpFnc {};
        class soundDevice {};
        class setFuel {};
        class setTexture {};
        class globalSound {};
        class clientSound {};
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
        class handleDowned {};
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
        class vehicleWeight {};
        class deviceMine {};
        class addVehicle2Chain {};
    };

    class ASF
    {
        file = "core\asf";
        class asfMarkers {};
        class asfLoadout {};
    };

    class Cop
    {
        file = "core\cop";
        class copMarkers {};
        class vehInvSearch {};
        class copSearch {};
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
        class licenseCheck {};
        class licensesRead {};
        class repairDoor {};
        class doorAnimate {};
        class fedCamDisplay {};
        class copLoadout {};
        class ticketPaid {};
        class wantedGrab {};
        class copSiren2 {};
        class seizePlayerWeapon {};
        class seizePlayerWeaponAction {};
        class seizeObjects {};
        class copEnter {};
        class showArrestDialog {};
        class arrestDialog_Arrest {};
        class copOpenBank {};
		class drugtestAction {};
		class extinguishJoint {};
    };

    class emp
    {
        file = "core\emp";
        class openEmpMenu {};
        class isEmpOperator {};
        class scanVehicles {};
        class warnVehicle {};
        class empVehicle {};
        class vehicleWarned {};
        class vehicleEmpd {};
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
        class gangMarkers {};
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
        class usePickAxe {};
        class lockpick {};
        class spikeStrip {};
        class jerryRefuel {};
        class flashbang {};
        class boltcutter {};
        class blastingCharge {};
        class defuseKit {};
        class storageBox {};
        class handcuffkey {};
        class tracker {};
        class useAlkohol {};
        class useHeroin {};
        class useKokain {};
        class useKokain2{};
        class useMarihuana {};
        class useSBier {};
        class useSpirituosen {};
        class weedSmoke {};
        class speedBomb {};
        class roadBarrier {};
        class useShovel {}; //blaster added
        class useProspectiveTools {}; //blaster added
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
        class wireTransfer {};
        class sendChannel {};
        class refreshNear {};
    };

    class DynMarket
    {
        file = "core\DynMarket";
        class bought {};
        class update {};
        class DisplayPrices {};
        class LoadIntoListbox {};
        class ForcePrice {};
    };

	class ALGLackieren
	{
		file = "core\lackieren";

		class RepaintMenu;
		class Repaintcolor;
		class RepaintVehicle;
	};
};