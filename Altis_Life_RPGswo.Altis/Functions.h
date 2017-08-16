class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket // sortiert
	{
		file = "core\session";
		class dataQuery {};
		class insertPlayerInfo {};
		class requestReceived {};
//		class sessionMenu {}; // muss nicht in function stehen
		class syncData {};
		class syncHacker {};
		class updatePartial {};
		class updateRequest {};
//		class updateVars {}; // muss nicht in function stehen
		class saveSettings {};
	};
};

class DW_Addons
{
	tag = "DW";
	class A3W_fpsFix
	{
		file = "core\addons\fpsFix";
		class loopSpread {};
		class vehicleManager {};
		class vehicleManagerEventCode {};
		class vehicleManagerInit {};
	};
/*
	class DW_waterEdge
	{
		file = "core\addons\water_edge";
		class water_edge {};
	};
*/

};

class CLAY_Addons
{
	tag = "CLAY";
	class CLAY_carRadio
	{

		file = "core\addons\CLAY_CarRadio";
		class controls {};
		class display {};
		class editor {};
		class initCarRadio {};
		class lbdrop {};
		class play {};
		class playlist {};
		class radio {};
		class settings {};
	};
};


class DWF_Functions
{
	tag = "DWF";
	class LSFunctions
	{
		file = "core\functions\ls_functions.sqf";
		class clientMessage {};
		class clientGangKick {};
		class clientGangLeft {};
		class clientGangLeader {};
		class clientGetKey {};
		class clientWireTransfer {};
		class index {};
		class isnumber {};
		class player_query {};
		class sideChat {};
		class switchMove {};
		class clientueber {};
	};
};



class DWEV_Client_Core
{
	tag = "DWEV";

	class Master_Directory // sortiert
	{
		file = "core";
//		class configuration {}; // muss nicht in function stehen
		class initCiv {};
		class initCop {};
		class initMedic {};
		class initOpfor {};
		class setupActions {};
		class setupEVH {};
		class initObjects {};
//		class welcomeCredits {}; // muss nicht in function stehen
		class welcomeNotification {};
//		class init {}; // muss nicht in function stehen
//		class init_survival {}; // muss nicht in function stehen
//		class jip {}; // muss nicht in function stehen
	};

	class Markt // sortiert
	{
		file = "core\markt";
		class marktMenu {};
		class marktQuery {};
		class openMarktMenu {};
	};

	class Admin // sortiert
	{
		file = "core\admin";
		//class adminBan {};
		class admingetID {};
		class adminid {};
		class admininfo {};
		class adminKick {};
		class adminkickaction {};
		class adminMenu {};
		class adminQuery {};
		class gucken {};
	};

	class Special // sortiert
	{
		file = "core\special";
		class empVehicle {};
		class isEmpOperator {};
		class moveBack {};
		class npcInit {};
		class objectInit {};
		class objectInitASL {};
		class openEmpMenu {};
		class painballArena {};
		class painballHitConfirmed {};
		class painballLeafLobby {};
		class painballLobby {};
		class painballSelectSide {};
		class paintballLeafArena {};
		class paintballOutOfArena {};
		class Repaintcolor {};
		class RepaintMenu {};
		class RepaintVehicle {};
		class scanVehicles {};
		class vehicleEmpd {};
		class vehicleWarned {};
		class warnVehicle {};
		class traingas {};
		class magicfinger {};
		class handleFired {};
		class increaseFuel {};
		class getHitPoints {};
		class handleVehDamage {};
		class handleSound {};
		class handleVehRepair {};
		class placeRandom {};
		class sensorLoop {};
		class sideChannelWarn {};
		class Lizenzsehen {};
        class Lizenzzeigen {};
        class FSzeigen {};
		class playerInteractionMenu {};
		class adventslose {};
		class adventsloseask {};
		class bugReport {};
		class speedBreakes {};
		class nlrMarker {};
		class isInNlrRange {};
		class getNlrLockTime {};
		class takeDrugs {};
	};

	class Medical_System // sortiert
	{
		file = "core\medical";
		class deathScreen {};
		class medicLights {};
		class medicLoadout {};
		class medicMarkers {};
		class medicRequest {};
		class medicSiren {};
		class medicSirenLights {};
		class medMarkers {};
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class requestMedic {};
		class respawned {};
		class revived {};
		class revivePlayer {};
		class ticketmeGive {};
		class ticketmePaid {}; // muss nicht zwingend drin stehen
		class ticketmePay {};
		class ticketmePrompt {};
	};

	class Opfor
	{
		file = "core\Opfor";
		class opforLoadout {};
		class opforMarkers {};
		class ticketopforGive {};
		class ticketopforPaid {}; // muss nicht zwingend drin stehen
		class ticketopforPay {};
		class ticketopforPrompt {};
		class opforInteractionMenu {};
	};

	class Actions // sortiert
	{
		file = "core\actions";
		class arrestAction {};
		class bankState {};
		class boostNitro {};
		class buyLicense {};
		class captureHideout {};
		class captureIllegalTrading {};
		class catchFish {};
		class craftAction {};
		class doSitdown {};
		class doStandup {};
		class dpFinish {};
		class dropFishingNet {};
		class escortAction {};
		class gather {};
		class getDPMission {};
		class giveOrgans {};
		class healHospital {};
		class impoundAction {};
		class mine {};
		class opencraftMenu {};
		class packupSpikes {};
		class pickupItem {};
		class pickupMoney {};
		class postBail {};
		class pulloutAction {};
		class putInCar {};
		class removeCommunication {};
		class restrainAction {};
		class robAction {};
		class robBanks {};
		class robBanks2 {};
		class robShops {};
		class robShops2 {};
		class searchAction {};
		class searchVehAction {};
		class sellLicense {};
		class serviceChopper {};
		class shopState {};
		class stopEscorting {};
		class storeVehicle {};
		class storeVehicleStadt {};
		class surrender {};
		class takeOrgans {};
		class text {};
		class ticketAction {};
		class ticketActionRad {};
		class ticketmeAction {};
		class ticketopforAction {};
		class unrestrain {};
		class emergencyEject {};
		class forceOpenParachute {};
		class openParachute {};
		class boostNitrov2 {};
	};

	class Housing // sortiert
	{
		file = "core\housing";
		class buyHouse {};
		class copBreakDoor {};
		class copHouseOwner {};
		class getBuildingPositions {};
		class houseMenu {};
		class houseContainerMenu {};
		class initHouses {};
		class lightHouse {};
		class lightHouseAction {};
		class lockHouse {};
		class lockupHouse {};
		class raidHouse {};
		class sellHouse {};
		class secureHouse {};
		class webcamHouse {};
		class HouseAlarm {};
		class storageBox {};
		class HouseMarker {};
		class moveContainer {};
	};


	class Config // sortiert
	{
		file = "core\config";
		class craftCfg {};
		class eatFood {};
		class houseConfig {};
		class impoundPrice {};
		class itemWeight {};
		class shopMenus {}; // wird nicht genutz
		class taxRate {};
		class vehicleAnimate {};
		class vehicleWeightCfg {};
		class processCfg {};
	};

	class Player_Menu // sortiert
	{
		file = "core\pmenu";
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
		class giveItem {};
		class giveMoney {};
		class keyDrop {};
		class keyGive {};
		class keyMenu {};
		class newMsg {};
		class p_openMenu {};
		class p_updateMenu {};
		class pardon {};
		class removeItem {};
		class revokeLicense {};
		class lizenzgeben {};
		class s_onSliderChange {};
		class settingsInit {};
		class settingsMenu {};
		class showMsg {};
		class showfwz {};
		class smartphone {};
		class smartphoneSearch {};
		class fwzentral {};
		class fwzentral_init {};
		class ezstatus {};
		class fwedit {};
		class updateViewDistance {};
		class useItem {};
		class wanted2 {};
		class wantedadd2 {};
		class wantedInfo {};
		class wantedList {};
		class wantedMenu {};
//		class player_sys {}; // muss nicht in function stehen
		class InfoLinks {};
		class tabletbutton {};
	};
	
	class Placeables 
	{
		file = "core\placeables";
		 class placeablesInit {};
		 class medicPlaceablesInit {};
		 class placeablesMenu {};
		 class placeablesRemoveAll {};
		 class placeablePlace {};
		 class placeableCancel {};
		 class placeablesPlaceComplete {};
	};

	class Functions // sortiert
	{
		file = "core\functions";
		class accType {};
		class whereAmI {};
		class actionKeyHandler {};
		class animSync {};
		class callTaxi {};
		class calWeightDiff {};
		class clearVehicleAmmo {};
		class dropItems {};
		class escInterupt {};
		class fadeSound {};
		class fetchCfgDetails {};
		class fetchDeadGear {};
		class fetchVehInfo {};
		class forcequit {};
		class giveDiff {};
		class globalSound {};
		class globalSoundClient {};
		class handleDamage {};
		class handlelnv {};
		class handleItem {};
		class holsterWeapon {};
//		class inString {}; // muss nicht in function stehen
		class inventoryClosed {};
		class inventoryOpened {};
		class isnumeric {};
		class isUIDActive {};
		class getActiveUIDplayer {};
		class keyHandler {};
		class loadDeadGear {};
		class loadGear {};
		class nearestDoor {};
		class nearUnits {};
		class numberText {};
		class onTakeItem {};
		class onPutItem {};
		class openInventory {};
		class playerCount {};
		class playerTags {};
		class pulloutVeh {};
		class pushObject {};
		class receiveItem {};
		class receiveMoney {};
		class repairTruck {};
		class revealObjects {};
		class saveGear {};
		class simDisable {};
		class tazeSound {};
		class isSafeZone {};
		class garageRefund {};
		class moveIn {};
		class doMove {};
		class setOwner {};
		class noTaxiZone {};
		class preRestart {};
		class equipTextures {};
		class formatTime {};
		class convertArmaRank {};
	};

	class Network // sortiert
	{
		file = "core\functions\network";
		class broadcast {};
		class corpse {};
		class jumpFnc {};
		class MP {};
		class MPexec {};
		class networkSetVar {};
		class say3D {};
		class setFuel {};
		class soundDevice {};
	};

	class Civilian // sortiert
	{
		file = "core\civilian";
		class civInteractionMenu {};
		class civLoadout {};
		class demoChargeTimer {};
		class handleDowned {};
		class hasOrgan {};
		class jail {};
		class jailMe {};
		class knockedOut {};
		class knockoutAction {};
		class koInteractionMenu {};
		class removeLicenses {};
		class robPerson {};
		class robReceive {};
		class tazed {};
		class carAlarm {};
	};

	class Vehicle // sortiert
	{
		file = "core\vehicle";
		class addVehicle2Chain {};
		class colorVehicle {};
		class deviceMine {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehicleWeight {};
		class vehInventory {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vInteractionMenu {};
		class disableAlarm {};
		class disableSperre {};
		class addAlarm {};
		class addSperre {};
	};

	class GasStation
	{
		file = "core\gasstation";
		class gasVehicleFillFuel {};
		class gasVehicleOpenStation {};
		class gasVehicleSelection {};
		class gasVehicleUpdate {};
		class gasCargoFillFuel {};
		class gasCargoOpenStation {};
		class gasCargoUpdate {};
		class initgasVehicle {};
		class gasCargoVehicleSelection {};
		class gasCargoVehicleOpenStation {};
		class gasCargoVehicleUpdate {};
		class gasCargoVehicleFillFuel {};
	};

	class Cop // sortiert
	{
		file = "core\cop";
		class arrestDialog_Arrest {};
		class bountyjail {};
		class bountyReceive {};
		class copInteractionMenu {};
		class copLights {};
		class copLoadout {};
		class copMarkers {};
		class copOpener {};
		class copSearch {};
		class copSiren {};
		class copSiren1 {};
		class copSiren2 {};
		class doorAnimate {};
		class fedCamDisplay {};
		class licenseCheck {};
		class licensesRead {};
		class alcoholCheck {};
		class alcoholRead {};
		class drugCheck {};
		class drugRead {};
		class questionDealer {};
		class radar {};
		class removeWeapon {};
		class removeWeaponBack {};
		class repairDoor {};
		class restrain {};
		class searchClient {};
		class searchClientGun {};
		class searchWeapon {};
		class seizeObjects {};
		class showArrestDialog {};
		class showClientGuns {};
		class sirenLights {};
		class sirenLights1 {};
		class spikeStripEffect {};
		class ticketGive {};
		class ticketPaid {};
		class ticketPay {};
		class ticketPrompt {};
		class vehInvSearch {};
		class backupCall {};
		class callbackup {};
	};

	class Gangs // sortiert
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
		class gangMarkers {};
		class gangMenu {};
		class gangNewLeader {};
		class gangUpgrade {};
		class initGang {};
		class gangSetPlayerRank {};
		class updateGangTag {};
	};

	class Shops // sortiert
	{
		file = "core\shops";
		class atmMenu {};
		class blackjack {};
		class BJbet {};
		class BJhit {};
		class BJstay {};
		class buyClothes {};
		class changeClothes {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class clothingFilter {};
		class clothingMenu {};
//		class impoundMenu{}; // muss nicht in function stehen
		class licenses {};
		class slotmachine {};
		class slotSpin {};
//		class unimpound{}; // muss nicht in function stehen
		class updateLicenses {};
		class vehicleShopBuy {};
		class vehicleShopLBChange {};
//		class vehicleShopControl {};
		class vehicleShopLBColorChange {};
		class vehicleShopMenu {};
		class virt_buy {};
		class virt_menu {};
		class virt_sell {};
		class virt_update {};
		class weaponShopAccs {};
		class weaponShopMags {};
		class weaponShopBuySell {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class levelCheck {};
	};

	class Items // sortiert
	{
		file = "core\items";
		class blastingCharge {};
		class boltcutter {};
		class defuseKit {};
		class jerryRefuel {};
		class lockpick {};
		class nos {};
		class spikeStrip {};
		class weed {};
		class hammer {};
		class nosv2 {};
		class useFlashlight {};
		class shovelUse {};
	};

	
	class verarbeiter // sortiert
	{
		file = "core\verarbeiter";
		class processAction {};
		class preprocess {};
	};

	
	class Auktionshaus // sortiert
	{
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
	
	class Personalausweis
	{
	file = "core\pmenu\perso";
	class perso_laden {};
	class persoCheck {};
	class persoCheck_aenderung {};
	class persoErgebnis {};
	class persoNeu {};
	class updateTag {};
	class updateTagA {};
	class updateMonat {};
	class updateMonatA {};
	class updateHsnr {};
	class updateHsnrA {};
	class updateStrasse {};
	class updateStrasseA {};
	class persoBeantragen {};
	class persoBeantragenAenderung {};
	class zeigePerso {};
	class updatePersoBild {};
	class updatePersoBildA {};
	class aenderePerso {};
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
		class sellGarage {};
		class bankDeposit {};
		class bankTransfer {};
		class bankWithdraw {};
		class garageLBChange {};
		class impoundMenu {};
		class unimpound {};
		class vehicleGarage {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class gangDeposit {};
		class gangWithdraw {};
		class stateWithdraw {};
		class taxiMenu {};
		class taxiPointCfg {};
		class taxiPointConfirm {};
		class taxiPointSelected {};
		class taxiMeter {};
		class taxiTurretAction {};
		class weaponfreeInfoMsg {};
		class openLotto {};
		class lottoButton {};
		class lottoCheckBox {};
		class lottoBill {};
		class lottoPay {};
		class lottoEdit {};
		class howMuch {};
	};
};