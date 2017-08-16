#include "..\script_macros.hpp"
/*
    File: configuration.sqf
    Author:

    Description:
    Master Life Configuration File
    This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_jumpActionTime = time;
life_trunk_vehicle = objNull;
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
life_spikestrip = objNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
tawvd_addon_disable = true;
life_god = false;
life_frozen = false;
life_wu = false;
life_save_gear = [];
life_container_activeObj = objNull;
life_disable_getIn = false;
life_disable_getOut = false;
life_admin_debug = false;
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_preview_light = objNull;
life_pos_exist = false;
life_pos_attach = [];
life_civ_position = [];
life_markers = false;
life_canpay_bail = true;
life_persoReady = false;
life_hakenregeln = false;
life_checking = false;
life_hakenrichtig = false;
life_namenInfo = false;
life_checking_a = false;
life_namen_a = false;
life_hakendaten = false;
life_smartphoneTarget = ObjNull;
life_open_notifications = [];
life_marktinuse = false;
life_gps = false;
life_inInventory = false;
roentgen_in_progress = false;
roentgen_request_accepted = false;
life_hints=[];
nn_last_vehicles = [];
nn_empInUse = false;

//Settings
life_settings_enableSnow = profileNamespace getVariable ["snow",true];
life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_enableNewsBroadcast",true];
life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
life_settings_tagson = profileNamespace getVariable ["life_settings_tagson",true];
life_settings_revealObjects = profileNamespace getVariable ["life_settings_revealObjects",true];
life_settings_viewDistanceFoot = profileNamespace getVariable ["life_viewDistanceFoot",8000];
life_settings_viewDistanceCar = profileNamespace getVariable ["life_viewDistanceCar",8000];
life_settings_viewDistanceAir = profileNamespace getVariable ["life_viewDistanceAir",8000];

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_is_alive = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
life_drink = 0;
life_drug = 0;
CASH = 0;

life_istazed = false;
life_isknocked = false;
life_vehicles = [];

/*
**************************************
****** Placeables Variables *****
**************************************
*/
life_definePlaceables = //Array aller Absperrungen (Cop + Medic)
[
	"RoadCone_F",
	"RoadCone_L_F",
	"RoadBarrier_F",
	"RoadBarrier_small_F",
	"PlasticBarrier_03_orange_F",
	"Land_CncBarrier_stripes_F",
	"Land_PortableLight_single_F",
	"Land_PortableLight_double_F",
	"B_Static_Designator_01_F"
];
life_bar_limit = 100; //Maximale Anzahl Absperrungen pro Person

/*
    Master Array of items?
*/
//Setup variable inv vars.
{
    missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
    _varName = getText(_x >> "variable");
    _sideFlag = getText(_x >> "side");

    missionNamespace setVariable [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

life_prof =["Oil_Prof","Iron_Prof","Copper_Prof","Heroin_Prof","Canabis_Prof","Cocain_Prof","Salt_Prof","Fruit_Prof","Diamond_Prof","Rock_Prof","Sand_Prof"];
{player setVariable [_x,[1,0]];} foreach life_prof;
