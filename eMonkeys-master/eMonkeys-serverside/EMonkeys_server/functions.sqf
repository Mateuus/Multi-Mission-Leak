#define CONSTVAR(var) var = compileFinal (if(typeName var == "STRING") then {var} else {str(var)})

TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

publicVariable "TON_fnc_index";

chopshopTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(!([str(_val)] call fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	EMonkeys_c164 = EMonkeys_c164 + _val;
	hint format[""Du hast ein %1 für %2€ verkauft."",_from,[_val] call EMonkeys_fnc_numberText];
	[1] call SOCK_fnc_updatePartial;
	eM_action_inUse = false;
";
publicVariable "chopshopTransfer";

EMonkeys_MPAllowedC = ["EMonkeys_fnc_wantedBounty","TON_fnc_vehicleStore","TON_fnc_getID","EMonkeys_fnc_jailSys","EMonkeys_fnc_wantedRemove","EMonkeys_fnc_wantedAdd","EMonkeys_fnc_ausweissave"
,"EMonkeys_fnc_ausweisdel","TON_fnc_vehicleCreate","TON_fnc_keyManagement","TON_fnc_log","TON_fnc_lottoadd","TON_fnc_dbpaintball","TON_fnc_paintball","TON_fnc_getVehicles","house_inventory_fnc_get_db_gear"
,"TON_fnc_spikeStrip", "HOUSE_fnc_requestSpawnMenu","EMonkeys_fnc_wantedPardon","EMonkeys_fnc_wantedFetch","DB_fnc_queryRequest","DB_fnc_insertRequest","DB_fnc_updatePartial","house_inventory_fnc_update_db_gear"
,"DB_fnc_updateRequest","TON_fnc_chopShopSell","EMonkeys_fnc_updateEconomy","EMonkeys_fnc_updateEconomy","TON_fnc_loadBounties","EMonkeys_fnc_ausweisload","market_fnc_marketInsert","HOUSE_fnc_DBapplyInventory"
,"HOUSE_fnc_DBbuyHouse","HOUSE_fnc_DBgiveKey","HOUSE_fnc_DBimpound","HOUSE_fnc_DBresetKeys","HOUSE_fnc_DBsellHouse","HOUSE_fnc_DBuseFurniture","HOUSE_fnc_requestCommand","EMonkeys_fnc_paintball","TON_fnc_game","TON_fnc_vehicleDead"
,"TON_fnc_vehicleDelete","EMonkeys_fnc_Playerconnect","EMonkeys_fnc_Playerdisconnect","Emonkeys_fnc_generateAirdrop","TON_fnc_addFuelstation","TON_fnc_updateFuelstation","TON_fnc_robFuelstationGlobalReset","TON_fnc_buyVehicle"
,"TON_fnc_parkoutVehicle","TON_fnc_addFuelstationBid","TON_fnc_setNews","TON_fnc_loadBlackboardNews","TON_fnc_auction_selectFuelstations","TON_fnc_openFuelMenu","TON_fnc_getFuelstationRob","TON_fnc_auction_selectDate"
,"TON_fnc_getFuelstationData","TON_fnc_getFuelstationInfo"];

CONSTVAR(EMonkeys_MPAllowedC);

EMonkeys_MPAllowedS = ["EMonkeys_fnc_colorVehicle","TON_fnc_managesc","EMonkeys_fnc_lockVehicle","EMonkeys_fnc_restart","Emonkeys_fnc_setFuel","EMonkeys_fnc_handleGear"];

CONSTVAR(EMonkeys_MPAllowedS);