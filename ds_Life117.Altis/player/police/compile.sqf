/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up police scripts
*/
//Actions
	DS_cop_checkPlayerCharges = compile preprocessfilelinenumbers "player\police\actions\fn_checkPlayerCharges.sqf";
	DS_cop_defuseC4 = compile preprocessfilelinenumbers "player\police\actions\fn_defuseC4.sqf";
	DS_cop_displayPlayerCharges = compile preprocessfilelinenumbers "player\police\actions\fn_displayPlayerCharges.sqf";
	DS_cop_pardonPlayer = compile preprocessfilelinenumbers "player\police\actions\fn_pardonPlayer.sqf";
	DS_cop_policeTransport = compile preprocessfilelinenumbers "player\police\actions\fn_policeTransport.sqf";
	DS_cop_removeRemains = compile preprocessfilelinenumbers "player\police\actions\fn_removeRemains.sqf";
	DS_cop_returnPlayerCharges = compile preprocessfilelinenumbers "player\police\actions\fn_returnPlayerCharges.sqf";
	DS_cop_setPlayerWanted = compile preprocessfilelinenumbers "player\police\actions\fn_setPlayerWanted.sqf";
	DS_cop_setupPoliceTransport = compile preprocessfilelinenumbers "player\police\actions\fn_setupPoliceTransport.sqf";
	DS_cop_setwanted = compile preprocessfilelinenumbers "player\police\actions\fn_setwanted.sqf";
	DS_cop_totalBounty = compile preprocessfilelinenumbers "player\police\actions\fn_totalBounty.sqf";
	DS_cop_wantedlist = compile preprocessfilelinenumbers "player\police\actions\fn_wantedlist.sqf";
	DS_cop_markers = compile preprocessfilelinenumbers "player\police\actions\fn_markers.sqf";
	DS_cop_captureHideout = compile preprocessfilelinenumbers "player\police\actions\fn_captureHideout.sqf";
	DS_cop_removeDead = compile preprocessfilelinenumbers "player\police\actions\fn_removeDead.sqf";
	DS_cop_fireCop = compile preprocessfilelinenumbers "player\police\actions\fn_fireCop.sqf";
	DS_cop_fireCopPlayer = compile preprocessfilelinenumbers "player\police\actions\fn_fireCopPlayer.sqf";
	DS_cop_blockPhone = compile preprocessfilelinenumbers "player\police\actions\fn_blockPhone.sqf";
	DS_cop_convoys = compile preprocessfilelinenumbers "player\police\actions\fn_convoys.sqf";
	DS_cop_convoysNew = compile preprocessfilelinenumbers "player\police\actions\fn_convoysNew.sqf";
	DS_cop_barGates = compile preprocessfilelinenumbers "player\police\actions\fn_barGates.sqf";
	DS_cop_deploySpikes = compile preprocessfilelinenumbers "player\police\actions\fn_deploySpikes.sqf";
	DS_cop_packSpikes = compile preprocessfilelinenumbers "player\police\actions\fn_packSpikes.sqf";
	DS_cop_fuelDart = compile preprocessfilelinenumbers "player\police\actions\fn_fuelDart.sqf";
	DS_cop_publicblock = compile preprocessfilelinenumbers "player\police\actions\fn_publicblock.sqf";
	DS_cop_setmartiallaw = compile preprocessfilelinenumbers "player\police\actions\fn_setmartiallaw.sqf";
	DS_cop_martiallaw = compile preprocessfilelinenumbers "player\police\actions\fn_martiallaw.sqf";
	DS_cop_cleanUpWeapon = compile preprocessfilelinenumbers "player\police\actions\fn_cleanUpWeapon.sqf";
	DS_cop_copsBribe = compile preprocessfilelinenumbers "player\police\actions\fn_copsBribe.sqf";
	DS_cop_releaseplayer = compile preprocessfilelinenumbers "player\police\actions\fn_releaseplayer.sqf";
	DS_cop_houseRaid = compile preprocessfilelinenumbers "player\police\actions\fn_houseRaid.sqf";
	DS_cop_switchFireType = compile preprocessfilelinenumbers "player\police\actions\fn_switchFireType.sqf";
	DS_cop_convoyMarkers = compile preprocessfilelinenumbers "player\police\actions\fn_convoyMarkers.sqf";
	DS_cop_policePatrol = compile preprocessfilelinenumbers "player\police\actions\fn_policePatrol.sqf";
	DS_cop_revoke = compile preprocessfilelinenumbers "player\police\actions\fn_revoke.sqf";
	DS_cop_checkTaskActions = compile preprocessfilelinenumbers "player\police\actions\fn_checkTaskActions.sqf";
	DS_cop_addToSquad = compile preprocessfilelinenumbers "player\police\actions\fn_addToSquad.sqf";
//Interactions
	DS_cop_beating = compile preprocessfilelinenumbers "player\police\interactions\fn_beating.sqf";
	DS_cop_checkCharges = compile preprocessfilelinenumbers "player\police\interactions\fn_checkCharges.sqf";
	DS_cop_checkChargesPlayerReturn = compile preprocessfilelinenumbers "player\police\interactions\fn_checkChargesPlayerReturn.sqf";
	DS_cop_displayLicenses = compile preprocessfilelinenumbers "player\police\interactions\fn_displayLicenses.sqf";
	DS_cop_escortCiv = compile preprocessfilelinenumbers "player\police\interactions\fn_escortCiv.sqf";
	DS_cop_giveTicket = compile preprocessfilelinenumbers "player\police\interactions\fn_giveTicket.sqf";
	DS_cop_jailCiv = compile preprocessfilelinenumbers "player\police\interactions\fn_jailCiv.sqf";
	DS_cop_jailMenu = compile preprocessfilelinenumbers "player\police\interactions\fn_jailMenu.sqf";
	DS_cop_putInVeh = compile preprocessfilelinenumbers "player\police\interactions\fn_putInVeh.sqf";
	DS_cop_restrain = compile preprocessfilelinenumbers "player\police\interactions\fn_restrain.sqf";
	DS_cop_issueTicket = compile preprocessfilelinenumbers "player\police\interactions\fn_issueTicket.sqf";
	DS_cop_searchCivCop = compile preprocessfilelinenumbers "player\police\interactions\fn_searchCivCop.sqf";
	DS_cop_searchResults = compile preprocessfilelinenumbers "player\police\interactions\fn_searchResults.sqf";
	DS_cop_ticketPaid = compile preprocessfilelinenumbers "player\police\interactions\fn_ticketPaid.sqf";
	DS_cop_ticketPrices = compile preprocessfilelinenumbers "player\police\interactions\fn_ticketPrices.sqf";
	DS_cop_unescortCiv = compile preprocessfilelinenumbers "player\police\interactions\fn_unescortCiv.sqf";
	DS_cop_unRestrain = compile preprocessfilelinenumbers "player\police\interactions\fn_unRestrain.sqf";
//loadouts
	DS_cop_copDefault = compile preprocessfilelinenumbers "player\police\loadouts\fn_copDefault.sqf";
	DS_cop_loadPoliceGear = compile preprocessfilelinenumbers "player\police\loadouts\fn_loadPoliceGear.sqf";
	DS_cop_saveCopGear = compile preprocessfilelinenumbers "player\police\loadouts\fn_saveCopGear.sqf";
//vehicles
	DS_cop_vehDestroy = compile preprocessfilelinenumbers "player\police\vehicles\fn_vehDestroy.sqf";
	DS_cop_vehImpound = compile preprocessfilelinenumbers "player\police\vehicles\fn_vehImpound.sqf";
	DS_cop_vehLocker = compile preprocessfilelinenumbers "player\police\vehicles\fn_vehLocker.sqf";
	DS_cop_vehRego = compile preprocessfilelinenumbers "player\police\vehicles\fn_vehRego.sqf";
	DS_cop_vehSearch = compile preprocessfilelinenumbers "player\police\vehicles\fn_vehSearch.sqf";
	DS_cop_policeSounds = compile preprocessfilelinenumbers "player\police\vehicles\fn_policeSounds.sqf";
	DS_cop_lockerStore = compile preprocessfilelinenumbers "player\police\vehicles\fn_lockerStore.sqf";
	DS_cop_lockerTake = compile preprocessfilelinenumbers "player\police\vehicles\fn_lockerTake.sqf";
	DS_cop_MCU = compile preprocessfilelinenumbers "player\police\vehicles\fn_MCU.sqf";
	DS_cop_exitGun = compile preprocessfilelinenumbers "player\police\vehicles\fn_exitGun.sqf";
	DS_cop_sandBag = compile preprocessfilelinenumbers "player\police\vehicles\fn_sandBag.sqf";
	DS_cop_packupSandBag = compile preprocessfilelinenumbers "player\police\vehicles\fn_packupSandBag.sqf";
	DS_cop_radarInfo = compile preprocessfilelinenumbers "player\police\vehicles\fn_radarInfo.sqf";
//highway patrol
	DS_cop_highwayPullover = compile preprocessfilelinenumbers "player\police\highwayPatrol\fn_highwayPullover.sqf";
//Sharp Shooter
	DS_cop_switchStance = compile preprocessfilelinenumbers "player\police\sharpShooter\fn_switchStance.sqf";
//police config
	DS_cop_destroyVehPrice = compile preprocessfilelinenumbers "player\police\config\fn_destroyVehPrice.sqf";	