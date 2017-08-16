class CfgFunctions 
{
	#include "..\maverick\maverick_functions_master.cpp"
	
	class Socket_Reciever
	{
		tag = "SOCK";
		class SQL_Socket
		{
			file = "Functions\session";
			class requestReceived {};
			class dataQuery {};
			class insertPlayerInfo {};
			class updateRequest {};
			class syncData {};
			class updatePartial {};
		};
	};

	class Maverick_Convoy {
		tag = "mav_convoy";
		class functions {
			file = "maverick\convoy-sidemission";
			class attackMe {};
			class startConvoy {};
			class move {};
			class follow {};
			class attack {};
			class dropLoot {};
			class createMarker {};
			class removal {};
			class addTriggerHandlers {};
			class giveUnitLoadout {};
			class checkUnit {};
		};
	};

	class ES_Client_Functions
	{
		tag = "ES";
		
		class Master_Directory
		{
			file = "Functions";
			class setupActions {};
			class setupEVH {};
			class initCiv {};
			class initCop {};
			class initMedic {};
			class postInit {postInit = 1;};
			class survival {};
			class jip {};
		};
		
		class hacking
		 {
			file = "Functions\HackTheBank";
			class hackthebank {};
			class fedCamHacked {};
			class lappi {};
			class packupLappi {};
			class randomRound {};
			class initHTB {};
		 };
	
		class Medical_System
		{
			file = "Functions\medical";
			class onPlayerRespawn {};
			class respawned {};
			class revived {};
			class medicMarkers {};
			class medicMarkersMed {};
			class requestMedic {};
			class medicRequest {};
			class deathScreen {};
			class medicLoadout {};
			class medicSirenLights {};
			class medicLights {};
			class medicSiren {};
			class painkiller {};
			class openMedipad {};
			class deadBloodEffect {};
			class MedicInfo {};	
			class medilogSubmit {};
			class FeuerwehrInteractionMenu {};
			class feuerloescher {};
			class medLicenseShown {};
			class medShowLicense {};
			class medHupe {};
			class medSkinDialog {};
			class medSkin {};
		};
		
		class DynMarket
	    {
	        file = "Functions\DynMarket";
	        class bought {};
	        class update {};
	        class DisplayPrices {};
	        class LoadIntoListbox {};
	        class ForcePrice {};
	        class DYNMARKET_getPrice {};
	    };
		
		class Paintball
		{
			file = "Functions\paintball";
			class pb_response {};
		};
	
		class Actions
		{
			file = "Functions\actions";
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
			class takeOrgans {};
			class surrender {};
			class robShops {};
			class robShops2 {};
			class shopState {};
			class packuptape {};
			class packupbarriere {};
			class packuppylone {};
			class packupschranke {};
			class packuplicht {};
			class seizeObjects {};
			class usetobacco {};
			class Action {};
		};
		
		class Housing
		{
			file = "Functions\housing";
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
			class garageRefund {};
		};
	
		class Config
		{
			file = "Functions\config";
			class itemWeight {};
			class taxRate {};
			class vehicleAnimate {};
			class weaponShopCfg {};
			class vehicleWeightCfg {};
			class houseConfig {};
			class introCam {};
			class abortAction {};
			class Status_Bar {};
			class fadeSound {};
		};

		class Player_Menu
		{
			file = "Functions\pmenu";
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
			class keyDrop {};
			class s_onSliderChange {};
			class updateViewDistance {};
			class settingsMenu {};
			class s_onChar {};
			class s_onCheckedChange {};
			class wantedadd2 {};
			class wanted2 {};
			class p_prisionbreak {};
		};
	
		class Functions
		{
			file = "Functions\functions";
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
			class ryn_message {};
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
			class loadGear {};
			class stripDownPlayer {};
			class nearATM {};
			class updateClothing {};
			class globalsound {};
			class globalSoundClient {};
			class ShowIconTalk {};
			class getPlayer {};
			class IgiLoad {};
			class IgiLoadInit {};
			class IgiLoadciv {};
			class IgiLoadcivInit {};
			class nearestObjects {};
			class PlayerGetOut {};
			class drug_rauch {};
			class flashbang {};
			class sortlist {};
			class sortlist_cell {};
			class sortlist_wanted {};
			class sortlist_wantedadd {};
			class sortlistbank {};
			class sirens {};
			class prisionbreak {};		
			class progressBaren {};
		};
		
		class Network
		{
			file = "Functions\functions\network";
			class broadcast {};
			class MP {};
			class MPexec {};
			class corpse {};
			class jumpFnc {};
			class soundDevice {};
			class setFuel {};
			class setTexture {};
			class say3D {};
			class KRON {};
			class Briefing {};
		};
		
		class Civilian
		{
			file = "Functions\civilian";
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
			class hasOrgan {};
			class civInteractionMenu {};
			class freezePlayer {};
			class civAusweis {};
			class colorClothesMenu {};	
			class civShow {};	
			class lights_athira {};
			class lights_kavala {};
			class lights_pyrgos {};
			class lights_sofia {};
			class axeUse {};
			class SKsirene {};
		};

		class Vehicle
		{
			file = "Functions\vehicle";
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
			class FuelStatOpen {};
			class FuelLBchange {};
			class FuelRefuelcar {};
		};
		
		class Cop
		{
			file = "Functions\cop";
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
			class copSiren3 {};
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
			class ticketPaid {};
			class breathalyzer {};
			class copOpener {};
			class seizeObjects {};			
			class seizePlayerWeapon {};
			class seizePlayerWeaponAction {};
			class copEnter {};
			class teargas {};
			class radarCam {};
			class copLicenseShown {};
			class copShowLicense {};
			class copSkinSwitch {};
			class pagermenu {};
			class pagerliste {};
			class setpager {};
		};
		
		class Gangs
		{
			file = "Functions\gangs";
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
			file = "Functions\shops";
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
			class BJbet {};
			class BJhit {};
			class BJstay {};
			class blackjack {};
			class slotmachine {};
			class slotSpin {};
		};
		
		class Items
		{
			file = "Functions\items";
			class pickaxeUse {};
			class lockpick {};
			class spikeStrip {};
			class jerryRefuel {};
			class boltcutter {};
			class blastingCharge {};
			class defuseKit {};
			class storageBox {};
			class drinkbeer {};
			class drinkmoonshine {};
			class drinkwhiskey {};
			class akkuschrauber {};
			class AkkuschrauberSound {};
			class CarAlarmSound {};				
			class barriere {};
			class licht {};
			class tape {};
			class pylone {};
			class schranke {};
			class head {};
			class gpsTracker {};		
			class weed {};
			class pilze {};
			class koks {};
			class hero {};
			class rasenm {};
			class blindfold {};
			class speedbomb {};
			class turbol {};
			class perle {};
		};
		
		class Blindfold
		{
			file = "Functions\Blindfold";
			class blindfoldAction {};
			class blindfoldOff {};
			class blindfoldActionOff {};
		};
		
		class Special
		{
			file = "Functions\special";
			class openEmpMenu {};
			class isEmpOperator {};
			class scanVehicles {};
			class warnVehicle {};
			class empVehicle {};
			class vehicleWarned {};
			class vehicleEmpd {};
		};
		
		class Dialog_Controls
		{
			file = "dialog\function";
			class setMapPosition {};
			class displayHandler {};
			class spawnConfirm {};
			class spawnMenu {};
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
			class gangWithdraw {};
			class wireTransfer {};
			class vShopCam {};
			class changeCar {};
			class interactionMenuOpen {};
		};
	};
};