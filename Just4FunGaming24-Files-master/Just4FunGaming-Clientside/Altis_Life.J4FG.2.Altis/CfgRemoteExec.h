// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

class CfgRemoteExec {

    class Functions {
        mode = 1;
        jip = 0;

        // EVERYWHERE
        class XY_fnc_broadcast { allowedTargets = 0; };
        class XY_fnc_pushFunction { allowedTargets = 0; };
        class XY_fnc_lockVehicle { allowedTargets = 0; };
        class XY_fnc_addCash { allowedTargets = 0; };

        class XYDB_fnc_log { allowedTargets = 0; };
        class XYDB_fnc_fpsLog { allowedTargets = 0; };
        class XYDB_fnc_updatePartial { allowedTargets = 0; };
        class XYDB_fnc_updateRequest { allowedTargets = 0; };
        class XYDB_fnc_queryRequest { allowedTargets = 0; };
        class XYDB_fnc_insertRequest { allowedTargets = 0; };

        class XYDB_fnc_getVehicles { allowedTargets = 0; };
        class XYDB_fnc_retrieveVehicle { allowedTargets = 0; };
        class XYDB_fnc_sellVehicle { allowedTargets = 0; };
        class XYDB_fnc_vehicleCreate { allowedTargets = 0; };
        class XYDB_fnc_updateVehicle { allowedTargets = 0; };
        class XYDB_fnc_vehicleStore { allowedTargets = 0; };
        class XYDB_fnc_vehicleRepaint { allowedTargets = 0; };
        class XYDB_fnc_getLockedVehicles { allowedTargets = 0; };

        class XYDB_fnc_updateHouseTrunk { allowedTargets = 0; };
        class XYDB_fnc_updateHouseContainers { allowedTargets = 0; };

        class XYDB_fnc_handleMessages { allowedTargets = 0; };
        class XYDB_fnc_msgRequest { allowedTargets = 0; };

        class XYDB_fnc_updateJailTime { allowedTargets = 0; };
        class XYDB_fnc_requestJailTime { allowedTargets = 0; };

        class XYDB_fnc_insertGang { allowedTargets = 0; };
        class XYDB_fnc_updateGang { allowedTargets = 0; };
        class XYDB_fnc_removeGang { allowedTargets = 0; };
        class XYDB_fnc_gangBank { allowedTargets = 0; };
        class XYDB_fnc_requestBanklog { allowedTargets = 0; };
        class XYDB_fnc_uidToName { allowedTargets = 0; };

        // CLIENT --> SERVER
        class XY_fnc_log { allowedTargets = 2; };
        class XY_fnc_dangerMarker { allowedTargets = 2; };
        class XY_fnc_robCooldown { allowedTargets = 2; };
        class XY_fnc_addHouse { allowedTargets = 2; };
        class XY_fnc_removeHouse { allowedTargets = 2; };
        class XY_fnc_wantedBounty { allowedTargets = 2; };
        class XY_fnc_wantedAdd { allowedTargets = 2; };
        class XY_fnc_wantedRemove { allowedTargets = 2; };
        class XY_fnc_marketVolume { allowedTargets = 2; };
        class XY_fnc_ctf { allowedTargets = 2; };
        class XY_fnc_bomb { allowedTargets = 2; };
        class XY_fnc_addToKeychain { allowedTargets = 2; };
        class XY_fnc_pollKeychain { allowedTargets = 2; };
        class XY_fnc_managesc { allowedTargets = 2; };
        class XY_fnc_wantedFetch { allowedTargets = 2; };
        class XY_fnc_pollMarketPrices { allowedTargets = 2; };
        class XY_fnc_racingPlayerFinished { allowedTargets = 2; };
        class XY_fnc_racingTools { allowedTargets = 2; };
        class XY_fnc_registerVehicleForDeletion { allowedTargets = 2; };
        class XY_fnc_eventBurnHouse { allowedTargets = 2; };

        // CLIENT --> CLIENT
        class XY_fnc_smartphone { allowedTargets = 1; };
        class XY_fnc_clientMessage { allowedTargets = 1; };
        class XY_fnc_headBag { allowedTargets = 1; };
        class XY_fnc_vehicleEmpd { allowedTargets = 1; };
        class XY_fnc_receiveItem { allowedTargets = 1; };
        class XY_fnc_revived { allowedTargets = 1; };
        class XY_fnc_medicRequest { allowedTargets = 1; };
        class XY_fnc_demoChargeTimer { allowedTargets = 1; };
        class XY_fnc_gangKick { allowedTargets = 1; };
        class XY_fnc_gangInvite { allowedTargets = 1; };
        class XY_fnc_lightHouse { allowedTargets = 1; };
        class XY_fnc_receiveKey { allowedTargets = 1; };
        class XY_fnc_vehicleWarned { allowedTargets = 1; };
        class XY_fnc_clientWireTransfer { allowedTargets = 1; };
        class XY_fnc_flashbang { allowedTargets = 1; };
        class XY_fnc_licenseCheck { allowedTargets = 1; };
        class XY_fnc_drugTest { allowedTargets = 1; };
        class XY_fnc_flashLights { allowedTargets = 1; };
        class XY_fnc_siren { allowedTargets = 1; };
        class XY_fnc_jail { allowedTargets = 1; };
        class XY_fnc_pulloutVeh { allowedTargets = 1; };
        class XY_fnc_moveIn { allowedTargets = 1; };
        class XY_fnc_restrain { allowedTargets = 1; };
        class XY_fnc_robPerson { allowedTargets = 1; };
        class XY_fnc_searchClient { allowedTargets = 1; };
        class XY_fnc_copSearch { allowedTargets = 1; };
        class XY_fnc_ticketPrompt { allowedTargets = 1; };
        class XY_fnc_giveDiff { allowedTargets = 1; };
        class XY_fnc_animSync { allowedTargets = 1; };
        class XY_fnc_knockedOut { allowedTargets = 1; };
        class XY_fnc_robReceive { allowedTargets = 1; };
        class XY_fnc_jumpFnc { allowedTargets = 1; };
        class XY_fnc_removeLicenses { allowedTargets = 1; };
        class XY_fnc_receiveMoney { allowedTargets = 1; };
        class XY_fnc_resetImpoundVars { allowedTargets = 1; };
        class XY_fnc_speedtrapFlash { allowedTargets = 1; };
    };

    class Commands {
        mode = 1;
        jip = 0;

        // CLIENT --> SERVER

        // CLIENT --> CLIENT
        class say3D { allowedTargets = 1; };

        // EVERYTHING ALLOWED
        class setFuel { allowedTargets = 0; };
        class enableSimulation { allowedTargets = 0; };
    };
};