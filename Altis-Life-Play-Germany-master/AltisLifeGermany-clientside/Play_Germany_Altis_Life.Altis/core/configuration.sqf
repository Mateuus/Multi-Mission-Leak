#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 2; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_action_gathering = false;
life_vdFoot = profileNamespace getVariable["PG_life_vdFoot",viewDistance];
life_vdCar = profileNamespace getVariable["PG_life_vdCar",viewDistance];
life_vdAir = profileNamespace getVariable["PG_life_vdAir",viewDistance];
if (life_vdFoot > 3000) then { life_vdFoot = 3000; };
if (life_vdCar > 3000) then { life_vdCar = 3000; };
if (life_vdAir > 3000) then { life_vdAir = 3000; };
//life_sidechat = profileNamespace getVariable["PG_life_sidechat",true];
life_tagson = profileNamespace getVariable["PG_life_tagson",true];
life_revealObjects = profileNamespace getVariable["PG_life_revealObjects",true];
life_skipIntro = profileNamespace getVariable["PG_life_skipIntro",false];
tawvd_addon_disable = true;

// default group vars
if (isNil "PG_groupMedic") then {PG_groupMedic = grpNull;};
if (isNil "PG_groupAlac") then {PG_groupAlac = grpNull;};
if (isNil "PG_groupThw") then {PG_groupThw = grpNull;};
if (isNil "PG_groupEvent") then {PG_groupEvent = grpNull;};

// Play Germany custom vars
life_schutz = false;

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_maxWeightT = LIFE_SETTINGS(getNumber,"total_maxWeightT");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_water_delivery_in_progress = false;
life_air_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
CASH = 0;

life_istazed = false;
life_vehicles = [];

switch (playerSide) do {
	case west: {
		BANK = 100000; //Starting Bank Money
		life_paycheck = 1500; //Paycheck Amount
	};
	case civilian: {
		BANK = 100000; //Starting Bank Money
		life_paycheck = 1500; //Paycheck Amount
	};

	case independent: {
		BANK = 100000; //Starting Bank Money
		life_paycheck = 1500; //Paycheck Amount
	};

    case east:
    {
        BANK = 500000; //Starting Bank Money
        life_paycheck = 1500; //Paycheck Amount
    };
};

/*
*************************************
****** Play Germany Variables *******
*************************************
*/
//ID/Ausweis
life_idTarget = player;
life_idTime = 0;
//Lizensen
life_lcTarget = player;
life_lcTime = 0;
//Rubberbullets
life_isdowned = false;
life_rubberdamage = 0;
life_isshot = false;
//Vehicle Shop
PG_vShop_logic = objNull;
PG_vShop_veh = objNull;
PG_vShop_cam = objNull;
PG_vShop_camMove = false;
PG_vShop_sPos = [2000,2000,10000]; //Shop pos
PG_vShop_vPos = [2000,2000,10000]; //Vehicle posATL
//Wanzen
life_tracking = false;
life_tracked = [];

//Misc
life_holstered = false;
life_skydive = false;
life_request_cooldown = 0;
PG_newbie = false;
PG_mining = false;
PG_radioPlaying = false;
PG_dpTruck = objNull;
life_hsd = "";
PG_atmMonitoring = false;
PG_knownPersons = [];
PG_donGang = {(group player getVariable ["gang_id",-1]) in [2829,2605,2165,2913,2749,2898,3140,3251,2837,3278]};
PG_warning = 0;
PG_fnc_houseMarkersOn = false;
PG_unblock = false;
PG_kickedOut = false;
PG_taxameterVehicle = objNull;
PG_dummy = objNull;
PG_cam = objNull;
PG_camNum = 2;
IntroInProgress = true;
PG_ATC = false;
PG_ropeSearch = false;
PG_ropingInProgress = true;

//Drug Vars
life_drugged_cocaine = -1;
life_drugged_cocaine_duration = 10;
life_drugged_weed = -1;
life_drugged_weed_duration = 3;

//Cargo system
PG_containers = LIFE_SETTINGS(getArray,"PG_cargoContainers");

/*
	Master Array of items?
*/
//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");

	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "Licenses"));
