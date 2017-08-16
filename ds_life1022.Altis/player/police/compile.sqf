/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up police scripts
*/

//Actions
DS_cop_addEvictMarker = compile preprocessFileLineNumbers "player\police\actions\fn_addEvictMarker.sqf";
DS_cop_loadEvictMarkers = compile preprocessFileLineNumbers "player\police\actions\fn_loadEvictMarkers.sqf";
DS_cop_checkPlayerCharges = compile preprocessFileLineNumbers "player\police\actions\fn_checkPlayerCharges.sqf";
DS_cop_defuseC4 = compile preprocessFileLineNumbers "player\police\actions\fn_defuseC4.sqf";
DS_cop_displayPlayerCharges = compile preprocessFileLineNumbers "player\police\actions\fn_displayPlayerCharges.sqf";
DS_cop_pardonPlayer = compile preprocessFileLineNumbers "player\police\actions\fn_pardonPlayer.sqf";
DS_cop_policeTransport = compile preprocessFileLineNumbers "player\police\actions\fn_policeTransport.sqf";
DS_cop_removeRemains = compile preprocessFileLineNumbers "player\police\actions\fn_removeRemains.sqf";
DS_cop_returnPlayerCharges = compile preprocessFileLineNumbers "player\police\actions\fn_returnPlayerCharges.sqf";
DS_cop_setPlayerWanted = compile preprocessFileLineNumbers "player\police\actions\fn_setPlayerWanted.sqf";
DS_cop_setupPoliceTransport = compile preprocessFileLineNumbers "player\police\actions\fn_setupPoliceTransport.sqf";
DS_cop_setwanted = compile preprocessFileLineNumbers "player\police\actions\fn_setwanted.sqf";
DS_cop_totalBounty = compile preprocessFileLineNumbers "player\police\actions\fn_totalBounty.sqf";
DS_cop_wantedlist = compile preprocessFileLineNumbers "player\police\actions\fn_wantedlist.sqf";
DS_cop_markers = compile preprocessFileLineNumbers "player\police\actions\fn_markers.sqf";
DS_cop_captureHideout = compile preprocessFileLineNumbers "player\police\actions\fn_captureHideout.sqf";
DS_cop_removeDead = compile preprocessFileLineNumbers "player\police\actions\fn_removeDead.sqf";
DS_cop_fireCop = compile preprocessFileLineNumbers "player\police\actions\fn_fireCop.sqf";
DS_cop_fireCopPlayer = compile preprocessFileLineNumbers "player\police\actions\fn_fireCopPlayer.sqf";
DS_cop_blockPhone = compile preprocessFileLineNumbers "player\police\actions\fn_blockPhone.sqf";
DS_cop_convoys = compile preprocessFileLineNumbers "player\police\actions\fn_convoys.sqf";
DS_cop_barGates = compile preprocessFileLineNumbers "player\police\actions\fn_barGates.sqf";
DS_cop_deploySpikes = compile preprocessFileLineNumbers "player\police\actions\fn_deploySpikes.sqf";
DS_cop_packSpikes = compile preprocessFileLineNumbers "player\police\actions\fn_packSpikes.sqf";
DS_cop_fuelDart = compile preprocessFileLineNumbers "player\police\actions\fn_fuelDart.sqf";
DS_cop_publicblock = compile preprocessFileLineNumbers "player\police\actions\fn_publicblock.sqf";
DS_cop_setmartiallaw = compile preprocessFileLineNumbers "player\police\actions\fn_setmartiallaw.sqf";
DS_cop_martiallaw = compile preprocessFileLineNumbers "player\police\actions\fn_martiallaw.sqf";
DS_cop_cleanUpWeapon = compile preprocessFileLineNumbers "player\police\actions\fn_cleanUpWeapon.sqf";
DS_cop_copsBribe = compile preprocessFileLineNumbers "player\police\actions\fn_copsBribe.sqf";
DS_cop_releaseplayer = compile preprocessFileLineNumbers "player\police\actions\fn_releaseplayer.sqf";
DS_cop_houseRaid = compile preprocessFileLineNumbers "player\police\actions\fn_houseRaid.sqf";
DS_cop_switchFireType = compile preprocessFileLineNumbers "player\police\actions\fn_switchFireType.sqf";
DS_cop_convoyMarkers = compile preprocessFileLineNumbers "player\police\actions\fn_convoyMarkers.sqf";
DS_cop_policePatrol = compile preprocessFileLineNumbers "player\police\actions\fn_policePatrol.sqf";
DS_cop_revoke = compile preprocessFileLineNumbers "player\police\actions\fn_revoke.sqf";
DS_cop_checkTaskActions = compile preprocessFileLineNumbers "player\police\actions\fn_checkTaskActions.sqf";
DS_cop_addToSquad = compile preprocessFileLineNumbers "player\police\actions\fn_addToSquad.sqf";
DS_cop_pubcopLoop = compile preprocessFileLineNumbers "player\police\actions\fn_pubcopLoop.sqf";
DS_cop_policeDog = compile preprocessFileLineNumbers "player\police\actions\fn_policeDog.sqf";
DS_cop_fixWantedList = compile preprocessFileLineNumbers "player\police\actions\fn_fixWantedList.sqf";
DS_cop_missionMarkers = compile preprocessFileLineNumbers "player\police\actions\fn_missionMarkers.sqf";
DS_cop_addTaskActions = compile preprocessFileLineNumbers "player\police\actions\fn_addTaskActions.sqf";
DS_cop_updateCopRank = compile preprocessFileLineNumbers "player\police\actions\fn_updateCopRank.sqf";

//Interactions
DS_cop_beating = compile preprocessFileLineNumbers "player\police\interactions\fn_beating.sqf";
DS_cop_checkCharges = compile preprocessFileLineNumbers "player\police\interactions\fn_checkCharges.sqf";
DS_cop_checkChargesPlayerReturn = compile preprocessFileLineNumbers "player\police\interactions\fn_checkChargesPlayerReturn.sqf";
DS_cop_displayLicenses = compile preprocessFileLineNumbers "player\police\interactions\fn_displayLicenses.sqf";
DS_cop_escortCiv = compile preprocessFileLineNumbers "player\police\interactions\fn_escortCiv.sqf";
DS_cop_giveTicket = compile preprocessFileLineNumbers "player\police\interactions\fn_giveTicket.sqf";
DS_cop_jailCiv = compile preprocessFileLineNumbers "player\police\interactions\fn_jailCiv.sqf";
DS_cop_jailMenu = compile preprocessFileLineNumbers "player\police\interactions\fn_jailMenu.sqf";
DS_cop_restrain = compile preprocessFileLineNumbers "player\police\interactions\fn_restrain.sqf";
DS_cop_issueTicket = compile preprocessFileLineNumbers "player\police\interactions\fn_issueTicket.sqf";
DS_cop_searchCivCop = compile preprocessFileLineNumbers "player\police\interactions\fn_searchCivCop.sqf";
DS_cop_searchResults = compile preprocessFileLineNumbers "player\police\interactions\fn_searchResults.sqf";
DS_cop_ticketPaid = compile preprocessFileLineNumbers "player\police\interactions\fn_ticketPaid.sqf";
DS_cop_ticketPrices = compile preprocessFileLineNumbers "player\police\interactions\fn_ticketPrices.sqf";
DS_cop_unescortCiv = compile preprocessFileLineNumbers "player\police\interactions\fn_unescortCiv.sqf";
DS_cop_unRestrain = compile preprocessFileLineNumbers "player\police\interactions\fn_unRestrain.sqf";
DS_cop_houseInfo = compile preprocessFileLineNumbers "player\police\interactions\fn_houseInfo.sqf";
DS_cop_blindfoldciv = compile preprocessFileLineNumbers "player\police\interactions\fn_blindfoldciv.sqf";

//Loadouts
DS_cop_copDefault = compile preprocessFileLineNumbers "player\police\loadouts\fn_copDefault.sqf";

//Vehicles
DS_cop_vehDestroy = compile preprocessFileLineNumbers "player\police\vehicles\fn_vehDestroy.sqf";
DS_cop_vehImpound = compile preprocessFileLineNumbers "player\police\vehicles\fn_vehImpound.sqf";
DS_cop_vehLocker = compile preprocessFileLineNumbers "player\police\vehicles\fn_vehLocker.sqf";
DS_cop_vehRego = compile preprocessFileLineNumbers "player\police\vehicles\fn_vehRego.sqf";
DS_cop_vehSearch = compile preprocessFileLineNumbers "player\police\vehicles\fn_vehSearch.sqf";
DS_cop_policeSounds = compile preprocessFileLineNumbers "player\police\vehicles\fn_policeSounds.sqf";
DS_cop_lockerStore = compile preprocessFileLineNumbers "player\police\vehicles\fn_lockerStore.sqf";
DS_cop_lockerTake = compile preprocessFileLineNumbers "player\police\vehicles\fn_lockerTake.sqf";
DS_cop_MCU = compile preprocessFileLineNumbers "player\police\vehicles\fn_MCU.sqf";
DS_cop_MCUWater = compile preprocessFileLineNumbers "player\police\vehicles\fn_MCUWater.sqf";
DS_cop_exitGun = compile preprocessFileLineNumbers "player\police\vehicles\fn_exitGun.sqf";
DS_cop_sandBag = compile preprocessFileLineNumbers "player\police\vehicles\fn_sandBag.sqf";
DS_cop_packupSandBag = compile preprocessFileLineNumbers "player\police\vehicles\fn_packupSandBag.sqf";
DS_cop_radarInfo = compile preprocessFileLineNumbers "player\police\vehicles\fn_radarInfo.sqf";

//Highway Patrol
DS_cop_highwayPullover = compile preprocessFileLineNumbers "player\police\highwayPatrol\fn_highwayPullover.sqf";
DS_cop_setupHWP = compile preprocessFileLineNumbers "player\police\highwayPatrol\fn_setupHWP.sqf";
DS_cop_markersHWP = compile preprocessFileLineNumbers "player\police\highwayPatrol\fn_markersHWP.sqf";

//Sharp Shooter
DS_cop_switchStance = compile preprocessFileLineNumbers "player\police\sharpShooter\fn_switchStance.sqf";
DS_cop_setupSS = compile preprocessFileLineNumbers "player\police\sharpShooter\fn_setupSS.sqf";

//Coast Guard
DS_cop_switchStanceCG = compile preprocessFileLineNumbers "player\police\coastGuard\fn_switchStanceCG.sqf";
DS_cop_setupCG = compile preprocessFileLineNumbers "player\police\coastGuard\fn_setupCG.sqf";
DS_cop_markersCG = compile preprocessFileLineNumbers "player\police\coastGuard\fn_markersCG.sqf";

//Police Config
DS_cop_destroyVehPrice = compile preprocessFileLineNumbers "player\police\config\fn_destroyVehPrice.sqf";

//Rewards
DS_cop_paySecurity = compile preprocessFileLineNumbers "player\police\rewards\fn_paySecurity.sqf";