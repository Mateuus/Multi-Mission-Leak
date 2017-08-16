// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

class CfgFunctions {
    class XY_Client_Core {
        tag = "XY";

        class Master_Directory {
            file = "core";
            class setupActions {};
            class setupEVH {};
            class init {};
            class initCiv {};
            class initCop {};
            class initMedic {};
            class initTHW {};
            class initSurvival {};
        };

        class DB_Backend {
            file = "core\session";
            class requestReceived {};
            class dataQuery {};
            class insertPlayerInfo {};
            class updateRequest {};
            class syncData {};
            class updatePartial {};
        };

        class Medical_System {
            file = "core\medical";
            class onPlayerKilled {};
            class onPlayerRespawn {};
            class respawned {};
            class revivePlayer {};
            class revived {};
            class requestMedic {};
            class medicRequest {};
            class deathScreen {};
            class medicLoadout {};
        };

        class Actions {
            file = "core\actions";
            class buyLicense {};
            class healHospital {};
            class closeJail {};
            class pushVehicle {};
            class repairTruck {};
            class catchFish {};
            class dpFinish {};
            class dropFishingNet {};
            class getDPMission {};
            class postBail {};
            class processAction {};
            class arrestAction {};
            class escortAction {};
            class impoundAction {};
            class destroyAction {};
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
            class robShops {};
            class surrender {};
            class suicideBomb {};
            class takeOrgans {};
            class robATM {};
        };

        class Housing {
            file = "core\housing";
            class buyHouse {};
            class getBuildingPositions {};
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

        class Config {
            file = "core\config";
            class eatFood {};
            class vehicleAnimate {};
            class houseConfig {};
        };

        class Player_Menu {
            file = "core\pmenu";
            class wantedList {};
            class wantedInfo {};
            class wantedMenu {};
            class initWantedAdd {};
            class wantedAdd {};
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
            class settingsInit {};
            class smartphone {};
            class newMsg {};
            class showMsg {};
            class revokeLicense {};
        };

        class Functions {
            file = "core\functions";
            class calcWeightDiff {};
            class fetchCfgDetails {};
            class fadeSound {};
            class handleInv {};
            class updateHUD {};
            class toggleHUD {};
            class animSync {};
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
            class pullOutVeh {};
            class nearUnits {};
            class actionKeyHandler {};
            class playerCount {};
            class fetchDeadGear {};
            class loadDeadGear {};
            class isnumeric {};
            class onTakeItem {};
            class onPutItem {};
            class fetchVehInfo {};
            class spawnVehicle {};
            class pushObject {};
            class onFired {};
            class nearestDoor {};
            class inventoryClosed {};
            class inventoryOpened {};
            class isUIDActive {};
            class saveGear {};
            class loadGear {};
            class sidechat {};
            class stripDownPlayer {};
            class randomRound {};
            class ticketGive {};
            class ticketPrompt {};
            class isNumber {};
            class clientWireTransfer {};
            class index {};
            class moveIn {};
            class clientMessage {};
            class headBag {};
        };

        class Network {
            file = "core\functions\network";
            class broadcast {};
            class corpse {};
            class jumpFnc {};
        };

        class Civilian {
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
        };

        class Vehicle {
            file = "core\vehicle";
            class openInventory {};
            class lockVehicle {};
            class vehStoreItem {};
            class vehTakeItem {};
            class vehInventory {};
            class vehicleWeight {};
            class deviceMine {};
            class deviceProcess {};
            class addVehicle2Chain {};
        };

        class Helper {
            file = "core\helper";
            class reachablePlayers {};
            class itemConfig {};
            class vehicleConfig {};
            class colorConfig {};
            class initializeProcessor {};
            class initializeLicenseSeller {};
            class calculateWeight {};
            class updateTrunk {};
            class onlineUID {};
            class inUse {};
            class sourceConfig {};
            class pay {};
            class playerInfo {};
            class playerMasked {};
            class resetImpoundVars {};
            class getClothingStats {};
        };

        class Cop {
            file = "core\cop";
            class vehInvSearch {};
            class copSearch {};
            class bountyReceive {};
            class searchClient {};
            class restrain {};
            class radar {};
            class questionDealer {};
            class licenseCheck {};
            class repairDoor {};
            class doorAnimate {};
            class fedCamDisplay {};
            class copLoadout {};
            class showArrestDialog {};
            class arrestDialog_Arrest {};
            class copOpener {};
            class seizeObjects {};
        };

        class Gangs {
            file = "core\gangs";
            class initGang {};
            class createGang {};
            class gangCreated {};
            class gangMenu {};
            class gangInvite {};
            class gangDisbanded {};
            class gangKick {};
            class searchMyGang {};
        };

        class Shops {
            file = "core\shops";
            class atmMenu {};
            class buyClothes {};
            class changeClothes {};
            class clothingMenu {};
            class clothingFilter {};
            class vehicleShopMenu {};
            class vehicleShopLBChange {};
            class vehicleShopBuy {};
            class weaponShopMenu {};
            class weaponShopSelection {};
            class weaponShopBuySell {};
            class virtualShopBuy {};
            class virtualShopMenu {};
            class virtualShopUpdate {};
            class virtualShopSell {};
        };

        class Items {
            file = "core\items";
            class lockpick {};
            class spikeStrip {};
            class jerryRefuel {};
            class refuelFuelcan {};
            class flashbang {};
            class boltcutter {};
            class blastingCharge {};
            class defuseKit {};
            class storageBox {};
            class chiptune {};
            class radarwarner {};
            class tracker {};
            class useAlcohol {};
            class usePainkiller {};
            class useDrugs {};
        };

        class Dialog_Controls {
            file = "core\dialogs";
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
            class garageLBChange {};
            class safeInventory {};
            class safeOpen {};
            class safeTake {};
            class safeFix {};
            class vehicleGarage {};
        };

        class THW {
            file = "core\thw";
            class thwLoadout {};
        };

        class TaxiShopFunctions {
            file = "core\taxi";
            class taxiService {};
            class taxiPurchaseFare {};
        };

        class System {
            file = "core\system";
            class announceRestart {};
            class callTaxi {};
            class chipboost {};
            class mapMarkers {};
            class emergencyEquip {};
            class placeItem {};
            class vehicleColor {};
            class siren {};
            class ctfSiren {};
            class ctfCapture {};
            class receiveKey {};
            class flashLights {};
            class insureVehicle {};
            class insertOrgan {};
            class radioMessage {};
            class repaintMenu {};
            class repaintVehicle {};
            class refuel {};
            class lockdownVehicle {};
            class unlockMenu {};
            class unlockLBChange {};
            class onPause {};
            class houseInteractionMenu {};
            class playerInteractionMenu {};
            class vehicleInteractionMenu {};
            class speedtrapInteractionMenu {};
            class houseBought {};
            class houseSold {};
            class drugTest {};
            class showPassport {};
            class receiveKeychain {};
            class speedtrapFlash {};
            class playerNames {};
            class taxi {};
        };

        class Addons {
            file = "core\addons";
            class allergy {};
            class autosave {};
            class briefing {};
            class emptyfuel {};
            class equipCarrier {};
            class disableThermal {};
            class illness {};
            class noside {};
            class markerManager {};
            class market {};
            class paycheck {};
            class playerMarkers {};
            class racingSupport {};
            class radiation {};
            class refuelSupport {};
            class safezone {};
            class speedtrap {};
            class spikestripEffect {};
            class snow {};
            class teargas {};
            class textures {};
            class welcome {};
        };

        class Market {
            file = "core\market";
            class openMarketView;
            class refreshMarketView;
            class marketUpdate;
        };

        class Special {
            file = "core\special";
            class openEmpMenu {};
            class scanVehicles {};
            class warnVehicle {};
            class empVehicle {};
            class vehicleWarned {};
            class vehicleEmpd {};
        };
    };
};