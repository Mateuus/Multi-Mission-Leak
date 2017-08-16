#include "script_macros.hpp"
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
ES_vehicles = [];
ES_DialogSpawn = true;
ES_query_time = time;
ES_action_delay = time;
ES_trunk_vehicle = Objnull;
ES_session_completed = false;
ES_garage_store = false;
ES_session_tries = 0;
ES_net_dropped = false;
ES_siren_active = false;
ES_clothing_filter = 0;
ES_clothing_uniform = -1;
ES_redgull_effect = time;
ES_is_processing = false;
ES_bail_paid = false;
ES_impound_inuse = false;
ES_action_inUse = false;
ES_spikestrip = ObjNull;
ES_respawn_timer = 1;
ES_knockout = false;
ES_interrupted = false;
ES_respawned = false;
ES_removeWanted = false;
ES_action_gathering = false;
ES_let_tracked = [0,0,0];
ES_medicRequest = true;
ES_vdFoot = viewDistance;
ES_vdCar = viewDistance;
ES_vdAir = viewDistance;
ES_drink = 0;
ES_god = false;
ES_frozen = false;
ES_markers = false;
ES_markersvaar = false;
ES_sir_kav = false;
ES_sir_sof = false;
ES_sir_pyr = false;
ES_sir_at = false;
ES_sir_kavkr = false;
ES_sir_kavhq = false;
ES_sir_kavseu = false;
ES_sir_test = false;
ES_sir_all = false;
ES_sir_basti = false;
ES_vehmarkers = false;
ES_unsichtbar = false;
ES_ArtemTooLALT = false;
GeldGeben = true;
DarfKaufen = true;
DarfVerkaufen = true;
DarfEinzahlen = true;
DarfNehmen = true;
DarfTransfern = true;
DarfAutoVerkaufen = true;
DarfLockPick = true;
DarfWanted = true;
DarfMuell = true;
DarfGangGeldZahlen = true;
DarfGangGeldNehmen = true;
Bugreport = true;
WOoOoOoW = true;
ES_smoke = false;
ES_kw_athira = false; 
ES_kw_kavala = false; 
ES_kw_sofia = false; 
ES_kw_kavala = false;
ES_phone_channel = -1;
ES_phone_status = 0; // 0: Idle, 1: ringing, 2: calling, 3: completed
ES_tracked = [];
ES_action_pickaxeInUse = false;
ES_fadeSound = false;
tawvd_addon_disable = true;
ES_bloodActionPlaying = false;
HundWufWuf = true;
ES_action_gathering = false;
ES_synced = false;
VehFlip = true;
BlaulichtMedic = false;
HaloJump_Jump = false;
Cop_Kampfansage = false;
Med_Hupe = false;
Med_HupeAn = false;
BinImPaintball = false;
ES_married = "";
ES_BankCode = false;
ES_Einsatzschild = false;
ES_EinsatzschildInUse = false;
BinImShop = false;
SmokePlayer = false;

nn_last_vehicles = [];
nn_empInUse = false;

ES_xp_cop = 0;
ES_xp_med = 0;
ES_xp_civ = 0;
ES_xp_lvl = 0;

ES_clothing_purchase = [-1,-1,-1,-1,-1];

ES_maxWeight = ES_SETTINGS(getNumber,"total_maxWeight");
ES_maxWeightT = ES_SETTINGS(getNumber,"total_maxWeightT");
ES_carryWeight = 0;

ES_net_dropped = false;
ES_use_atm = true;
ES_is_arrested = false;
ES_delivery_in_progress = false;
ES_thirst = 100;
ES_hunger = 100;
ES_cash = 0;

ES_istazed = false;

{
	missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");
	
	missionNamespace setVariable [LICENSE_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "Licenses"));