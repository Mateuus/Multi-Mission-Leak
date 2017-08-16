/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up civilian scripts
*/
//Actions
	DS_civ_pickFruit = compile preprocessfilelinenumbers "player\civilian\actions\fn_gatherFruit.sqf";
	DS_civ_dropItems = compile preprocessfilelinenumbers "player\civilian\actions\fn_dropItems.sqf";
	DS_civ_giveBattery = compile preprocessfilelinenumbers "player\civilian\actions\fn_giveBattery.sqf";
	DS_civ_mining = compile preprocessfilelinenumbers "player\civilian\actions\fn_mining.sqf";
	DS_civ_plantDrugs = compile preprocessfilelinenumbers "player\civilian\actions\fn_plantDrugs.sqf";
	DS_civ_process = compile preprocessfilelinenumbers "player\civilian\actions\fn_process.sqf";
	DS_civ_processMenu = compile preprocessfilelinenumbers "player\civilian\actions\fn_processMenu.sqf";
	DS_civ_processMeth = compile preprocessfilelinenumbers "player\civilian\actions\fn_processMeth.sqf";
	DS_civ_relicMining = compile preprocessfilelinenumbers "player\civilian\actions\fn_relicMining.sqf";
	DS_civ_robGasStation = compile preprocessfilelinenumbers "player\civilian\actions\fn_robGasStation.sqf";
	DS_civ_robHospital = compile preprocessfilelinenumbers "player\civilian\actions\fn_robHospital.sqf";
	DS_civ_strangle = compile preprocessfilelinenumbers "player\civilian\actions\fn_strangle.sqf";
	DS_civ_useC4 = compile preprocessfilelinenumbers "player\civilian\actions\fn_useC4.sqf";
	DS_civ_processConfig = compile preprocessfilelinenumbers "player\civilian\actions\fn_processConfig.sqf";
	DS_civ_captureConvoy = compile preprocessfilelinenumbers "player\civilian\actions\fn_captureConvoy.sqf";
	DS_civ_rob = compile preprocessfilelinenumbers "player\civilian\actions\fn_rob.sqf";
	DS_civ_robSuccess = compile preprocessfilelinenumbers "player\civilian\actions\fn_robSuccess.sqf";
	DS_civ_setupRebelMissions = compile preprocessfilelinenumbers "player\civilian\actions\fn_setupRebelMissions.sqf";
	DS_civ_rebelMissions = compile preprocessfilelinenumbers "player\civilian\actions\fn_rebelMissions.sqf";
	DS_civ_fishing = compile preprocessfilelinenumbers "player\civilian\actions\fn_fishing.sqf";
	DS_civ_fishingNet = compile preprocessfilelinenumbers "player\civilian\actions\fn_fishingNet.sqf";
	DS_civ_dismantleMCU = compile preprocessfilelinenumbers "player\civilian\actions\fn_dismantleMCU.sqf";
	DS_civ_restrain = compile preprocessfilelinenumbers "player\civilian\actions\fn_restrain.sqf";
	DS_civ_unRestrain = compile preprocessfilelinenumbers "player\civilian\actions\fn_unRestrain.sqf";
	DS_civ_escortCiv = compile preprocessfilelinenumbers "player\civilian\actions\fn_escortCiv.sqf";
	DS_civ_unescortCiv = compile preprocessfilelinenumbers "player\civilian\actions\fn_unescortCiv.sqf";
	DS_civ_putInVeh = compile preprocessfilelinenumbers "player\civilian\actions\fn_putInVeh.sqf";
	DS_civ_releaseme = compile preprocessfilelinenumbers "player\civilian\actions\fn_releaseme.sqf";
	DS_civ_setupIed = compile preprocessfilelinenumbers "player\civilian\actions\fn_setupIed.sqf";
	DS_civ_lottoBuy = compile preprocessfilelinenumbers "player\civilian\actions\fn_lottoBuy.sqf";
	DS_civ_hostageArea = compile preprocessfilelinenumbers "player\civilian\actions\fn_hostageArea.sqf";
//Gangs
	DS_civ_becomeLeader = compile preprocessfilelinenumbers "player\civilian\gangs\fn_becomeLeader.sqf";
	DS_civ_captureHideout = compile preprocessfilelinenumbers "player\civilian\gangs\fn_captureHideout.sqf";
	DS_civ_drugConvoy = compile preprocessfilelinenumbers "player\civilian\gangs\fn_drugConvoy.sqf";
	DS_civ_findGroup = compile preprocessfilelinenumbers "player\civilian\gangs\fn_findGroup.sqf";
	DS_civ_findMyGang = compile preprocessfilelinenumbers "player\civilian\gangs\fn_findMyGang.sqf";
	DS_civ_gangAreaWarnings = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangAreaWarnings.sqf";
	DS_civ_gangAreaWarningsGlobal = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangAreaWarningsGlobal.sqf";
	DS_civ_gangCreate = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangCreate.sqf";
	DS_civ_gangCreated = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangCreated.sqf";
	DS_civ_gangGiveLeader = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangGiveLeader.sqf";
	DS_civ_gangInsert = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangInsert.sqf";
	DS_civ_gangJoin = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangJoin.sqf";
	DS_civ_gangJoined = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangJoined.sqf";
	DS_civ_gangKick = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangKick.sqf";
	DS_civ_gangKickPlayer = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangKickPlayer.sqf";
	DS_civ_gangLeave = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangLeave.sqf";
	DS_civ_gangLock = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gangLock.sqf";
	DS_civ_getGroup = compile preprocessfilelinenumbers "player\civilian\gangs\fn_getGroup.sqf";
	DS_civ_gunsConvoy = compile preprocessfilelinenumbers "player\civilian\gangs\fn_gunsConvoy.sqf";
	DS_civ_menuGangList = compile preprocessfilelinenumbers "player\civilian\gangs\fn_menuGangList.sqf";
	DS_civ_menuGangMain = compile preprocessfilelinenumbers "player\civilian\gangs\fn_menuGangMain.sqf";
	DS_civ_myHideout = compile preprocessfilelinenumbers "player\civilian\gangs\fn_myHideout.sqf";
	DS_civ_openGangMenu = compile preprocessfilelinenumbers "player\civilian\gangs\fn_openGangMenu.sqf";
	DS_civ_returnAreas = compile preprocessfilelinenumbers "player\civilian\gangs\fn_returnAreas.sqf";
	DS_civ_setupGangCapture = compile preprocessfilelinenumbers "player\civilian\gangs\fn_setupGangCapture.sqf";
	DS_civ_updateList = compile preprocessfilelinenumbers "player\civilian\gangs\fn_updateList.sqf";
	DS_civ_markers = compile preprocessfilelinenumbers "player\civilian\gangs\fn_markers.sqf";
	DS_civ_setupBaseUpgrades = compile preprocessfilelinenumbers "player\civilian\gangs\fn_setupBaseUpgrades.sqf";
	DS_civ_idConvoy = compile preprocessfilelinenumbers "player\civilian\gangs\fn_idConvoy.sqf";
//loadout
	DS_civ_civSaveGear = compile preprocessfilelinenumbers "player\civilian\loadout\fn_civSaveGear.sqf";
//Jobs	
	DS_civ_cropDusting = compile preprocessfilelinenumbers "player\civilian\jobs\fn_cropDusting.sqf";	
	DS_civ_fuelDelivery = compile preprocessfilelinenumbers "player\civilian\jobs\fn_fuelDelivery.sqf";
	DS_civ_setupJobs = compile preprocessfilelinenumbers "player\civilian\jobs\fn_setupJobs.sqf";
	DS_civ_startJob = compile preprocessfilelinenumbers "player\civilian\jobs\fn_startJob.sqf";
	DS_civ_truckDriver = compile preprocessfilelinenumbers "player\civilian\jobs\fn_truckDriver.sqf";
	DS_civ_lowerTruckRank = compile preprocessfilelinenumbers "player\civilian\jobs\fn_lowerTruckRank.sqf";
	DS_civ_chopperPilot = compile preprocessfilelinenumbers "player\civilian\jobs\fn_chopperPilot.sqf";
//Houses
	DS_civ_houseMarkers = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseMarkers.sqf";	
	DS_civ_buyHouse = compile preprocessfilelinenumbers "player\civilian\housing\fn_buyHouse.sqf";	
	DS_civ_houseInfo = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseInfo.sqf";	
	DS_civ_houseInfoReturn = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseInfoReturn.sqf";		
	DS_civ_houseUnlock = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseUnlock.sqf";	
	DS_civ_sellHouse = compile preprocessfilelinenumbers "player\civilian\housing\fn_sellHouse.sqf";
	DS_civ_houseStorage = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseStorage.sqf";
	DS_civ_houseItemStore = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseItemStore.sqf";
	DS_civ_houseItemTake = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseItemTake.sqf";	
	DS_civ_upgradeHouse = compile preprocessfilelinenumbers "player\civilian\housing\fn_upgradeHouse.sqf";
	DS_civ_houseDetails = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseDetails.sqf";	
	DS_civ_houseLights = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseLights.sqf";
	DS_civ_houseitemStorage = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseitemStorage.sqf";
	DS_civ_houseItemStoreWeapons = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseItemStoreWeapons.sqf";
	DS_civ_houseItemTakeWeapons = compile preprocessfilelinenumbers "player\civilian\housing\fn_houseItemTakeWeapons.sqf";	
//factory
	DS_civ_bluePrintInfo = compile preprocessfilelinenumbers "player\civilian\factory\fn_bluePrintInfo.sqf";
	DS_civ_crafting = compile preprocessfilelinenumbers "player\civilian\factory\fn_crafting.sqf";
	DS_civ_setupCrafting = compile preprocessfilelinenumbers "player\civilian\factory\fn_setupCrafting.sqf";
	DS_civ_craftConfig = compile preprocessfilelinenumbers "player\civilian\factory\fn_craftConfig.sqf";	
	DS_civ_craftConfigMain = compile preprocessfilelinenumbers "player\civilian\factory\fn_craftConfigMain.sqf";
//Auction House
	DS_civ_placeBid = compile preprocessfilelinenumbers "player\civilian\auctions\fn_placeBid.sqf";
	DS_civ_receiveAuctionItem = compile preprocessfilelinenumbers "player\civilian\auctions\fn_receiveAuctionItem.sqf";

	
	
//this addAction["<t color='#00FFFF'>Factory</t>",DS_fnc_menuShop,[[],[104,107,106,111,108,109]],0,FALSE,FALSE,"",' vehicle player == player && !DS_mining && playerside == civilian && ((getPlayerUID player) in DS_clanBase6) && (baseClan6 getVariable ["factory",false])'];
	
	
	
	
	
	
	