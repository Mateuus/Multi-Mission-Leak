class GTA
{
  tag = "GTA";
  class functions
  {
    file = "core\functions\gta";
    class abort {};
    class action {};
    class autoSave;
    class boundingCollision {};
    class broadcast {};
    class buildingPositions {};
    class call { ext = ".fsm"; };
    class cameraView {};
    class chatMessage {};
    class cleanupObject {};
    class colorCorrections {};
    class colorRGBtoHTML {};
    class compile {};
    class const {};
    class cursorTarget {};
    class damage {};
    class enableSimulation {};
    class faction {};
    class functionsReceived {};
    class getConstant {};
    class hasDLC {};
    class hospitalHeal {};
    class isCop {};
    class isHATO {};
    class isInputBlocked {};
    class isKindOf {};
    class isMedic {};
    class isMilitary {};
    class isMonthlySale {};
    class listPlayers {};
    class log {};
    class objectID {};
    class onPause {};
    class ordinalSuffix {};
    class param {};
    class payManager { ext = ".fsm"; };
    class playerEffects {};
    class playSound {};
    class prefixUserMarker {};
    class repackMagazines {};
    class restrain {};
    class rollDice {};
    class say3D {};
    class selectList {};
    class selectPlayer {};
    class setConstant {};
    class setOwner {};
    class setVariable {};
    class simulationManager { ext = ".fsm"; };
    class survival {};
    class switchMove {};
    class sync {};
    class tase {};
    class timeManager { ext = ".fsm"; };
    class unitByUID {};
    class vehicleIcon {};
    class voiceCheck {};
    class zoneTrigger {};
  };

  class init
  {
    file = "core\functions\gta\init";
    class initActions {};
    class initCivilian {};
    class initCop {};
    class initEventHandlers {};
    class initHATO {};
    class initMedic {};
    class initMilitary {};
    class initPlayer {};
  };

  class revive
  {
    file = "core\functions\gta\revive";
    class reviveBleedOut {};
    class reviveEffects {};
    class reviveInit { postInit = 1; };
    class reviveNotification {};
    class reviveOnKilled {};
    class reviveOnRespawn {};
    class reviveSetStatus {};
    class reviveStatus {};
    class reviveTransfuseBlood {};
    class reviveUnit {};
  };

  class perks
  {
    file = "core\functions\gta\perks";
    class cannibaliseCorpse {};
  };

  class processing
  {
    file = "core\functions\gta\processing";
    class hasProcessingMats {};
    class process {};
    class setupProcessor {};
  };

  class licenses
  {
    file = "core\functions\gta\licenses";
    class buyLicense {};
    class hasLicense {};
    class licenseLevel {};
    class licenseShop {};
  };

  class sectors
  {
    file = "core\functions\gta\sectors";
    class captureSector {};
    class getSectorLogic {};
    class ownsSector {};
    class isSectorCapturing {};
    class sectorOwnerName {};
  };

  class banks
  {
    file = "core\functions\gta\banks";
    class bankCanDrill {};
    class bankCanSteal {};
    class bankLaunderMoney {};
    class bankLockVault {};
    class bankName {};
    class bankSetupSafe {};
    class banksInit { postInit = 1; };
    class bankStealMoney {};
    class bankStealSafe {};
    class bankZone {};
  };

  class units
  {
    file = "core\functions\gta\units";
    class allPlayers {};
    class getDefaultAnim {};
    class hasGPS {};
    class isMasked {};
    class isPersonTurret {};
    class nearbyUnits {};
    class setUnitTextures {};
    class setupNPC {};
    class unitDisableFire {};
  };

  class buildings
  {
    file = "core\functions\gta\buildings";
    class nearestBuilding {};
    class nearestDoor {};
  };

  class money
  {
    file = "core\functions\gta\money";
    class receiveMoney {};
    class sendMoney {};
  };

  class gathering
  {
    file = "core\functions\gta\gathering";
    class gather {};
    class gatherWood {};
  };

  class messaging
  {
    file = "core\functions\gta\messaging";
    class messageTypeName {};
    class messagingInit { preInit = 1; };
    class receiveMessage {};
    class selectMessageType {};
    class sendMessage {};
  };

  class virtualInventory
  {
    file = "core\functions\gta\virtualInventory";
    class addVirtualItem {};
    class canAddVirtualItem {};
    class hasVirtualItem {};
    class isVirtualItemLegal {};
    class refreshVirtualInventoryMaxLoad {};
    class removeVirtualItem {};
    class virtualInventoryContainerMaxLoad {};
    class virtualInventoryInit { postInit = 1; };
    class virtualInventoryWeight {};
    class virtualItemCount {};
    class virtualItemWeight {};
  };

  class items
  {
    file = "core\functions\gta\items";
    class illegalItemValue {};
    class itemBoltcutter {};
    class itemDrill {};
    class itemLockpick {};
  };

  class settings
  {
    file = "core\functions\gta\settings";
    class getSetting {};
    class setSetting {};
    class settingsInit { preInit = 1; };
  };

  class actions
  {
    file = "core\functions\gta\actions";
    class actionChairSit {};
    class actionChairStand {};
    class searchPlayer {};
    class seizeCommunications {};
    class seizeMask {};
    class seizeMoney {};
    class seizeWeapons {};
  };

  class player
  {
    file = "core\functions\gta\player";
    class insertPlayer {};
    class playerReceived {};
    class queryPlayer {};
    class updatePlayer {};
    class updatePlayerPartial {};
  };

  class vehicles
  {
    file = "core\functions\gta\vehicles";
    class clearVehicleCargo {};
    class crushVehicle {};
    class deleteVehicleCrew {};
    class disarmVehicle {};
    class ejectVehicleCrew {};
    class ejectVehicleUnit {};
    class impoundVehicle {};
    class repairVehicle {};
    class resetVehicleVector {};
    class seizeVehicleCargo {};
    class unflipVehicle {};
    class vehicleAlarm {};
    class vehicleEmergencyLights {};
    class vehicleEventHandlers {};
    class vehicleSiren {};
    class vehicleSync {};
  };

  class arrays
  {
    file = "core\functions\gta\arrays";
    class arrayAddKey {};
    class arrayGetKeyValue {};
    class arrayHasKey {};
    class arrayRemoveKey {};
    class arraySetKeyValue {};
    class arrayValidKey {};
    class conditionalSelect {};
    class indexElements {};
    class nestedIndex {};
    class toPairs {};
  };

  class strings
  {
    file = "core\functions\gta\strings";
    class inString {};
    class isNumeric {};
    class numberToString {};
  };

  class geometry
  {
    file = "core\functions\gta\geometry";
    class getPos3D {};
    class locationDescription {};
    class nearestPosition {};
    class nearestTown {};
    class position {};
  };

  class housing
  {
    file = "core\functions\gta\housing";
    class searchHouse {};
    class upgradeHouseLocks {};
  };

  class inventory
  {
    file = "core\functions\gta\inventory";
    class loadInventory {};
    class loadoutCivilian {};
    class loadoutCop {};
    class loadoutHATO {};
    class loadoutMedic {};
    class loadoutMilitary {};
    class loadoutPlayer {};
    class saveInventory {};
  };

  class interaction
  {
    file = "core\functions\gta\interaction";
    class getInteractions {};
    class interact {};
    class interactionsBuild {};
    class interactionsHouse {};
    class interactionsMan {};
    class interactionsVehicle {};
  };

  class gui
  {
    file = "core\functions\gta\gui";
    class closeAllDisplays {};
    class closeDisplay {};
    class createRscLayer {};
    class ctrlSetScaleFade {};
    class destroyRscLayer {};
    class getDisplay {};
    class getMiniMap {};
    class hasDisplay {};
    class initDisplay {};
    class initDisplays { preInit = 1; };
    class mapDrawIcons {};
    class mapIcons {};
    class nameTags {};
    class welcome {};
  };

  class session
  {
    file = "core\functions\gta\session";
    class registerSession {};
    class sessionExecServer {};
    class validateSession {};
  };

  class local
  {
    file = "core\functions\gta\local";
    class disableUserInput {};
    class immune {};
    class neutral {};
  };

  class mp
  {
    file = "core\functions\gta\mp";
    class initMP { postInit = 1; };
    class MP {};
    class MPexec {};
    class remoteExec {};
  };

  class admin
  {
    file = "core\functions\gta\admin";
    class adminBan {};
    class adminFreeze {};
    class adminKick {};
    class initAdmin { preInit = 1; postInit = 1; };
    class isAdmin {};
  };

  class events
  {
    file = "core\functions\gta\events";
    class onAction {};
    class onFired {};
    class onFiredNear {};
    class onHandleDamage {};
    class onHandleHeal {};
    class onInventoryClosed {};
    class onInventoryOpened {};
    class onKeyDown {};
    class onKeyUp {};
    class onKilled {};
    class onNextAction {};
    class onPrevAction {};
    class onPut {};
    class onTake {};
    class onWeaponAssembled {};
    class onWeaponDisassembled {};
  };

  class build
  {
    file = "core\functions\gta\build";
    class buildDismantle {};
    class buildGuide {};
    class buildPlace {};
    class buildSign {};
  };

  class spawn
  {
    file = "core\functions\gta\spawn";
    class selectSpawn {};
    class spawnPoints {};
  };

  class world
  {
    file = "core\functions\gta\world";
    class atmPositions {};
    class setupATM {};
    class setupTrader {};
    class worldInit {preInit = 1; postInit = 1;};
  };

  class worldevents
  {
    file = "core\functions\gta\worldevents";
    class treasureHuntCollect {};
    class treasureHuntSetup {};
  };
};

class Life_Client_Core
{
  tag = "life";

  class Actions
  {
    file = "core\actions";
    class catchFish {};
    class catchTurtle {};
    class dpFinish {};
    class dropFishingNet {};
    class escortAction {};
    class getDPMission {};
    class gtaArrestAction {};
    class packupSpikes {};
    class pickupItem {};
    class pickupMoney {};
    class postBail {};
    class pulloutAction {};
    class pushVehicle {};
    class putInCar {};
    class robAction {};
    class robShops {};
    class searchVehAction {};
    class sellTurtle {};
    class serviceChopper {};
    class stopEscorting {};
    class storeVehicle {};
    class surrender {};
    class ticketAction {};

  };

  class Housing
  {
    file = "core\housing";
    class buyHouse {};
    class copHouseOwner {};
    class getBuildingPositions {};
    class initHouses {};
    class lightHouse {};
    class lightHouseAction {};
    class lockHouse {};
    class lockupHouse {};
    class sellHouse {};
  };

  class Config
  {
    file = "core\config";
    class clothing_advreb {};
    class clothing_bounty {};
    class clothing_bruce {};
    class clothing_cop {};
    class clothing_cop_air {};
    class clothing_cop_safe {};
    class clothing_cop_training {};
    class clothing_dive {};
    class clothing_hato {};
    class clothing_heli {};
    class clothing_jet {};
    class clothing_kart {};
    class clothing_medic {};
    class clothing_mil {};
    class clothing_mil_air {};
    class clothing_press {};
    class clothing_reb {};
    class clothing_sru {};
    class clothing_taxi {};
    class copDefault {};
    class eatFood {};
    class houseConfig {};
    class impoundPrice {};
    class itemWeight {};
    class licensePrice {};
    class licenseType {};
    class taxRate {};
    class varHandle {};
    class varToStr {};
    class vehicleAnimate {};
    class vehicleColorCfg {};
    class vehicleColorStr {};
    class vehicleListCfg {};
    class vehicleWeightCfg {};
    class vehShopLicenses {};
    class virt_shops {};
    class weaponShopCfg {};
  };

  class Player_Menu
  {
    file = "core\pmenu";
    class giveItem {};
    class giveMoney {};
    class keyDrop {};
    class keyGive {};
    class keyMenu {};
    class marketItemInfo {};
    class p_openMenu {};
    class p_updateMenu {};
    class pardon {};
    class removeItem {};
    class settingsMenu {};
    class useItem {};
    class wantedInfo {};
    class wantedList {};
    class wantedMenu {};
  };

  class Functions
  {
    file = "core\functions";
    class accType {};
    class animSync {};
    class calWeightDiff {};
    class dropItems {};
    class fetchCfgDetails {};
    class fetchDeadGear {};
    class fetchGear{};
    class fetchVehInfo {};
    class garageRefund {};
    class giveDiff {};
    class handleInv {};
    class handleItem {};
    class isnumeric {};
    class isUIDActive {};
    class loadDeadGear {};
    class nearUnits {};
    class numberText {};
    class onFired {};
    class onTakeItem {};
    class playerCount {};
    class playSound {};
    class pullOutVeh {};
    class pushObject {};
    class receiveItem {};
    class snow {};
  };

  class Network
  {
    file = "core\functions\network";
    class broadcast {};
    class setFuel {};
    class soundDevice {};
  };

  class Civilian
  {
    file = "core\civilian";
    class bountyArrest {};
    class civFetchGear {};
    class civLoadGear {};
    class gtaJail {};
    class jailMe {};
    class knockedOut {};
    class knockoutAction {};
    class removeLicenses {};
    class robPerson {};
    class robReceive {};
    class waterChargeTimer {};
  };

  class Vehicle
  {
    file = "core\vehicle";
    class addVehicle2Chain {};
    class colorVehicle {};
    class deviceMine {};
    class lockVehicle {};
    class openInventory {};
    class vehicleOwners {};
    class vehicleWeight {};
    class vehInventory {};
    class vehStoreItem {};
    class vehTakeItem {};
  };

  class Cop
  {
    file = "core\cop";
    class bountyReceive {};
    class breathalyzer {};
    class fedCamDisplay {};
    class licenseCheck {};
    class licensesRead {};
    class questionDealer {};
    class saveGear {};
    class spikeStripEffect {};
    class ticketGive {};
    class ticketPaid {};
    class ticketPay {};
    class ticketPrompt {};
  };

  class Gangs
  {
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

  class Shops
  {
    file = "core\shops";
    class addSubtract;
    class atmMenu {};
    class buyClothes {};
    class changeClothes {};
    class chopShopMenu {};
    class chopShopSelection {};
    class chopShopSell {};
    class clothingFilter {};
    class clothingMenu {};
    class vehicleShopBuy {};
    class vehicleShopLBChange {};
    class vehicleShopMenu {};
    class virt_buy {};
    class virt_menu {};
    class virt_sell {};
    class virt_update {};
    class weaponShopBuySell {};
    class weaponShopFilter {};
    class weaponShopMenu {};
    class weaponShopSelection {};
  };

  class Items
  {
    file = "core\items";
    class drinkbeer {};
    class drinkmoonshine {};
    class drinkwhiskey {};
    class jerryRefuel {};
    class pickaxeUse {};
    class spikeStrip {};
    class storageBox {};
    class team_blue {};
    class team_red {};
    class underwaterCharge {};
    class weed {};
  };

  class Dialog_Controls
  {
    file = "dialog\function";
    class bankDeposit {};
    class bankTransfer {};
    class bankWithdraw {};
    class displayHandler {};
    class gangDeposit {};
    class garageLBChange {};
    class impoundMenu {};
    class progressBar {};
    class sellGarage {};
    class setMapPosition {};
    class unimpound {};
    class vehicleGarage {};
  };

  class Casino
  {
    file = "core\casino";
    class slotOpen {};
    class slotPlay {};
    class slotReward {};
  };
};
