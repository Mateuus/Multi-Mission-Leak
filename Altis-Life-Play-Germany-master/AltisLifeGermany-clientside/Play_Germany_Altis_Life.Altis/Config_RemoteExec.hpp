#define F(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExecCommands {};
class CfgRemoteExec {
	class Functions {
		mode = 1;
		jip = 1;

		/* Client only functions */
		// SOCKS
		F(SOCK_fnc_dataQuery,CLIENT)
		F(SOCK_fnc_insertPlayerInfo,CLIENT)
		F(SOCK_fnc_requestReceived,CLIENT)
		
		// life
		F(life_fnc_jail,CLIENT)
		F(life_fnc_moveIn,CLIENT)
		F(life_fnc_restrain,CLIENT)
		F(life_fnc_robPerson,CLIENT)
		F(life_fnc_searchClient,CLIENT)
		F(life_fnc_knockedOut,CLIENT)
		F(life_fnc_robReceive,CLIENT)
		F(life_fnc_tazeSound,CLIENT)
		F(life_fnc_copSiren,CLIENT)
		F(life_fnc_copSiren2,CLIENT)
		F(life_fnc_medicSiren,CLIENT)
		F(life_fnc_medicSiren2,CLIENT)
		F(life_fnc_giveDiff,CLIENT)
		F(life_fnc_gangInvite,CLIENT)
		F(life_fnc_lightHouse,CLIENT)
		F(life_fnc_medicRequest,CLIENT)
		F(life_fnc_copMedicRequest,CLIENT)
		F(life_fnc_revived,CLIENT)
		F(life_fnc_receiveItem,CLIENT)
		F(life_fnc_receiveMoney,CLIENT)
		F(life_fnc_soundDevice,CLIENT)
		F(life_fnc_wireTransfer,CLIENT)
		F(life_fnc_pickupMoney,CLIENT)
		F(life_fnc_pickupItem,CLIENT)
		F(life_fnc_gangCreated,CLIENT)
		F(life_fnc_gangDisbanded,CLIENT)
		F(life_fnc_jailMe,CLIENT)
		F(life_fnc_adminid,CLIENT)
		F(life_fnc_impoundMenu,CLIENT)
		F(life_fnc_garageRefund,CLIENT)
		F(life_fnc_addVehicle2Chain,CLIENT)
		F(life_fnc_vehicleAnimate,CLIENT)
		F(life_fnc_spikeStripEffect,CLIENT)
		F(life_fnc_bountyReceive,CLIENT)
		F(life_fnc_wantedList,CLIENT)
		F(life_fnc_removeLicenses,CLIENT)
		F(life_fnc_admininfo,CLIENT)
		F(life_fnc_licenseCheck,CLIENT)
		F(life_fnc_licenseRead,CLIENT)
		F(life_fnc_copSearch,CLIENT)
		F(life_fnc_copLights,CLIENT)
		F(life_fnc_ticketPrompt,CLIENT)
		F(life_fnc_ticketPaid,CLIENT)
		F(life_fnc_copLostMarker,CLIENT)
		F(life_fnc_licensesRead,CLIENT)
		F(life_fnc_seizePlayerWeaponAction,CLIENT)
		F(life_fnc_vehicleEmpd,CLIENT)
		F(life_fnc_vehicleWarned,CLIENT)
		F(life_fnc_simDisable,CLIENT)
		F(life_fnc_infoTastenbelegung,CLIENT)
		F(life_fnc_buyHouse2,CLIENT)
		F(life_fnc_wantedInfo,CLIENT)
		F(life_fnc_webcamHouse,CLIENT)
		
		// TON
		F(TON_fnc_player_query,CLIENT)
		F(TON_fnc_clientGangKick,CLIENT)
		F(TON_fnc_clientGangLeader,CLIENT)
		F(TON_fnc_clientGetKey,CLIENT)
		F(TON_fnc_clientMessage,CLIENT)
		
		// PG
		F(PG_fnc_IDshown,CLIENT)
		F(PG_fnc_receiveMessage,CLIENT)
		F(PG_fnc_deliverMessage,CLIENT)
		F(PG_fnc_teargas,CLIENT)
		
		//BIS
		F(BIS_fnc_showNotification,CLIENT)
		
		
		/* Server only functions */
		// bis
		F(bis_fnc_execvm,SERVER)
		
		// TON
		F(TON_fnc_getID,SERVER)
		F(TON_fnc_insertGang,SERVER)
		F(TON_fnc_removeGang,SERVER)
		F(TON_fnc_updateGang,SERVER)
		F(TON_fnc_updateHouseTrunk,SERVER)
		F(TON_fnc_sellHouse,SERVER)
		F(TON_fnc_managesc,SERVER)
		F(TON_fnc_spikeStrip,SERVER)
		F(TON_fnc_chopShopSell,SERVER)
		F(TON_fnc_setObjVar,SERVER)
		F(TON_fnc_keyManagement,SERVER)
		F(TON_fnc_vehicleDelete,SERVER)
		F(TON_fnc_spawnVehicle,SERVER)
		F(TON_fnc_getVehicles,SERVER)
		F(TON_fnc_vehicleStore,SERVER)
		F(TON_fnc_pickupAction,SERVER)
		F(TON_fnc_cleanupRequest,SERVER)
		F(TON_fnc_updateHouseContainers,SERVER)
		F(TON_fnc_logIt,SERVER)
		F(TON_fnc_changePrice,SERVER)
		F(TON_fnc_playerLogged,SERVER)
		F(TON_fnc_getUpdate,SERVER)
		F(TON_fnc_preCheckHouse,SERVER)
		F(TON_fnc_addHouse,SERVER)
		F(TON_fnc_updateHouseSecurity,SERVER)
		F(TON_fnc_msgRequest,SERVER)
		F(TON_fnc_cleanupMessages,SERVER)
		F(TON_fnc_vehicleCreate,SERVER)
		F(TON_fnc_upgradeSecurity,SERVER)
		
		// DB
		F(DB_fnc_queryRequest,SERVER)
		F(DB_fnc_insertRequest,SERVER)
		F(DB_fnc_updatePartial,SERVER)
		F(DB_fnc_updateRequest,SERVER)
		
		// life
		F(life_fnc_wantedBounty,SERVER)
		F(life_fnc_jailSys,SERVER)
		F(life_fnc_wantedRemove,SERVER)
		F(life_fnc_wantedAdd,SERVER)
		F(life_fnc_wantedPardon,SERVER)
		F(life_fnc_wantedFetch,SERVER)
		F(life_fnc_wantedCrimes,SERVER)
		F(life_fnc_wantedProfUpdate,SERVER)
		
		// SPY
		F(SPY_fnc_observe,SERVER)
		F(SPY_fnc_cookieJar,SERVER)
		
		// PGSERV
		F(PGSERV_fnc_initLights,SERVER)
		F(PGSERV_fnc_vehicleRepaint,SERVER)
		F(PGSERV_fnc_hideObjectGlobal,SERVER)
		F(PGSERV_fnc_monitorHeli,SERVER)
		F(PGSERV_fnc_monitorCorpse,SERVER)
		F(PGSERV_fnc_captureRadioCell,SERVER)
		F(PGSERV_fnc_handleMessages,SERVER)
		//Events
		F(PGSERV_fnc_event_race,SERVER)
		F(PGSERV_fnc_Altis_Rennstrecke,SERVER)
		F(PGSERV_fnc_Altis_Start_Flughafen_Event,SERVER)
		F(PGSERV_fnc_Altis_LMS_GhostHotel,SERVER)
		
		// king
		F(king_fnc_gambleJackpotWon,SERVER)
		F(king_fnc_gambleJackpotAdd,SERVER)
		
		
		/* Functions for everyone */
		// life
		F(life_fnc_broadcast,ANYONE)
		F(life_fnc_animSync,ANYONE)
		F(life_fnc_demoChargeTimer,ANYONE)
		F(life_fnc_corpse,ANYONE)
		F(life_fnc_colorVehicle,ANYONE)
		F(life_fnc_lockVehicle,ANYONE)
		F(life_fnc_setTexture,ANYONE)
		F(life_fnc_flashbang,ANYONE)
		F(life_fnc_jumpFnc,ANYONE)
		F(life_fnc_setFuel,ANYONE)
		F(life_fnc_pulloutVeh,ANYONE)
		F(life_fnc_pushFunction,ANYONE)
		F(life_fnc_clientSound,ANYONE)
		F(life_fnc_weedSmoke,ANYONE)
		F(life_fnc_update,ANYONE)
		
		// PG
		F(PG_fnc_hideObject,ANYONE)
		F(PG_fnc_vehicleAddEVH,ANYONE)
		F(PG_fnc_armageddon,ANYONE)
		F(PG_fnc_lights,ANYONE)
		F(PG_fnc_lockCargo,ANYONE)
		
		// SPY
		F(SPY_fnc_notifyAdmins,ANYONE)
	};
	
	class Commands {
		mode = 1;
		jip = 0;
		
		F(setFuel,ANYONE)
		F(addWeapon,ANYONE)
		F(addMagazine,ANYONE)
		F(addPrimaryWeaponItem,ANYONE)
		F(addHandgunItem,ANYONE)
	};
};