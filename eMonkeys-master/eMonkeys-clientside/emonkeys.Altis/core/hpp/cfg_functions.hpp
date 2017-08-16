class CfgFunctions
{
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
			class syncData2 {};
			class updatePartial {};
		};
	};

	class EMonkeys_Client_Core
	{
		tag = "EMonkeys";
		class Master_Directory
		{
			file = "core";
			class setupActions {};
			class setupEVH {};
		};
		
		class Admin
		{
			file = "core\emonkeys\admin";
			class admininfo {};
			class adminid {};
			class admingetID {};
			class adminMenu {};
			class adminQuery {};
			class admintp {};
			class admintpmap {};
			class admintptome {};
			class admin {};
			class restart {};
			class event1 {};
			class ban {};
		};
		
		class Medical_Client
		{
			file = "core\emonkeys\medical\client";
			class onPlayerKilled {};
			class onPlayerKilled2 {};
			class onPlayerRespawn {};
			class setdefveriable {};
			class death_effect {};
			class aftermath {};
			class requestMedic {};
			class medicRequest {};
			class hdm {};
			class revive {};
			class bandage {};
			class medSysMenu {};
		};
		
		class Madic
		{
			file = "core\emonkeys\medical\mad";
			class medicSiren {};
			class medMarkers {};
			class medicMarkers {};
			class madcash {};
			class medsiren2 {};
		};
		 
		class Actions
		{
			file = "core\actions";
			class buyLicense {};
			class repairTruck {};
			class catchFish {};
			class catchTurtle {};
			class dpFinish {};
			class dropFishingNet {};
			class getDPMission {};
			class postBail {};
			class processAction {};
			class arrestAction {};
			class escortAction {};
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
			class sellTurtle {};
			class sellGoldBars {};
			class surrender {};
			class rechargeBattery {};
		};
		
		class Config
		{
			file = "core\config";
			class licensePrice {};
			class vehicleListCfg {};
			class licenseType {};
			class eatFood {};
			class eatDrink {};
			class varHandle {};
			class varToStr {};
			class itemWeight {};
			class virt_shops {};
			class vehShopLicenses {};
			class vehicleAnimate {};
			class weaponShopCfg {};
			class vehicleColorCraftCfg {};
			
			//Clothing Store Configs
			class clothing_cop {};
			class clothing_bruce {};
			class clothing_reb {};
			class clothing_dive {};
			class clothing_kart {};
			class clothing_VIP {};
			class clothing_feuerwehr {};
			class clothing_ap {};
			class clothing_gruppe {};
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
			class p_UpdatePlayer {};
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
			class updatePlayerMenu {};
		};
		
		class Functions
		{
			file = "core\functions";
			class calWeightDiff {};
			class fetchCfgDetails {};
			class handleInv {};
			class hudSetup {};
			class hudUpdate {};
			class fetchGear{};
			class tazeSound {};
			class animSync {};
			class simDisable {};
			class keyHandler {};
			class dropItems {};
			class numberText {};
			class handleItem {};
			class accType {};
			class receiveItem {};
			class giveDiff {};
			class receiveMoney {};
			class clearVehicleAmmo {};
			class pullOutVeh {};
			class nearUnits {};
			class actionKeyHandler {};
			class playerCount {};
			class isnumeric {};
			class onTakeItem {};
			class fetchVehInfo {};
			class onFired {};
			class revealObjects {};
			class inventoryOpened {};
			class isUIDActive {};			
			class resetspeedblock {};
		};
		
		class Network
		{
			file = "core\functions\network";
			class broadcast {};
			class MP {};
			class corpse {};
			class soundDevice {};
			class setFuel {};
			class setTexture {};
			class say3D {};
			class vehicleActions {};
		};
		
		class Civilian
		{
			file = "core\civilian";
			class jailMe {};
			class jail {};
			class tazed {};
			class civFetchGear {};
			class civLoadGear {};
			class knockedOut {};
			class knockoutAction {};
			class robReceive {};
			class robPerson {};
			class removeLicenses {};
			class demoChargeTimer {};
		};
		
		class Vehicle
		{
			file = "core\vehicle";
			class colorVehicle {};
			class lockVehicle {};
			class vehicleOwners {};
			class vehStoreItem {};
			class vehTakeItem {};
			class vehInventory {};
			class vehicleWeight {};
			class deviceMine {};
			class addVehicle2Chain {};
			class deviceJet {};
		};


		class Gangs
		{
			file = "core\gangs";
			class createGang {};
			class gangBrowser {};
			class gangManagement {};
			class gangMenu {};
			class joinGang {};
			class kickGang {};
			class leaveGang {};
			class setGangLeader {};
			class lockGang {};
			class unlockGang {};
		};
		
		class Shops
		{
			file = "core\shops";
			class atmMenu {};
			class buyClothes {};
			class changeClothes {};
			class clothingMenu {};
			class clothingFilter {};
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
			class fuelCanFull {};
			class flashbang {};
			class boltcutter {};
			class blastingCharge {};
			class defuseKit {};
			class axtUse {};
			class pumpeUse {};
			class Ohropax {};
		};
		
		class Dialog_Controls
		{
			file = "core\function";
			class setMapPosition {};
			class displayHandler {};
			class spawnConfirm {};
			class spawnMenu {};
			class spawnPointCfg {};
			class spawnPointSelected {};
			class progressBar {};
			class progressBar_loading {};
			class bankDeposit {};
			class bankWithdraw {};
			class bankTransfer {};
			class safeInventory {};
			class safeOpen {};
			class safeTake {};
			class safeFix {};
			class calldialog {};
			class sendChannel {};
			class updateDialogText {};	
		};
		
		class Market
		{
			file = "core\eMonkeys\market";
			
			class boerse {};
			class marketGetPrice {};
			class boerse_menu {};
			class boerseLBChange {};
		};	
		
		class House
		{
			file = "core\house";
			//class houseSleep;
			
			//class houseSetupMapMarker;
			//class houseIsOwnedByPlayer;
			
			//House Actions
			//Actions are calling DATA PIPELINE
			class houseMenu {};
			class buyHouse {};
			class sellHouse {};
			class housesleep {};
			class houseInventory {};
			class houseSearch {};
			class houseImpound {};
			
			//Non PIPELINE actions
			//Are not called by pipeline
			class houseGarage_Park {};
			class houseGarage_Open {};
			class houseAirGarage_Open {};
			class houseRefreshMarkers {};
			
			//Car inventory stuff
			class houseInventory_count {};
			class houseInventory_store {};
			class houseInventory_take {};
			class houseInventory_refresh {};
			class houseInventory_apply {};
			
			//House Data Pipeline
			class houseRequestCommand {}; //Request to @life-server command
			class houseExecCommand {}; //Executed from @life-server, parses input command
			
			//House Data Pipeline Execs
			class execHouseMenu {};
			class execBuyHouse {};
			class execSellHouse {};
			class exechousesleep {};
			class execHouseInventory {};
			class execHouseInventory_apply {};
			class execHouseSearch {};
			class execHouseImpound {};
			
			//Utils
			class houseExtractData {}; //Returns usable data array
			class houseExtractDataVal {}; //Gets one value of data array
			class houseBelongsToPlayer {};
			
			//inuse
			class houseIsInuse {};
			class houseSetInuse {};
			
			//House Inventory Upgrade system
			class houseUseFurniture {};
			class execHouseUseFurniture {};
		
			//House Key stuff
			class houseOpenKeyDialog {};
			class houseGiveKey {};
			class houseResetKeys {};
			class houseExecGiveKey {};
			class houseExecResetKeys {};	
			class houseCanAccess {}; //if player can access
			class open_house_inventory {};
		};

		class Permsys
		{
			file = "core\eMonkeys\permsys";
			class permLevel;
			class permGetLevel;
			class permLevelName;
			class permSetLevel;
			class permRule;
			class permRuleG;
			class permconfiguration;	
			class perms;
			class permManager;
			class permManager_update;		
			class permManager_requestData;
			class permManager_gotData;
			class permManager_updateData;
			class permManager_uiMode;
			class permManager_refreshList;
			class permManager_set;
			class dynPermUpdate;
			class dynPermCheckout;
			class permManager_Aktualisieren;
		};
		
		class slotMachine
		{
			file = "core\emonkeys\slotmachine";
			class slotmachine {};
			class slotSpin {};
		};
		
		class cellphone
		{
			file = "core\eMonkeys\cellphone_extended";
			class callCellPhone {};
			class cellex_open {};
			class cellex_sendClick {};
			class cellex_sendClick_last {};
			class cellex_lastcontacts {};
		};
		
		class Emp
		{
			file = "core\eMonkeys\emp";
			class empHit {};
			class empWarning {};
		};
		
		class copmarke
		{
			file = "core\eMonkeys\copmarke";
			class copLicenseShown {};
			class copShowLicense {};
		};
		
		class drogen
		{
			file = "core\eMonkeys\drogen";
			class cocaineUse {};
			class drugtestAction {};
			class extinguishJoint {};
			class weaknessEffects {};
			class weedSmoke {};
			class weedUse {};
			class informa {};
		};
		
		class onTake
		{
			file = "core\eMonkeys\onTake";
			class onTake {};
			class onTakePutBackItem {};
		};
		
		class interaction
		{
			file = "core\eMonkeys\interaction";
			class menu_pInteractionCiv {};
			class menu_pInteractionCop {};
			class menu_vInteraction {};
			class menu_fInteraction {};
			class menu_hInteraction {};
			class restrainActionciv {};
			class restrainciv {};
			class TorturePlayer {};
			class tortured {};
			class unrestrainciv {};
			class putInCarciv {};
			class stopEscortingciv {};
			class escortActionciv {};
			class pulloutActionciv {};
			class bagUseAction {};
			class pluendern {};
		};
		
		class packup
		{
			file = "core\eMonkeys\packup";
			class mauer {};
			class packupmauer {};
			class Kegel {};
			class packupkegel {};
		};

		class alcohol
		{
			file = "core\eMonkeys\alcohol";
			class drinkbeer {};
			class drinkmoonshine {};
			class drinkwhiskey {};
			class breathalyzer {};
		};

		class ausweis_client
		{
			file = "core\eMonkeys\ausweis";
			class ausweisstatus {};
			class ausweisver {};
			class ausweiserstellen {};
			class ausweiserstellendialog {};
			class ausweisloeschen {};
			class ausweis {};
			class ausweismein {};
			class ausweiscom {};
			class ausweischangepass {};
			class ausweiscomforce{};
			class ausweiscomforceback {};
			class invisible {};
			
			class licenseShow {};
			class licenseShown {};
		};
		
		class craft_client
		{
			file = "core\eMonkeys\craft";
			class craftAction {};
			class craftCfg {};
			class craft {};
			class craft_update {};
			class craft_updateFilter {};
			class craftitems {};
		};

		class kiste_inv
		{
			file = "core\eMonkeys\kiste";
			class kisteopenInventory {};
			class kisteStoreItem {};
			class kisteTakeItem {};
			class kisteInventory {};
			class blastingChargekiste {};
			class demoChargeTimerkiste {};
		};

		class paintball
		{
			file = "core\eMonkeys\paintball";
			class pb_response {};
			class ryn_message {};
			class paintball_scoreboard {};
		};
		
		class gather
		{
			file = "core\eMonkeys\gather";
			class gather {};
			class gatherSystem {};
			class gathermine {};
			class gathertrash {};
			class test1 {};
		};
		
		class Lottoclient
		{
			file = "core\eMonkeys\Lotto";
			class lotto_add {};
			class lotto_response {};

		};
		
		class Damagesystem
		{
			file = "core\eMonkeys\damagesystem";
			class damage_add {};
			class handleDamage {};
			class heal {};
			class healme {};
			class healex {};
			class healHospital {};
			class healexmed {};
		};
		
		class Lights
		{
			file = "core\eMonkeys\lights";
			class copLights {};
			class medicLights {};
			class medicSirenLights {};
			class sirenLights {};
			class addlight {};
		};
		
		class Cop
		{
			file = "core\cop";
			
			class loadGear {};
			class saveGear {};
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
			class ticketPaid {};
			class copSiren2 {};
		};
		
		class IgiLoad
		{
			file = "core\emonkeys\IgiLoad";
			class igiload_Cargo_Para {};
			class igiload_config {};
			class igiload_Create_And_Attach {};
			class igiload_Do_Load {};
			class igiload_Do_Unload {};
			class igiload_GetCargoMass {};
			class igiload_GetDefaultMass {};
			class igiload_GetOut {};
			class igiload_Init_Box {};
			class igiload_Init_Veh {};
			class igiload_Move_Attach {};
			class igiload_Rotate {};
			class igiload_Server_SetDir {};
			class igiload_Server_SetMass {};
			class igiload_SetNewMass {};
			class IgiLoad_start {};
			class igiload_Vehicle_Chat {};
			class IgiLoadInit {};
		};
		
		class Fuelstation
		{
			file = "core\emonkeys\fuelstation";
			class initFuelAction {};
			class initFuelstation {};
			class leasedFuelstation {};
			class updateFuelstation {};
			class robFuelstationResetOwner {};
			class fuelstationInfo {};
			class fillTempestDevice {};
			class fuelstationAuctionMenu {};
			class fuelstationSetOffer {};
			class endOfFuelstationAuction {};
		};
		
		class VehicleShop
		{
			file = "core\emonkeys\vehicleshop";
			class VehicleShopMenu {};
			class VehicleShopBuy {};
			class switchVehicleShop {};
			class switchVehColorShop {};
			class zoomVehicleShop {};
			class closeVehicleShop {};
		};
		
		class VehicleGarage
		{
			file = "core\emonkeys\vehiclegarage";
			class vehicleGarageMenu {};
			class setupVehicleGarage {};
			class switchVehicleGarage {};
			class switchVehTypGarage {};
			class VehicleGarageParkout {};
		};
		
		class Other
		{
			file = "core\emonkeys";
			class arrestDialog_Arrest {};
			class copcash {};
			class coplevelcall {};
			class copMarkers {};
			class copOpener {};
			class copWarning {};
			class firstjoin {};
			class ImpoundItemMenu {};
			class impoundVehicle {};
			class playerLoadout {};	
			class seizeObjects {};
			class showArrestDialog {};
			class wanted2 {};
			class wantedadd2 {};
			class introCam {};
			class logoutCam {};
			class playerTags {};
			class speak {};
			class specialText {};
			class AAN {};
			class buyLicences_extended {};
			class setviplevel {};
			class blackboard {};
			class trunkOpenClose {};
			class pauseMenu {};
		};
	};
};
