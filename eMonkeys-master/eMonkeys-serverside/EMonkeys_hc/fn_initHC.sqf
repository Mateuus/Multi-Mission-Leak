#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
/*
	File: initHC.sqf
	
	Description:
	Initializes key parts for the haedless client to function as a
	receiver for all player-based SQL updates.
*/
EMonkeys_HC_isActive = false;
HC_Async_ExtraLock = false;
HC_Async_Active = false;
EMonkeys_atmcash = 0;
EMonkeys_cash = 0;
Emonkeys_paintball_stats = [];
lotto_spieler = [];
lotto_spielstatus=0;
pb_spieler = [];
pb_spielstatus = 0;
pb_maxspieler = 10;
cheaton = true;
EMonkeys_wanted_list = [];
serv_sv_use = [];
client_session_list = [];

publicVariable "Emonkeys_paintball_stats";
publicVariable "cheaton";

{
	_event = _x;
	_namespaceId = "BIS_stackedEventHandlers_";
	_namespaceEvent = _namespaceId + _event;
	_data = missionNameSpace getVariable [_namespaceEvent, []];
	{
		private "_itemId";
		_itemId	= [_x, 0, "", [""]] call BIS_fnc_param;
		[_itemId,_event] call bis_fnc_removeStackedEventHandler;
	} forEach _data;
} forEach ["oneachframe", "onpreloadstarted", "onpreloadfinished", "onmapsingleclick", "onplayerconnected", "onplayerdisconnected"];

inGameUISetEventHandler ["PrevAction",""];
inGameUISetEventHandler ["Action",""];
inGameUISetEventHandler ["NextAction",""];
player removeAllMPEventHandlers "MPHit";
player removeAllMPEventHandlers "MPKilled";
player removeAllMPEventHandlers "MPRespawn";
removeAllMissionEventHandlers "Draw3D";
removeAllMissionEventHandlers "Loaded";
removeAllMissionEventHandlers "Ended";

onEachFrame {};
(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonDown";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonUp";

EMonkeys_fnc_MPexec = compilefinal preprocessFile "\EMonkeys_hc\functions\network\fn_MPexec.sqf";
//Only need to setup extDB once.
if ( isNil {uiNamespace getVariable "life_sql_id"}) then
{
	_version = "extDB2" callExtension "9:VERSION";
	if(_version isEqualTo "") exitWith {diag_log "EXTDB ERROR:: DLL FILE NOT FOUND ! CHECK THE INSTALLATION !"};
	if((parseNumber _version) < 64) exitWith {diag_log format["EXTDB ERROR:: KOTH NEED VERSION 64 OR HIGHER ! CURRENT VERSION: %1",_version];};
	
	_result = call compile ("extDB2" callExtension "9:ADD_DATABASE:Database2");

	_life_sql_id = str(round(random(999999)));
	life_sql_id = compileFinal _life_sql_id;

	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:Database2:SQL_RAW_v2:%1:ADD_QUOTES",_life_sql_id]);
	"extDB2" callExtension "9:LOCK";
	_lockStatus = "extDB2" callExtension "9:LOCK_STATUS";
	
	if(_lockStatus isEqualTo "[1]") then {
		diag_log "EXTDB:: LOCK SUCCESSFULL";
	} else {
		diag_log "EXTDB:: LOCK FAILED";
	};

	uiNamespace setVariable ["life_sql_id", _life_sql_id];
}
	else
{
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
};

["CALL donatorlvl",1] call DB_fnc_asyncCall;

[] spawn
{
	EMONKEYSPAWNSCHUTZ500 = true;
	_vehiclecount = 0;
	
	_message = "";
	_spamarray = ["M_AT","Box_East_WpsSpecial_F","Box_East_Wps_F","Box_East_Wps_F","Land_Sunshade_F","B_Mortar_01_F","B_HMG_01_F","B_HMG_01_high_F","B_HMG_01_A_F","B_GMG_01_F","B_GMG_01_high_F","B_GMG_01_A_F","B_static_AA_F","B_static_AT_F","B_G_Mortar_01_F","B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_AA_F","B_MBT_01_cannon_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F","B_UAV_02_F","B_UAV_02_CAS_F","B_MRAP_01_gmg_F","B_APC_Wheeled_01_cannon_F","B_MBT_01_TUSK_F","B_UGV_01_rcws_F","O_Mortar_01_F","O_HMG_01_F","O_HMG_01_high_F","O_HMG_01_A_F","O_GMG_01_F","O_GMG_01_high_F","O_GMG_01_A_F","O_static_AA_F","O_static_AT_F","O_G_Mortar_01_F","O_Heli_Light_02_F","O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","O_Plane_CAS_02_F","O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F","O_MBT_02_arty_F","O_UAV_02_F","O_UAV_02_CAS_F","O_MRAP_02_gmg_F","O_APC_Wheeled_02_rcws_F","O_UGV_01_F","O_UGV_01_rcws_F","I_Mortar_01_F","I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_static_AA_F","I_static_AT_F","I_G_Mortar_01_F","I_Heli_light_03_F","I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_AA_F","I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F","I_UAV_02_F","I_UAV_02_CAS_F","I_MRAP_03_gmg_F","I_APC_Wheeled_03_cannon_F","I_UGV_01_F","I_UGV_01_rcws_F,launch_NLAW_F","srifle_GM6_SOS_F","srifle_LRR_F","srifle_LRR_SOS_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F","launch_I_Titan_F","launch_O_Titan_F","launch_Titan_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_Titan_short_F","srifle_LRR_LRPS_F","LMG_Zafir_F","LMG_Zafir_pointer_F"];
	while {true} do
	{
		_vehiclecount = count vehicles;
		waitUntil {(_vehiclecount != count vehicles) && EMONKEYSPAWNSCHUTZ500};
		{
			if ((typeof _x) in _spamarray) then
			{
				deleteVehicle _x;
				_message = "!!! ACHTUNG NICHT ZUGELASSENES FAHRZEUG GESPAWNT !!!";
				[[_message,"SERVER",2],"clientMessage",true,false] call EMonkeys_fnc_mp;
			};
		} forEach vehicles;
		sleep 1;
	};
};

[] execVM "\EMonkeys_hc\eventhandlers.sqf";

//Fuelstation


robFuelstation = false;
publicVariable "robFuelstation";

[] spawn 
{
    sleep 20;
	selectPlayer hc_1;
	diag_log format ["HC||%1",player];
	waitUntil {!isNull player && player == player };
	EMonkeys_HC_isActive = true;
	publicVariable "EMonkeys_HC_isActive";
	
	HC_UID = getPlayerUID vehicle player;
	EMonkeys_HC_isActive = true;
	HC_player = vehicle player;
	publicVariable "HC_player";
	publicVariableServer "HC_UID";
	publicVariable "EMonkeys_HC_isActive";
	[] execFSM "\EMonkeys_hc\FSM\main.fsm";
	[] execFSM "\EMonkeys_hc\FSM\carclean.fsm";
	//[] execFSM "\EMonkeys_hc\FSM\realtime.fsm";
	[] execFSM "\EMonkeys_hc\FSM\fuelstationAuction.fsm";

	if (EMonkeys_server_firststart) then 
	{
		_query = format["CALL resetLifeVehicles%1",altislifehive];
		[_query,1] call DB_fnc_asyncCall;

		_query = "CALL delausweise";
		[_query,1] call DB_fnc_asyncCall;


		_query = "CALL donatorlvl";
		[_query,1] call DB_fnc_asyncCall;

		Emonkeys_fnc_housing_athira_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\radar\marker\housing-athira.sqf";
		Emonkeys_fnc_housing_donator_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\radar\marker\housing-donator.sqf";
		Emonkeys_fnc_housing_insel_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\radar\marker\housing-insel.sqf";
		Emonkeys_fnc_housing_kaval_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\radar\marker\housing-kaval.sqf";
		Emonkeys_fnc_housing_pyr_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\radar\marker\housing-pyr.sqf";
		Emonkeys_fnc_housing_sofia_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\radar\marker\housing-sofia.sqf";
		Emonkeys_fnc_housing_gruppenbasen_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\radar\marker\gruppen-basen.sqf";
		Emonkeys_fnc_markt_marker = compilefinal preprocessFileLineNumbers "core\eMonkeys\radar\marker\markt.sqf";


		Emonkeys_fnc_marker = [Emonkeys_fnc_housing_athira_marker,
		Emonkeys_fnc_housing_donator_marker,
		Emonkeys_fnc_housing_insel_marker,
		Emonkeys_fnc_housing_kaval_marker,
		Emonkeys_fnc_housing_pyr_marker,
		Emonkeys_fnc_housing_sofia_marker,
		Emonkeys_fnc_housing_gruppenbasen_marker,
		Emonkeys_fnc_markt_marker];

		/// craft
		_handle2 = [] spawn  {{_handle1 = [] spawn _x;waitUntil {scriptDone _handle1};}forEach Emonkeys_fnc_marker;};

		Emonkeys_craftitem = [];
		_weaponQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""weapons""' AND active = '1'"; 
		_weaponA = [_weaponQ,2,true] call DB_fnc_asyncCall;  

		Emonkeys_craftitem pushBack _weaponA;
		_magazineQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""magazine""' AND active = '1'"; 
		_magazineA = [_magazineQ,2,true] call DB_fnc_asyncCall;  

		Emonkeys_craftitem pushBack _magazineA;
		_AttachmentsQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""Attachments""' AND active = '1'"; 
		_AttachmentsA = [_AttachmentsQ,2,true] call DB_fnc_asyncCall;  

		Emonkeys_craftitem pushBack _AttachmentsA;
		_zubehoerQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""zubehoer""' AND active = '1'"; 
		_zubehoerA = [_zubehoerQ,2,true] call DB_fnc_asyncCall;  

		Emonkeys_craftitem pushBack _zubehoerA;
		_uniformQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""Kleidung""' AND active = '1'"; 
		_uniformA = [_uniformQ,2,true] call DB_fnc_asyncCall;  

		Emonkeys_craftitem pushBack _uniformA;
		_VesteQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""Veste""' AND active = '1'"; 
		_VesteA = [_VesteQ,2,true] call DB_fnc_asyncCall;  
		
		Emonkeys_craftitem pushBack _VesteA;
		_BackpacksQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""Backpacks""' AND active = '1'"; 
		_BackpacksA = [_BackpacksQ,2,true] call DB_fnc_asyncCall;  

		Emonkeys_craftitem pushBack _BackpacksA;
		_itemsQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""items""' AND active = '1'"; 
		_itemsA = [_itemsQ,2,true] call DB_fnc_asyncCall;  

		Emonkeys_craftitem pushBack _itemsA;
		_vehicleQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""Fahrzeuge""' AND active = '1'"; 
		_vehicleA = [_vehicleQ,2,true] call DB_fnc_asyncCall;  

		Emonkeys_craftitem pushBack _vehicleA;
		_headQ = "SELECT `item`,`resources`,`farbe` FROM craft WHERE typ = '""Kopfbedeckung""' AND active = '1'"; 
		_headA = [_headQ,2,true] call DB_fnc_asyncCall;  

		Emonkeys_craftitem pushBack _headA;
		publicVariable "Emonkeys_craftitem";
		
		//GatherConfig aus der DB
		_gatherDB = "SELECT `name`,`nr`,`items`,`random`,`tool`,`nr_special`,`items_special`,`random_special`,`tool_special` FROM gather_altis WHERE active = '1'"; 
		_gatherCfg = [_gatherDB,2,true] call DB_fnc_asyncCall;
		
		EMonkeys_GatherCfg = _gatherCfg;
		publicVariable "EMonkeys_GatherCfg";
		diag_log format[">>>>>>GatherCfg | %1<<<<<<",EMonkeys_GatherCfg];
		
		diag_log ">>>>>>>Update 0";

		Emonkeys_Market_price = ["SELECT preis, item, differenz, prozent, eventprozent FROM economy",2,true] call DB_fnc_asyncCall;
		
		diag_log format [">>>>>>>Update 1<<<< %1",Emonkeys_Market_price];
		
		eM_market_event = ["SELECT beschreibung FROM economy_events WHERE id='1'",2] call DB_fnc_asyncCall;	
		diag_log format [">>>>>>>Update 2<<<< %1",eM_market_event];
		
		uisleep 15;
		publicVariable "Emonkeys_Market_price";
		publicVariable "eM_market_event";
		[] spawn TON_fnc_initFuelstation;
		EMonkeys_server_firststart = false;
		publicVariable "EMonkeys_server_firststart";

	};	
};

[] execVM "\EMonkeys_hc\Functions\eMonkeys\airdrop\config.sqf";