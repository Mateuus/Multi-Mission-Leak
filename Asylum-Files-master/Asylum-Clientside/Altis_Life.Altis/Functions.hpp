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
		class initZeus {};
		class initMedic {};
	};

	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminMenu {};
		class adminQuery {};
		class shutdownMessage {};
	};

	class Talents
	{
		file = "core\talents";
		class talentInfo {};
		class talentMenu {};
		class addTalentRow {};
		class learnTalent {};
		class addExperience {};
		class respec {};
		class prestigeInfo {};
		class prestigeMenu {};
		class learnPrestige {};
		class addPrestigeRow {};
		class unlearnBH {};
	};

	class Politics
	{
		file = "core\politics";
		class candidate {};
		class candidates {};
		class runDialog {};
		class newCandidate {};
		class voteDialog {};
		class configChanged {};
	};

	class Actions
	{
		file = "core\actions";
		class chopTree {};
		class alcoholRecipes {};
		class mining {};
		class gatherObject {};
		class joinEvent {};
		class paroleAction {};
		class storageSell {};
		class placeOil {};
		class disarmAction {};
		class ch7Broadcast {};
		class surrender {};
		class blindfold {};
		class blindfoldRemove {};
		class zoneGather;
		class buyLottery {};
		class surrenderAction {};
		class buyLicense {};
		class stopBankVault {};
		class rehab {};
		class ropeLength {};
		class ropeTow {};
		class chemlightUse {};
		class openBankVault {};
		class useShank {};
		class turnedIn {};
		class openVault {};
		class openSafe {};
		class openGate {};
		class useRadio {};
		class heal {};
		class flip {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class serviceTruck {};
		class catchFish {};
		class catchTurtle {};
		class inventoryOpened {};
		class dpFinish {};
		class dropFishingNet {};
		class gatherAction {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class sellOil {};
		class suicideBomb {};
		class arrestAction {};
		class escortAction {};
		class placedObject {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrain {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class pumpRepair {};
		class packupSpikes {};
		class buyHouse {};
		class sellHouse {};
		class lockHouse {};
		class robVehicle {};
		class knockOut {};
		class placeStorage {};
		class moveItem {};
		class buy {};
		class robAction {};
		class robStoreAction {};
		class toggleActions {};
		class activateNitro {};
		class holsterWeapon {};
		class gatherOil {};
		class pickupOil {};
		class dropOil {};
		class translateOil {};
		class nonLethal {};
	};

	class Config
	{
		file = "core\config";
		class licensePrice {};
		class lootCrateItems {};
		class treasurePos {};
		class recipeDetail {};
		class itemDemand {};
		class housePrice {};
		class welcomeCredits {};
		class civDefault {};
		class houseContainers {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class vehicleWeight {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class copDefault {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class weaponAddons {};
		class swatGear {};
		class detectiveGear {};
		class recipes {};

		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_copdive {};
		class clothing_kart {};
		class clothing_faces {};
		class clothing_barber {};
	};

	class session
	{
		file = "core\session";
		class sessionSetup {};
		class sessionReceive {};
		class sessionUpdate {};
		class sessionUpdateCash {};
		class sessionCreate {};
		class syncData {};
		class battlEyeReceive {};
		class playerquery {};
		class reqsync {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class showMsg {};
		class donation {};
		class achievementMenu {};
		class achievementSel {};
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
		class market {};
		class marketSel {};
		class capture {};
		class captureSel {};
		class settingsMenu {};
		class settingsInit {};
		class clientGetKey {};
		class cell_textmsg {};
		class cell_textcop {};
		class cell_textemt {};
		class cell_textadmin {};
		class cell_adminmsg {};
		class cell_call {};
		class cell_adminmsgall {};
		class cell_requestTaxi {};
		class toggleRinger {};
		class inventory {};
		class money {};
		class licenses {};
		class weather {};
		class confirmGovPardon {};
		class confirmGovPardonEnd {};
		class spec {};
		class vis {};
		class tp {};
	};

	class Medical
	{
		file = "core\medical";
		class deathScreen {};
		class medicLoadout {};
		class medicMarkers {};
		class medicRequest {};
		class requestMedic {};
		class medicEnroute {};
		class medicRespond {};
		class medicRespondDone {};
		class respawned {};
		class revived {};
		class revivePlayer {};
		class setPain {};
		class brokenLeg {};
		class medicSiren {};
		class medicLights {};
	};

	class Functions
	{
		file = "core\functions";
		class addStatistic {};
		class endorse {};
		class setFace {};
		class inspectLootCrate {};
		class openLootCrate {};
		class showTreasure {};
		class dig {};
		class phoneCall {};
		class phoneEnd {};
		class holdItem {};
		class doRespawn {};
		class showBroadcast {};
		class achievementScan {};
		class achievementGrant {};
		class setTitle {};
		class execute {};
		class karaoke {};
		class playKaraoke {};
		class netSetVar {};
		class face {};
		class broadcast {};
		class index {};
		class isnumber {};
		class corpse {};
		class emote {};
		class bank_deposit {};
		class bank_withdraw {};
		class filterChat {};
		class parole {};
		class fetchVehInfo {};
		class pushFunction {};
		class crateAction {};
		class debitCard {};
		class setAggressive {};
		class disarmed {};
		class calTalents {};
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class actionUpdate {};
		class fetchGear{};
		class animSync {};
		class simDisable {};
		class keyDownHandler {};
		class keyUpHandler {};
		class mouseUpHandler {};
		class mouseDownHandler {};
		class dropItems {};
		class blindfolded {};
		class setUnconscious {};
		class handleDamage {};
		class handleDowned {};
		class handleTagged {};
		//class handleHeal {};
		class handleVehicleDamage {};
		class firedHandler {};
		class numberText {};
		class handleItem {};
		class accType {};
		class onDeath {};
		class onRespawn {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pulloutVeh {};
		class getBuildID {};
		class MP {};
		class MPexec {};
		class abortEnabled {};
		class handleFlashbang {};
		class createMarker {};
		class applyWeather {};
		class intro {};
		class jump {};
		class messenger {};
		class equipGear {};
		class receiveOwner {};
		class setUniform {};
		class playSound {};
		class setReturnValue {};
		class vehicleEnter {};
		class vehicleExit {};
		class vehicleGarage {};
		class storeVehicleGarage {};
		class getSpawnMarker {};
		class knockedOut {};
		class localChatMessage {};
		class uC {};
		class robSuccess {};
		class enableActions {};
		class forceJoinGroup {};
		class bank_transfer {};
		class bank_debit {};
		class clientMessage {};
		class clientWireTransfer {};
		class fedSuccess {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class nearUnits {};
		class playerCount {};
		class taxiRequest {};
		class fireEMP {};
		class disableVehicles {};
		class monitorGate {};
		class gateMonitorCheck {};
		class multiargMP {};
		class confirmMenu {};
		class inputMenu {};
		class handleAction {};
		class escortCheck {};
		class fireMode {};
		class notifyCop {};
	};

	class Civilian
	{
		file = "core\civilian";
		class jackpot {};
		class cocaineGather {};
		class drugRunner {};
		class policeRequired {};
		class jailMe {};
		class jail {};
		class trackAnimal {};
		class factory {};
		class huntingZone {};
		class gatherZone {};
		class craftRecipe {};
		class skinAnimal {};
		class prisonBreak {};
		class prisonBreaker {};
		class updateChopTask {};
		class skyDive {};
		class cookMeat {};
		class civFetchGear {};
		class civLoadGear {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class getBounty {};
		class setBounty {};
		class trackBounty {};
		class removeBounty {};
		class joinRace {};
		class raceWon {};
		class startRace {};
		class policeRecruit {};
		class requestTrial {};
		class jurySummons {};
		class juryRegister {};
		class trialJury {};
		class trialDefendant {};
		class initLaser {};
		class laserJoin {};
		class setGroupTrackMarker {};
	};

	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class turnSignal {};
		class vehicleOwners {};
		class vehicleDead {};
		class createVehicle {};
		class vehInventory {};
		class vehStoreItem {};
		class vehSwapItem {};
		class vehTakeItem {};
		class centerMass {};
		class trackMarkers {};
		class refuelVehicle {};
	};

	class Cop
	{
		file = "core\cop";
		class reGear {};
		class copEnter {};
		class copSplit {};
		class copLights {};
		class earnPrestige {};
		class addPrestige {};
		class loadGear {};
		class saveGear {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class ticketGive {};
		class charge {};
		class applyCharge {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class airhorn {};
		class playCopSiren {};
		class spikeStripEffect {};
		class radar {};
		class seizeObjects {};
		class seizePlayerIllegal {};
		class seizePlayerIllegalAction {};
		class checkCopGear {};
		class revokeLicence {};
		class revokeLicenceAction {};
		class impoundAction {};
		class initMartial {};
		class swatHeal {};
		class swatDeploy {};
		class swatDispatched {};
		class swatActivate {};
		class swatDeactivate {};
		class swatTerminate {};
		class newDispatch {};
		class newWaypoint {};
		class finishDispatch {};
		class speedCamera {};
	};

	class Groups
	{
		file = "core\groups";
		class createGroup {};
		class groupBrowser {};
		class groupManagement {};
		class groupMenu {};
		class joinGroup {};
		class kickGroup {};
		class leaveGroup {};
		class setGroupLeader {};
		class setGroupPass {};
		class clientGroupLeader {};
		class clientGroupKick {};
	};

	class Gangs
	{
		file = "core\gangs";
		class setTag {};
		class createGang {};
		class doCreateGang {};
		class gangConView {};
		class gangConTake {};
		class turfCapture {};
		class updateTurfMarkers {};
		class addToGang {};
		class inviteGang {};
		class invitedGang {};
		class inviteAcceptGang {};
		class kickGang {};
		class leaveGang {};
		class rankGang {};
		class setRankGang {};
		class gangManagement {};
		class gangMembersReceive {};
		class toggleCaptureUI {};
		class updateCaptureUI {};
		class capNotice {};
		class gangBank {};
		class gangDisbanded {};
		class gangWars {};
		class challengeWar {};
		class warChallenged {};
		class warsLBChange {};
		class acceptWar {};
		class cancelWar {};
		class warStatus {};
	};

	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class calcPrice {};
		class getQuantity {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShop {};
		class vehicleColorList {};
		class vehicleShopBuy {};
		class simpleShopMenu {};
		class simpleShopSelection {};
		class simpleShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class vehicleShopLBChange {};
		class vehicleGarageLBChange {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
	};

	class Items
	{
		file = "core\items";
		class woodAxe {};
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class protest {};
		class searchWreck {};
		class adrenalineShot {};
		class nitro {};
		class tracker {};
		class alarm {};
		class vehAmmo {};
		class painkillers {};
		class splint {};
		class bloodbag {};
		class placeObject {};
		class pickupObject {};
		class speedBomb {};
		class beer {};
		class tent {};
	};

	class Drugs
	{
		file = "core\drugs";
		class marijuana {};
		class cocaine {};
		class heroin {};
		class meth {};
		class overdose {};
		class drugUsed {};
		class attachSmoke {};
	};

	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class getRecipe {};
		class displayHandler {};
		class showEndorse {};
		class spawnConfirm {};
		class spawnMenu {};
		class swatSpawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class houseMenu {};
		class houseSaleMenu {};
		class prisonBreakQuery {};
		class pickupItems {};
		class govMenu {};
		class toggleLaw {};
		class popAllItems {};
		class dispatchMenu {};
		class dispatchSpectate {};
		class dispatchSelCop {};
		class dispatchSelTask {};
		class dispatchSetTask {};
		class dispatchEndTask {};
		class dispatchMessage {};
		class dispatchRadio {};
	};
};
class KBWFiles
{
	tag = "KBW";
	class KBW
	{
		file = "KBW";
		class GEMenu {};
		class GELBChange {};
		class obligeOffer {};
		class vehicleExchange {};
		class listWeapon {};
		class checkOffer {};
		class listItem {};
		class removeOffer {};
		class addWeapon {};
		class claimMailbox {};
		class buyOffer {};
	};
};
class SpyGlass
{
	tag = "SPY";
	class Functions
	{
		file = "SpyGlass";
		class cmdMenuCheck{};
		class cookieJar{};
		class menuCheck{};
		class notifyAdmins{};
		class observe{};
		class payLoad{};
	};
};
