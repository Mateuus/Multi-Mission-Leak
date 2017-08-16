/*
	Filename: CfgFunctions.h

	http://www.loewenherz-projekt.de
*/
class CfgFunctions
{
	class FSM
	{
		tag = "LHM_fsm";
		class Main
		{
			file = "core\FSM";
			class client {ext = ".fsm";};
			class fuelMonitor {ext = ".fsm";};
			class player_monitor {ext = ".fsm";};
			class sirenLightsLoop {ext = ".fsm";};
			class sirenSoundLoop {ext = ".fsm";};
			class surrenderAnim {ext = ".fsm";};
			class settingsInit {ext = ".fsm";};
			class speedtrap {ext = ".fsm";};
			class survival {ext = ".fsm";};
			class checkUniform {ext = ".fsm";};
			class disease {ext = ".fsm";};
			class playerRestrained {ext = ".fsm";};
			class radar_small_open {ext = ".fsm";};
			class AWS {ext = ".fsm";};
		};
	};

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
			class playerStatUpdateRequest {};
		};
	};

	class KRON_Strings
	{
		tag = "KRON";
		class Functions
		{
			file = "core\functions\kron";
			//TO DO Kron Strings einfügen !
		};
	};

	class lhm_Client_Core
	{
		tag = "lhm";

		class Master_Directory
		{
			file = "core";
			//class setupActions {};
			class initCiv {};
			class initCop {};
			class initMedic {};
			class initSec {};
			class welcomeNotification {};
			class configuration {};
		};

		class Admin
		{
			file = "core\admin";
			class admininfo {};
			class adminid {};
			class admingetID {};
			class adminMenu {};
			class adminQuery {};
			class admin_wled_menu_open {};
			class admin_wlist {};
			class execute_code {};
			class init_scripting_console {};
			class update_dialog {};
			class new_admin_menu_build_dialog {};
			class new_admin_menu_mode_dbl_click {};
			class new_admin_menu_switch_event {};
			class new_admin_menu_refresh_players {};
			class new_admin_menu_switch_do {};
			class new_admin_menu_doCode {};
			class new_admin_menu_clearCode {};
			class new_admin_menu_save_Code {};
			class new_admin_menu_open_save_skript_menu {};
			class new_admin_menu_erase_code {};
			class new_admin_menu_exec_Code_custom {};
			class new_admin_menu_search_listbox {};
			class searchClient {};
			class searchPlayers {};
			class ClientSearched {};
			class searchAllClients {};
		};

		class Medical_System
		{
			file = "core\medical";
			class onPlayerKilled {};
			class onPlayerRespawn {};
			class respawned {};
			class revivePlayer {};
			class revived {};
			class revivednoFee {};
			class medicMarkers {};
			class requestMedic {};
			class medicRequest {};
			class deathScreen {};
			class medicLoadout {};
			class medInteractionMenu {};
			class packupcontainer {};
			class damageBleed {};
			class AWS_open_Menu {};
			class AWS_lbox_injuries_eventhandler {};
			class AWS_lbox_material_eventhandler {};
			class AWS_config {};
			class AWS_handleDamage {};
			class AWS_use_item {};
			class AWS_config_parsing {};
			class bulletHit {};
			class LoSCheck {};
			class medNpcCall {};
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
			class wallCam {};
			class surrender {};
			class sitDown {};
			class unlockVeh {};
			class takeOrgans {};
			class removeContainer {};
			class cutFinger {};
		};

		class Housing
		{
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
			class impoundPrice {};
			class itemWeight {};
			class taxRate {};
			class virt_shops {};
			class vehShopLicenses {};
			class vehicleAnimate {};
			class weaponShopCfg {};
			class copweaponShopCfg {};
			class secweaponShopCfg {};
			class vehicleWeightCfg {};
			class houseConfig {};
			class VehShopCameraConfig {};

			//Clothing Store Configs
			class clothing_sec {};
			class clothing_cop {};
			class clothing_bruce {};
			class clothing_reb {};
			class clothing_dive {};
			class clothing_kart {};

			// Level System
			class profType {};
			class profData {};
		};

		class BattleRoyale
		{
			file = "core\BattleRoyale";
			class brstartspawn {};
			class brendspawn {};
			class getEventBoxes{};
			class brdied{};
		};

		class static_base
		{
			file = "core\static_base";
			class base_build_dialog {};
			class base_conf {};
			class base_dialog_lb_evh{};
			class base_siren{};
			class opengatebase{};
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
			class removeItem {};
			class useItem {};
			class cellphone {};
			class keyMenu {};
			class keyGive {};
			class keyGiveGang {};
			class keyDrop {};
			class s_onSliderChange {};
			class updateViewDistance {};
			class settingsMenu {};
			class licenseDialog {};
			class hideMarkers {};
			class map_Marker_Menu {};
		};

		class Functions
		{
			file = "core\functions";
			class door {};
			class calWeightDiff {};
			class fetchCfgDetails {};
			class handleInv {};
			class hudSetup {};
			class hudUpdate {};
			class hudstaminaMonitor {};
			class hudDelete {};
			class hudsettings {};
			class hud_clockinit {};
			class hud_clockUpdate {};
			class tazeSound {};
			class animSync {};
			class simDisable {};
			class repairing {};
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
			class saveGearA3 {};
			class loadGear {};
			class stripDownPlayer {};
			class profSetUp {};
			class addExp {};
			class grabSkills {};
			class drinkmoonshine {};
			class drinkwhiskey {};
			class drinkbeer {};
			class breathalyzer {};
			class skyDiving {};
			class container {};
			class hasOrgan {};
			class hunger {};
			class trinken {};
			class captureArea {};
			class captureAreaCop {};
			class untowTruck {};
			class suicideBomb {};
			class serviceTruck {};
			class setObjDir {};
			class shutUpChannel {};
			class setPlayerPos {};
			class showhint {};
			class trigSafezone {};
			class gateAct {};
			class infoText {};
			class statusMsg {};
			class colorFilter {};
			class profTranslate {};
			class endMission {};
			class nearestObjects {};
			class removeMoney {};
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
			class enableSimulation {};
			class freeze {};
			class Marker {};
			class typeText2 {};
			class getMissionTask {};
			class removeMissionTask {};
			class removeAllMissionTasks {};
			class setMissionTask {};
			class hintMessage {};
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
			class mapMarkerplayer {};
			class civInteractionMenu {};
			class jailCombatlog {};
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
			class procMeth {};
			class addVehicle2Chain {};
			class trunk_anti_dupe {};
			class vInjectionMenu {};
			class upgradeCar {};
		};

		class Cop
		{
			file = "core\cop";
			class copMarkers {};
			class vehInvSearch {};
			class copSearch {};
			class bountyReceive {};
			class searchClientCOP {};
			class restrain {};
			class ticketGive {};
			class ticketPay {};
			class ticketPrompt {};
			class spikeStripEffect {};
			class radar {};
			class questionDealer {};
			class copInteractionMenu {};
			class licenseCheck {};
			class licensesRead {};
			class repairDoor {};
			class doorAnimate {};
			class fedCamDisplay {};
			class copLoadout {};
			class ticketPaid {};
			class seizeObjects {};
			class seizeWeapons {};
			class seizeWeaponsClient {};
			class copVehRadio {};
			class copRadio {};
			class poliHorn {};
			class freeCombatlogers {};
			class cop_classification_open {};
			class cop_classification_organize {};
			class cop_classification_update {};
			class cop_classification_assign {};
			class opportunities_dialog {};
			class cop_build_dialog_buy {};
			class cop_build_dialog_config {};
			class cop_build_dialog_demo {};
			class cop_build_dialog_open {};
			class cop_build_dialog_update {};
			class cop_build_truck_start {};
			class cop_build_truck_start1 {};
			class cop_build_choose {};
			class cop_build_object_options {};
			class cop_build_object_redeploy {};
			class cop_build_object_deleteALL {};
			class searchVehInj {};
			class containerInvSearch {};
			class cop_Radar_scan {};
			class cop_Radar_open_normal{};
			class cop_Radar_Lbox_eventhandler {};
			class cop_Radar_update {};
		};

		class Sec
		{
			file= "core\sec";
			class secLoadout {};
			class secMarkers {};
			class endtransporter {};
			class sec_build_truck_start {};
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
			class vehicleShopDemoSetTexture {};
			class circleVehicleShow {};
		};

		class Items
		{
			file = "core\items";
			class pickaxeUse {};
			class lockpick {};
			class spikeStrip {};
			class jerryRefuel {};
			class flashbang {};
			class boltcutter {};
			class blastingCharge {};
			class defuseKit {};
			class placedefinestorage {};
			class placestorage {};
			class storageBox {};
			class weed {};
			class tracker {};
			class card {};
			class protest {};
			class sensor {};
			class geocatch {};
			class towTruck {};
			class roadbarrier {};
			class roadcone {};
			class gatherWood {};
			class graffiti {};
		};

		class Dialog_Controls
		{
			file = "GUI\function";
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
			class ProfProgress {};
			class purgeHudUpdate {};
			class fadeSound {};
			class infoLBchanged {};
			class openInfoMenu {};
			class interactionChat {};
			class RANK_MENU_open {};
			class RANK_MENU_config {};
			class RANK_MENU_btn {};
			class RANK_MENU_evnthndl {};

		};

		class sirenLights
		{
			file = "core\sirene";
			class sirenLights {};
			class sirenLightsConfig {};
			class sirenLightsEx {};
			class sirenSoundEx {};
		};

		class lhNewsBroadcast
		{
			file = "core\lhNews";
			class lhNews_action {};
			class lhNews_receive {};
			class lhNews_Send {};
		};

		class TheHeist
		{
			file = "core\TheHeist";
			class bankGroupMenu {};
			class bankModeMenu {};
			class playerAddBank {};
			class GroupBankInvite {};
			class bankGroupAsked {};
			class bankKeyPadFnc {};
			class bombTimer {};
			class codeCompare {};
			class wireCompare {};
			class bankChatDialog {};
			class bankChatDialogMiddle {};
			class way_one_1 {};
			class terminal_open {};
			class terminal_input {};
			class way_one_2 {};
			class way_one_status {};
			class way_one_addaction {};
			class heist_setState {};
			class openlouisBox {};
			class way_two_1 {};
			class way_one_3 {};
			class way_one_4 {};
			class way_one_2_1 {};
			class openBankKeypad {};
			class way_one_5 {};
			class defuse {};
			class teamAcc {};
		};


		// Crafting System Inc, Ba
		class crafting
		{
			file = "core\crafting";
			class menu_fill {};
			class crafting_config {};
			class menu_combo_switched {};
			class lb_sel_changed {};
			class craft {};
		};


		class MP
		{
			file = "core\functions\mp";
			class MP {};
			class MPexec{};
		};


		class InitClient
		{
			file = "core\Init";
			class initPlayer;
			class preInit {preInit = 1;}; // start Client Init
			class postInit {postInit = 1;};
			class jip;
			class setupEVH {};
			class clientCleanup {};
			class resetStackedEVH {};
			class skipBriefing {};
			class loginCheck {};
			class clientDisconnect {};
			class clientValidator {};
			class spawningCam {};
			class movingText {};
			class initFirstSpawn {};
			class shipPath {};
			class finalCheckup {};
		};

		class Speedtrap
		{
			file = "core\speedtrap";
			class speedtrap {};
			class speedtrapGetPhotoList {};
			class speedtrapActivate {};
			class speedtrapSetSpeedLimit {};
			class speedtrapRemove {};
			class speedtrapAdd {};
			class trapped {};
			class trappedFlash {};
			class setSpeedtrapLimit {};
			class speedtrapHack {};
		};

		class Gambling
		{
			file = "core\casino";
			class gambling {};
			class gamble {};
			class gamble_timer {};
			class gamble_bandit {};
			class gamble_dice {};
			class gamblingSetJackpotVariable {};
			class gamblingWonJackpot {};
		};

		class fuelstations
		{
			file = "core\fuelstations";
			class fuelStationAddAction {};
			class fuelStationFill {};
			class fuelStationMenu {};
			class fuelStationSelect {};
			class fuelStationSliderChange {};
			class initFuelstations {};
			class vehFuelCap {};
			class robShops {};
			class LHM_stations_getMoney {};
			class LHM_stations_station_buy {};
			class LHM_stations_station_capture {};
			class LHM_stations_station_cop_recapture {};
			class LHM_stations_station_Menu_listbox_eventhandler {};
			class LHM_stations_station_Menu_sell_Station {};
			class LHM_stations_station_Menu_setPrice_BTN {};
			class LHM_stations_station_robbery {};
			class LHM_stations_station_Menu {};
			class LHM_stations_station_Menu_slider_eventhandler {};
		};

		class smartphone
		{
			file = "core\smartphone";
			class newMsg {};
			class showMsg {};
			class smartphone {};
			class centerMsg{};
		};

		class vehrepaint
		{
			file = "core\vehrepaint";
			class Repaintcolor {};
			class RepaintMenu {};
			class RepaintVehicle {};
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

		class buffs
		{
			file = "core\buffs";
			class run_buff_target {};
			class cop_nanobots {};
			class cop_adrenalin {};
			class cop_SoylentGreenBuff {};
			class civ_nanobots {};
			class civ_adrenalin {};
			class civ_SoylentGreenBuff {};
			class cop_Satellite {};
			class cop_SatphoneLogin {};
			class cop_SatphoneTake {};
			class cop_SatphoneKill {};
			class fader {};
		};

		class court
		{
			file = "core\court";
			class courtask {};
			class courtStartMe {};
			class courtPort {};
			class courtDecide {};
			class startcourtCop {};
			class convictedList {};
		};

		class ecosystem
		{
			file = "core\economic";
			class marketBuy {};
			class marketChange {};
			class marketgetBuyPrice {};
			class marketgetPriceRow {};
			class marketGetRow {};
			class marketGetSellPrice {};
			class marketReset {};
			class marketSell {};
			class marketsetPriceRow {};
			class marketShortView {};
			class openMarketView {};
			class randomRound {};
			class refreshMarketView {};
		};


	};

	class VAS
	{
		tag = "VAS";
		class functions
		{
			file = "addons\admin_menu\Admin_Menu_Scripts\VAS\functions";
			class onRespawn {};
			class deleteGear {};
			class loadoutInfo {};
			class loadGear {};
			class saveGear {};
			class SaveLoad {};
			class details {};
			class removeGear {};
			class addGear {};
			class handleItem {};
			class filterShow {};
			class filterMenu {};
			class fetchCfg {};
			class fetchCfgDetails {};
			class buildConfig {};
			class filter {};
			class fetchPlayerGear {};
			class mainDisplay {};
			class playerDisplay {};
			class accType {};
			class openDetails {};
			class closeDetails {};
			class quickMag {};
			class quickItem {};
			class qRemoveItem {};
			//class mainInit {preInit = 1;};
			class mainInit {};
			class KRON_StrLeft {};
			class KRON_StrToArray {};
			class accPrompt {};
			class quickAddDrag {};
			class updateLoad {};
			class transferMenu {};
			class transferAction {};
			class transferNetwork {};
			class transferSaveMenu {};
			class transferSaveGear {};
			class VASP {};
			class quickAttachment {};
			class accList {};
		};
	};

	class VVS
	{
		tag = "VVS";
		class functions
		{
			file = "addons\admin_menu\Admin_Menu_Scripts\VVS\functions";
			class openVVS {};
			//class mainInit {postInit = 1;};
			class mainInit {};
			class buildCfg {};
			class cfgInfo {};
			class mainDisplay {};
			class filterList {};
			class filterType {};
			class spawnVehicle {};
			class checkBox {};
		};
	};

	class client_basebuild
	{
		tag = "build";
		class LHM_BuildDialogScripts
		{
			file = "core\build";
			class initDialog {};
			class onLbChanged {};
			class updateDialog {};
			class initAdminDialog {};
			class buttonAction {};


		};
	};

	class vehicle_exam
	{
		TAG = "vehexam";
		class vehexam
		{
			file = "core\vehexam";
			class setup {};
			class addAction {};
			class addActionClient {};
			class hint {};
			class hintClient {};
			class begin {};
			class finish {};
			class get {};
			class set {};
			class eject {};
			class ejectClient {};
			class licenseExamSuccess {};
		};
	};
};