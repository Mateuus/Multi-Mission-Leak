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
		class initMedic {};
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
		class adminTeleport {};
		class adminFreeze {};
		class adminTpHere {};
		class adminMarkers {};
		class adminGodMode {};
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
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class medicHorn {};
		class medicPhaser {};
		class newLifeRule {}; //Repentz
	};

	class CopPlaceables
	{
    file = "core\cop\roadblock";
    class placeablesInit {};
    class placeablesMenu {};
    class placeablesRemoveAll {};
    class placeablePlace {};
    class placeableCancel {};
    class placeablesPlaceComplete {};
  	class facinit {};
  };

	class Actions
	{
		file = "core\actions";
		class AntiSpam {};
		class AntiSpam2 {};
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
		class processRaw {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class ziptieAction {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupItem2 {};
		class pickupMoney {};;
		class ticketAction {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class gather {};
		class gutAnimal {};
		class getTruckMission {};
		class TruckFinish {};
		class surrender {};
		class playSound {};
		class suicideDeadman {};
		class suicideBomb {};
		class movesMenu {};
		class craftAction {};
		class extinguishJoint {};
		class drugtestAction {};
	};

	class DynMarket
	{
			file = "core\DynMarket";
			class bought {};
			class update {};
			class DisplayPrices {};
			class LoadIntoListbox {};
			class ForcePrice {};
			class DYNMARKET_getPrice {};
	};

	class Housing
	{
		file = "core\housing";
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
		file = "core\config";
		class itemWeight {};
		class taxRate {};
		class vehicleAnimate {};
		class vehicleWeightCfg {};
		class craftCfg {}; //Repentz
		class varHandle {};
		class varToStr {};
		class expConfig {};
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
		class craft {}; //Repentz
		class craft_update {};//Repentz
		class craft_updateFilter {};//Repentz
		class licenses {};//Repentz
		class money {};//Repentz
		class inventory {};
		class smartphone {};
		class newMsg {};
		class showMsg {};
	};

	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class callThisDialog {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class NLR {};
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
		class fuelUsage {};
		class fadeSound {};
	  class purge {};
		class terror {};
		class jaws {};
		class globalSound {};
		class globalSoundClient {};
		class nearestSound {};
		class autoSave {};
		class armaNetworkHello {};
		class levelUp {};
		class weaknessEffects {};
		class ancolors {};
		class confirmPlayer {};
		class weedSmoke {};
		class unFlip {};
	};

	class Atm
	{
		file = "core\atm";
		class atmMenu {};
		class gangTransactions {};
		class withdraw {};
		class deposit {};
		class wireTransfer {};
		class wireTransfered {};
		class withdrawQuick {};
		class depositQuick {};
		class quickDeposit {};
		class quickWithdraw {};
	};

	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class addAction {};
		class MP {};
		class MPexec {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
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
		class freezePlayer {};
		class storeMarkers {};
		class dixie {};
		class skyDive {};
		class civInteractionMenu {};
		class helicrashTimer {};
		class prisonWallTimer {};
		class ziptie {};
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
		class deviceOil {};
		class addVehicle2Chain {};
	};

	class Cop
	{
		file = "core\cop";
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
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class removeWeaponActionCiv {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class wantedGrab {};
		class natoQM {};
		class copWoop {};
		class copPhaser {};
		class removeWeaponAction{};
		class stripSearch{};
		class breathalyzer {};
		class backupCall {};
		class callbackup {};
		class copOpener {};
	};

	class Gangs
	{
		file = "core\gang";
		class gangInit {};
		class gangInfoReceived {};
		class gangLeader {};
		class gangLeave {};
		class gangUpgrade {};
		class gangKick {};
		class gangKicked {};
		class gangNewLeader {};
		class gangInvitePlayer{};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangCreate {};
		class gangCreated {};
		class gangMenu {};
		class gangRankPlayer {};
	};

	class Shops
	{
		file = "core\shops";
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
		class pickaxeUse {};
		class chainsawUse {};
		class lockpick {};
		class spikeStrip {};
		class roadCone {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class cocaine {};
		class heroin {};
		class mushrooms {};
		class weed {};
		class meth {};
		class wallCharge {};
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
		class EvolvedNews {};
		class safeInvHeliGold {};
		class heligoldTake {};
		class safeHeliGold {};
		class skillLearn {};
		class skillMenu	{};
		class skillInfo {};
		class loadOptions {};
		class prisonFix {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
	};
};
