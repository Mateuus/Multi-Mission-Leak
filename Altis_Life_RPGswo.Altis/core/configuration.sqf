#include "..\macros.hpp"
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
DWEV_query_time = time;
DWEV_action_delay = time;
DWEV_trunk_vehicle = Objnull;
DWEV_session_completed = false;
DWEV_garage_store = false;
DWEV_session_tries = 0;
DWEV_net_dropped = false;
DWEV_hit_explosive = false;
DWEV_siren_active = false;
DWEV_siren_active1 = false;
DWEV_siren_active2 = false;
DWEV_clothing_filter = 0;
DWEV_clothing_uniform = -1;
DWEV_redgull_effect = time;
DWEV_redshot_effect = time;
DWEV_traubenzucker_effect = time;
DWEV_kraftriegel_effect = time;
DWEV_kevlar_effect = time;
DWEV_kraftriegel_aktiv = false;
DWEV_redshot_aktiv = false;
DWEV_is_processing = false;
DWEV_bail_paid = false;
DWEV_impound_inuse = false;
DWEV_action_inUse = false;
DWEV_spikestrip = ObjNull;
DWEV_knockout = false;
DWEV_interrupted = false;
DWEV_respawned = false;
DWEV_removeWanted = false;
nn_last_vehicles = [];
nn_empInUse = false;
DWEV_request_timer = false;
DWEV_smartphoneTarget = ObjNull;
DWEV_action_gathering = false;
DWEV_callBackup = true;
DWEV_usekey = false;
DWEV_disable_getIn = false;
DWEV_disable_getOut = false;
DWEV_save_gear = [];
DWEV_flashlight = false;
DWEV_persoReady = false;
DWEV_hakenregeln = false;
DWEV_checking = false;
DWEV_hakenrichtig = false;
DWEV_namenInfo = false;
DWEV_checking_a = false;
DWEV_namen_a = false;
DWEV_hakendaten = false;
DWEV_stranger = false;
DWEV_OwnedApexDLC = false;

if (isNil "DWEV_var_addonVehicles") then {DWEV_var_addonVehicles = false;};

/*
**************************************
****** Placeables Variables *****
**************************************
*/
DWEV_definePlaceables = //Array aller Absperrungen (Cop + Medic)
[
"RoadCone_F",
"RoadCone_L_F",
"RoadBarrier_F",
"RoadBarrier_small_F",
"Land_CncBarrier_stripes_F",
"Land_PortableLight_single_F",
"Land_PortableLight_double_F"
];
DWEV_bar_limit = 10; //Maximale Anzahl Absperrungen pro Person


//Revive constant variables.
__CONST__(DWEV_revive_fee,500); //Fee for players to pay when revived.

//House Limit
__CONST__(DWEV_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(DWEV_gangPrice,100000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(DWEV_gangUpgradeBase,50000); //MASDASDASD
__CONST__(DWEV_gangUpgradeMultipler,2.5); //BLAH

__CONST__(DWEV_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
DWEV_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
DWEV_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
DWEV_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
DWEV_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
DWEV_net_dropped = false;
DWEV_holster_time = 0;
DWEV_holstered = false;
DWEV_hit_explosive = false;
DWEV_siren_active = false;
DWEV_siren_active1 = false;
DWEV_siren_active2 = false;
DWEV_bank_fail = false;
DWEV_use_atm = true;
DWEV_is_arrested = false;
DWEV_delivery_in_progress = false;
DWEV_action_in_use = false;
DWEV_thirst = 100;
DWEV_hunger = 100;
__CONST__(DWEV_paycheck_period,5); //Five minutes
dwf_cash = 0;
__CONST__(DWEV_impound_car,15000);
__CONST__(DWEV_impound_boat,10000);
__CONST__(DWEV_impound_air,25000);
DWEV_istazed = false;
DWEV_isdowned = false;
DWEV_my_gang = ObjNull;
DWEV_vehicles = [];
bank_robber = [];
DWEV_fadeSound = false;
switch ((side player)) do
{
	case west:
	{
		dwf_atmcash = DWEV_Startgeld;
		DWEV_paycheck = 1000;
	};
	case civilian:
	{
		dwf_atmcash = DWEV_Startgeld;
		DWEV_paycheck = 400;
	};

	case independent:
	{
		dwf_atmcash = DWEV_Startgeld;
		DWEV_paycheck = 8334;  // ~100k/h
	};

	case east:
	{
		dwf_atmcash = DWEV_Startgeld;
		DWEV_paycheck = 1000;
	};
};

//Setup variable inv vars.
{
    missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

//Setup License Variables
{
    _varName = getText(_x >> "variable");
    _sideFlag = getText(_x >> "var");

    missionNamespace setVariable [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

DWEV_dp_points = ["dhl_1","dhl_2","dhl_3","dhl_4","dhl_5","dhl_6","dhl_7","dhl_8","dhl_9","dhl_10","dhl_11","dhl_12","dhl_13","dhl_14","dhl_15","dhl_15","dhl_16","dhl_17","dhl_18","dhl_19","dhl_20","dhl_21","dhl_22","dhl_23","dhl_24","dhl_25"];
