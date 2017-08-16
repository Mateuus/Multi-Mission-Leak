/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up civilian scripts
*/

//Actions
DS_civ_pickFruit = compile preprocessFileLineNumbers "player\civilian\actions\fn_gatherFruit.sqf";
DS_civ_dropItems = compile preprocessFileLineNumbers "player\civilian\actions\fn_dropItems.sqf";
DS_civ_giveBattery = compile preprocessFileLineNumbers "player\civilian\actions\fn_giveBattery.sqf";
DS_civ_mining = compile preprocessFileLineNumbers "player\civilian\actions\fn_mining.sqf";
DS_civ_plantDrugs = compile preprocessFileLineNumbers "player\civilian\actions\fn_plantDrugs.sqf";
DS_civ_process = compile preprocessFileLineNumbers "player\civilian\actions\fn_process.sqf";
DS_civ_processMenu = compile preprocessFileLineNumbers "player\civilian\actions\fn_processMenu.sqf";
DS_civ_processMeth = compile preprocessFileLineNumbers "player\civilian\actions\fn_processMeth.sqf";
DS_civ_relicMining = compile preprocessFileLineNumbers "player\civilian\actions\fn_relicMining.sqf";
DS_civ_robGasStation = compile preprocessFileLineNumbers "player\civilian\actions\fn_robGasStation.sqf";
DS_civ_robHospital = compile preprocessFileLineNumbers "player\civilian\actions\fn_robHospital.sqf";
DS_civ_strangle = compile preprocessFileLineNumbers "player\civilian\actions\fn_strangle.sqf";
DS_civ_useC4 = compile preprocessFileLineNumbers "player\civilian\actions\fn_useC4.sqf";
DS_civ_processConfig = compile preprocessFileLineNumbers "player\civilian\actions\fn_processConfig.sqf";
DS_civ_captureConvoy = compile preprocessFileLineNumbers "player\civilian\actions\fn_captureConvoy.sqf";
DS_civ_rob = compile preprocessFileLineNumbers "player\civilian\actions\fn_rob.sqf";
DS_civ_robSuccess = compile preprocessFileLineNumbers "player\civilian\actions\fn_robSuccess.sqf";
DS_civ_setupRebelMissions = compile preprocessFileLineNumbers "player\civilian\actions\fn_setupRebelMissions.sqf";
DS_civ_rebelMissions = compile preprocessFileLineNumbers "player\civilian\actions\fn_rebelMissions.sqf";
DS_civ_fishing = compile preprocessFileLineNumbers "player\civilian\actions\fn_fishing.sqf";
DS_civ_fishingNet = compile preprocessFileLineNumbers "player\civilian\actions\fn_fishingNet.sqf";
DS_civ_dismantleMCU = compile preprocessFileLineNumbers "player\civilian\actions\fn_dismantleMCU.sqf";
DS_civ_dismantleMCUWater = compile preprocessFileLineNumbers "player\civilian\actions\fn_dismantleMCUWater.sqf";
DS_civ_restrain = compile preprocessFileLineNumbers "player\civilian\actions\fn_restrain.sqf";
DS_civ_unRestrain = compile preprocessFileLineNumbers "player\civilian\actions\fn_unRestrain.sqf";
DS_civ_escortCiv = compile preprocessFileLineNumbers "player\civilian\actions\fn_escortCiv.sqf";
DS_civ_unescortCiv = compile preprocessFileLineNumbers "player\civilian\actions\fn_unescortCiv.sqf";
DS_civ_releaseme = compile preprocessFileLineNumbers "player\civilian\actions\fn_releaseme.sqf";
DS_civ_setupIed = compile preprocessFileLineNumbers "player\civilian\actions\fn_setupIed.sqf";
DS_civ_lottoBuy = compile preprocessFileLineNumbers "player\civilian\actions\fn_lottoBuy.sqf";
DS_civ_hostageArea = compile preprocessFileLineNumbers "player\civilian\actions\fn_hostageArea.sqf";
DS_civ_setupTokenMissions = compile preprocessFileLineNumbers "player\civilian\actions\fn_setupTokenMissions.sqf";
DS_civ_payTokens = compile preprocessFileLineNumbers "player\civilian\actions\fn_payTokens.sqf";
DS_civ_boatCC = compile preprocessFileLineNumbers "player\civilian\actions\fn_boatCC.sqf";
DS_civ_terroristMission = compile preprocessFileLineNumbers "player\civilian\actions\fn_terroristMission.sqf";
DS_civ_extraChannels = compile preprocessFileLineNumbers "player\civilian\actions\fn_extraChannels.sqf";
DS_civ_cleanUpWeapon = compile preprocessFileLineNumbers "player\civilian\actions\fn_cleanUpWeapon.sqf";

//Gangs
DS_civ_captureHideout = compile preprocessFileLineNumbers "player\civilian\gangs\fn_captureHideout.sqf";
DS_civ_drugConvoy = compile preprocessFileLineNumbers "player\civilian\gangs\fn_drugConvoy.sqf";
DS_civ_gangAreaWarningsGlobal = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangAreaWarningsGlobal.sqf";
DS_civ_gangCheck = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangCheck.sqf";
DS_civ_gangCreate = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangCreate.sqf";
DS_civ_gangCreated = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangCreated.sqf";
DS_civ_gangGetGroup = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangGetGroup.sqf";
DS_civ_gangOptions = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangOptions.sqf";
DS_civ_gangUpdateList = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangUpdateList.sqf";
DS_civ_gangInsert = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangInsert.sqf";
DS_civ_gangJoin = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangJoin.sqf";
DS_civ_gangJoined = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangJoined.sqf";
DS_civ_gangKick = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangKick.sqf";
DS_civ_gangKickPlayer = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangKickPlayer.sqf";
DS_civ_gangLeave = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangLeave.sqf";
DS_civ_gangLock = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangLock.sqf";
DS_civ_gangMessage = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangMessage.sqf";
DS_civ_gangRejoin = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gangRejoin.sqf";
DS_civ_gunsConvoy = compile preprocessFileLineNumbers "player\civilian\gangs\fn_gunsConvoy.sqf";
DS_civ_menuGangList = compile preprocessFileLineNumbers "player\civilian\gangs\fn_menuGangList.sqf";
DS_civ_menuGangMain = compile preprocessFileLineNumbers "player\civilian\gangs\fn_menuGangMain.sqf";
DS_civ_myHideout = compile preprocessFileLineNumbers "player\civilian\gangs\fn_myHideout.sqf";
DS_civ_openGangMenu = compile preprocessFileLineNumbers "player\civilian\gangs\fn_openGangMenu.sqf";
DS_civ_returnAreas = compile preprocessFileLineNumbers "player\civilian\gangs\fn_returnAreas.sqf";
DS_civ_markers = compile preprocessFileLineNumbers "player\civilian\gangs\fn_markers.sqf";
DS_civ_setupBaseUpgrades = compile preprocessFileLineNumbers "player\civilian\gangs\fn_setupBaseUpgrades.sqf";
DS_civ_idConvoy = compile preprocessFileLineNumbers "player\civilian\gangs\fn_idConvoy.sqf";
DS_civ_drugConvoyWater = compile preprocessFileLineNumbers "player\civilian\gangs\fn_drugConvoyWater.sqf";
DS_civ_weaponsConvoyWater = compile preprocessFileLineNumbers "player\civilian\gangs\fn_weaponsConvoyWater.sqf";
DS_civ_donorRetexture = compile preprocessFileLineNumbers "player\civilian\gangs\fn_donorRetexture.sqf";
DS_civ_randomLoadout = compile preprocessFileLineNumbers "player\civilian\gangs\fn_randomLoadout.sqf";
DS_civ_payGangAccount = compile preprocessFileLineNumbers "player\civilian\gangs\fn_payGangAccount.sqf";
DS_civ_clanItemStore = compile preprocessFileLineNumbers "player\civilian\gangs\fn_clanItemStore.sqf";
DS_civ_clanItemTake = compile preprocessFileLineNumbers "player\civilian\gangs\fn_clanItemTake.sqf";
DS_civ_clanItemStoreWeapons = compile preprocessFileLineNumbers "player\civilian\gangs\fn_clanItemStoreWeapons.sqf";
DS_civ_clanItemTakeWeapons = compile preprocessFileLineNumbers "player\civilian\gangs\fn_clanItemTakeWeapons.sqf";
DS_civ_confirmClanName = compile preprocessFileLineNumbers "player\civilian\gangs\fn_confirmClanName.sqf";

//Jobs
DS_civ_cropDusting = compile preprocessFileLineNumbers "player\civilian\jobs\fn_cropDusting.sqf";
DS_civ_fuelDelivery = compile preprocessFileLineNumbers "player\civilian\jobs\fn_fuelDelivery.sqf";
DS_civ_setupJobs = compile preprocessFileLineNumbers "player\civilian\jobs\fn_setupJobs.sqf";
DS_civ_startJob = compile preprocessFileLineNumbers "player\civilian\jobs\fn_startJob.sqf";
DS_civ_truckDriver = compile preprocessFileLineNumbers "player\civilian\jobs\fn_truckDriver.sqf";
DS_civ_lowerTruckRank = compile preprocessFileLineNumbers "player\civilian\jobs\fn_lowerTruckRank.sqf";
DS_civ_chopperPilot = compile preprocessFileLineNumbers "player\civilian\jobs\fn_chopperPilot.sqf";
DS_civ_setupPlaneMissions = compile preprocessFileLineNumbers "player\civilian\jobs\fn_setupPlaneMissions.sqf";
DS_civ_setupBoatMissions = compile preprocessFileLineNumbers "player\civilian\jobs\fn_setupBoatMissions.sqf";
DS_civ_taxiMissions = compile preprocessFileLineNumbers "player\civilian\jobs\fn_taxiMissions.sqf";

//Houses
DS_civ_houseMarkers = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseMarkers.sqf";
DS_civ_buyHouse = compile preprocessFileLineNumbers "player\civilian\housing\fn_buyHouse.sqf";
DS_civ_houseInfo = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseInfo.sqf";
DS_civ_houseInfoReturn = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseInfoReturn.sqf";
DS_civ_houseUnlock = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseUnlock.sqf";
DS_civ_sellHouse = compile preprocessFileLineNumbers "player\civilian\housing\fn_sellHouse.sqf";
DS_civ_houseStorage = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseStorage.sqf";
DS_civ_houseItemStore = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseItemStore.sqf";
DS_civ_houseItemTake = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseItemTake.sqf";
DS_civ_upgradeHouse = compile preprocessFileLineNumbers "player\civilian\housing\fn_upgradeHouse.sqf";
DS_civ_houseDetails = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseDetails.sqf";
DS_civ_houseLights = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseLights.sqf";
DS_civ_houseitemStorage = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseitemStorage.sqf";
DS_civ_houseItemStoreWeapons = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseItemStoreWeapons.sqf";
DS_civ_houseItemTakeWeapons = compile preprocessFileLineNumbers "player\civilian\housing\fn_houseItemTakeWeapons.sqf";
DS_civ_upgradeHouseGarage = compile preprocessFileLineNumbers "player\civilian\housing\fn_upgradeHouseGarage.sqf";

//Factory
DS_civ_bluePrintInfo = compile preprocessFileLineNumbers "player\civilian\factory\fn_bluePrintInfo.sqf";
DS_civ_crafting = compile preprocessFileLineNumbers "player\civilian\factory\fn_crafting.sqf";
DS_civ_setupCrafting = compile preprocessFileLineNumbers "player\civilian\factory\fn_setupCrafting.sqf";
DS_civ_craftConfig = compile preprocessFileLineNumbers "player\civilian\factory\fn_craftConfig.sqf";
DS_civ_craftConfigMain = compile preprocessFileLineNumbers "player\civilian\factory\fn_craftConfigMain.sqf";
DS_civ_realEstateCreate = compile preprocessFileLineNumbers "player\civilian\factory\fn_realEstateCreate.sqf";

//Auction House
DS_civ_placeBid = compile preprocessFileLineNumbers "player\civilian\auctions\fn_placeBid.sqf";
DS_civ_receiveAuctionItem = compile preprocessFileLineNumbers "player\civilian\auctions\fn_receiveAuctionItem.sqf";

//Market
DS_civ_openMarket = compile preprocessFileLineNumbers "player\civilian\market\fn_openMarket.sqf";
DS_civ_marketConfig = compile preprocessFileLineNumbers "player\civilian\market\fn_marketConfig.sqf";
DS_civ_marketInformation = compile preprocessFileLineNumbers "player\civilian\market\fn_marketInformation.sqf";
DS_civ_marketLbChange = compile preprocessFileLineNumbers "player\civilian\market\fn_marketLbChange.sqf";
DS_civ_marketTips = compile preprocessFileLineNumbers "player\civilian\market\fn_marketTips.sqf";

//License Test
DS_civ_openTest = compile preprocessFileLineNumbers "player\civilian\licenseTest\fn_openTest.sqf";
DS_civ_licenseTestConfig = compile preprocessFileLineNumbers "player\civilian\licenseTest\fn_licenseTestConfig.sqf";
DS_civ_licenseTestAttempt = compile preprocessFileLineNumbers "player\civilian\licenseTest\fn_licenseTestAttempt.sqf";
DS_civ_closeTest = compile preprocessFileLineNumbers "player\civilian\licenseTest\fn_closeTest.sqf";
DS_civ_checkAnswer = compile preprocessFileLineNumbers "player\civilian\licenseTest\fn_checkAnswer.sqf";
DS_civ_improve = compile preprocessFileLineNumbers "player\civilian\licenseTest\fn_improve.sqf";

//this addAction["<t color='#00FFFF'>Factory</t>",DS_fnc_menuShop,[[],[104,107,106,111,108,109]],0,FALSE,FALSE,"",'isNull objectParent player && !DS_mining && playerSide isEqualTo civilian && ((getPlayerUID player) in DS_clanBase6) && (baseClan6 getVariable ["factory",false])'];