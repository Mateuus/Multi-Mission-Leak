#define F(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
};

class CfgRemoteExec {
	class Functions {
		mode = 2;
		jip = 1;

		// Maverick functions
		#include "..\maverick\maverick_remoteExec_master.cpp"
		
		/* ANYONE only functions */
		F(ES_fnc_jail,1)
		F(ES_fnc_moveIn,1)
		F(ES_fnc_restrain,1)
		F(ES_fnc_robPerson,1)
		F(ES_fnc_searchclient,1)
		F(ES_fnc_player_query,1)
		F(ES_fnc_knockedOut,1)
		F(ES_fnc_robReceive,1)
		F(ES_fnc_tazeSound,1)
		F(ES_fnc_copSiren,1)
		F(ES_fnc_medicSiren,1)
		F(ES_fnc_giveDiff,1)
		F(ES_fnc_gangInvite,1)
		F(ES_fnc_clientGangKick,1)
		F(ES_fnc_clientGangLeader,1)
		F(ES_fnc_clientGangLeft,1)
		F(ES_fnc_lightHouse,1)
		F(ES_fnc_medicRequest,1)
		F(ES_fnc_revived,1)
		F(ES_fnc_receiveItem,1)
		F(ES_fnc_receiveMoney,1)
		F(ES_fnc_clientGetKey,1)
		F(ES_fnc_soundDevice,1)
		F(ES_fnc_wireTransfer,1)
		F(ES_fnc_pickupMoney,1)
		F(ES_fnc_pickupItem,1)
		F(ES_fnc_gangCreated,1)
		F(ES_fnc_gangDisbanded,1)
		F(ES_fnc_jailMe,1)
		F(SOCK_fnc_dataQuery,1)
		F(SOCK_fnc_insertPlayerInfo,1)
		F(SOCK_fnc_requestReceived,1)
		F(ES_fnc_adminid,1)
		F(ES_fnc_impoundMenu,1)
		F(ES_fnc_garageRefund,1)
		F(ES_fnc_addVehicle2Chain,1)
		F(ES_fnc_vehicleAnimate,1)
		F(ES_fnc_spikeStripEffect,1)
		F(ES_fnc_bountyReceive,1)
		F(ES_fnc_wantedList,1)
		F(ES_fnc_removeLicenses,1)
		F(ES_fnc_admininfo,1)
		F(ES_fnc_clientMessage,1)
		F(ES_fnc_licenseCheck,1)
		F(ES_fnc_licenseRead,1)
		F(ES_fnc_copSearch,1)
		F(ES_fnc_copLights,1)
		F(ES_fnc_ticketPrompt,1)
		F(ES_fnc_ticketPaid,1)
		F(ES_fnc_freezePlayer,1)
		F(ES_fnc_seizeObjects,1)

		/* CLIENT only functions */
		F(bis_fnc_execvm,2)
		F(ES_fnc_wantedBounty,2)
		F(ES_fnc_getID,2)
		F(ES_fnc_jailSys,2)
		F(ES_fnc_wantedRemove,2)
		F(ES_fnc_wantedAdd,2)
		F(ES_fnc_insertGang,2)
		F(ES_fnc_removeGang,2)
		F(ES_fnc_updateGang,2)
		F(ES_fnc_updateHouseTrunk,2)
		F(ES_fnc_sellHouse,2)
		F(ES_fnc_managesc,2)
		F(ES_fnc_spikeStrip,2)
		F(ES_fnc_wantedPardon,2)
		F(ES_fnc_wantedFetch,2)
		F(ES_fnc_queryRequest,2)
		F(ES_fnc_insertRequest,2)
		F(ES_fnc_updatePartial,2)
		F(ES_fnc_updateRequest,2)
		F(ES_fnc_chopShopSell,2)
		F(ES_fnc_setObjVar,2)
		F(ES_fnc_keyManagement,2)
		F(ES_fnc_vehicleDelete,2)
		F(ES_fnc_spawnVehicle,2)
		F(ES_fnc_getVehicles,2)
		F(ES_fnc_vehicleStore,2)
		F(ES_fnc_pickupAction,2)
		F(ES_fnc_cleanupRequest,2)
		F(ES_fnc_updateHouseContainers,2)
		F(ES_fnc_vehicleCreate,2)
		
		/* Functions for everyone */
		F(ES_fnc_broadcast,0)
		F(ES_fnc_animSync,0)
		F(ES_fnc_demoChargeTimer,0)
		F(ES_fnc_corpse,0)
		F(ES_fnc_colorVehicle,0)
		F(ES_fnc_lockVehicle,0)
		F(ES_fnc_setTexture,0)
		F(ES_fnc_flashbang,0)
		F(ES_fnc_jumpFnc,0)
		F(ES_fnc_setFuel,0)
		F(ES_fnc_pulloutVeh,0)
		F(ES_fnc_pushFunction,0)
		F(ES_fnc_simDisable,0)
		F(mav_convoy_fnc_addTriggerHandlers,0)

	};
	
	class Commands {
		mode = 2;
		jip = 0;
		
		F(setFuel,0)
		F(addWeapon,0)
		F(addMagazine,0)
		F(addPrimaryWeaponItem,0)
		F(addHandgunItem,0)
	};
};