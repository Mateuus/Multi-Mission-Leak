/*
	@file Version: 1a
	@file name: eventhandlers.sqf
	@file Author: TAW_Tonic
	@file edit: 4/14/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/
#define CONSTVAR(var) var = compileFinal (if(typeName var == "STRING") then {var} else {str(var)})

"EMonkeys_fnc_MP_packet" addPublicVariableEventHandler {[( _this select 0),(_this select 1)] call EMonkeys_fnc_MPexec;};

"EMonkeys_exec_HC" addPublicVariableEventHandler {diag_log format ["%1",_this]; [] Spawn (_this select 1); };

EMonkeys_MPAllowedHC = ["EMonkeys_fnc_wantedBounty","TON_fnc_vehicleStore","TON_fnc_getID","EMonkeys_fnc_jailSys","EMonkeys_fnc_wantedRemove","EMonkeys_fnc_wantedAdd","EMonkeys_fnc_ausweissave"
,"EMonkeys_fnc_ausweisdel","TON_fnc_vehicleCreate","TON_fnc_keyManagement","TON_fnc_log","TON_fnc_lottoadd","TON_fnc_dbpaintball","TON_fnc_paintball","TON_fnc_getVehicles","house_inventory_fnc_get_db_gear"
,"TON_fnc_spikeStrip", "HOUSE_fnc_requestSpawnMenu","EMonkeys_fnc_wantedPardon","EMonkeys_fnc_wantedFetch","DB_fnc_queryRequest","DB_fnc_insertRequest","DB_fnc_updatePartial","house_inventory_fnc_update_db_gear"
,"DB_fnc_updateRequest","TON_fnc_chopShopSell","EMonkeys_fnc_updateEconomy","EMonkeys_fnc_updateEconomy","TON_fnc_loadBounties","EMonkeys_fnc_ausweisload","TON_fnc_spawnVehicle","market_fnc_marketInsert","HOUSE_fnc_DBapplyInventory"
,"HOUSE_fnc_DBbuyHouse","HOUSE_fnc_DBgiveKey","HOUSE_fnc_DBimpound","HOUSE_fnc_DBresetKeys","HOUSE_fnc_DBsellHouse","HOUSE_fnc_DBuseFurniture","HOUSE_fnc_requestCommand","EMonkeys_fnc_paintball","TON_fnc_game","TON_fnc_vehicleDead"
,"TON_fnc_vehicleDelete","EMonkeys_fnc_Playerconnect","EMonkeys_fnc_Playerdisconnect","EMonkeys_fnc_colorVehicle","EMonkeys_fnc_lockVehicle","Emonkeys_fnc_generateAirdrop","TON_fnc_addFuelstation","TON_fnc_updateFuelstation",
"TON_fnc_robFuelstationGlobalReset","TON_fnc_buyVehicle","TON_fnc_parkoutVehicle","TON_fnc_addFuelstationBid","TON_fnc_setNews","TON_fnc_loadBlackboardNews","TON_fnc_auction_selectFuelstations","TON_fnc_openFuelMenu",
"TON_fnc_getFuelstationRob","TON_fnc_auction_selectDate","TON_fnc_getFuelstationData","TON_fnc_getFuelstationInfo"];

CONSTVAR(EMonkeys_MPAllowedHC);
