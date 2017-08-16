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
life_spikestrip = ObjNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
tawvd_addon_disable = true;
life_god = false;
life_frozen = false;
life_save_gear = [];
life_container_activeObj = ObjNull;
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
//life_disablehud = false;
//life_cfnrm_hud_disabled = false;
life_gang_bank_time = 0;

//-- Police dispatch Sounds
dispatch = false;

//--Content for Item pickup
life_pickup_open = false;

//Playtime
life_join_time = serverTime;
life_play_time = 0;

//-- New Life Rule Content
life_nlrtimer_running = false;
life_nlrtimer_stop = false;

//Bounty Hunter Stuff
life_removeBounty = false;

//--Part of showing own tags
//life_nametags = [];

//Cell Phone
life_phone_channel = -1;
life_phone_status = 0; // 0: Idle, 1: ringing, 2: calling, 3: completed
life_ringer = true;
life_phone_target = objNull;
life_phone_caller = objNull;

//-- Fix notifications Error
life_open_notifications  = [];

//Settings
life_settings_enableSidechannel = profileNamespace getVariable["life_enableSidechannel",true];
life_settings_tagson = profileNamespace getVariable["life_settings_tagson",true];
life_settings_revealObjects = profileNamespace getVariable["life_settings_revealObjects",true];
life_settings_viewDistanceFoot = profileNamespace getVariable["life_viewDistanceFoot",1250];
life_settings_viewDistanceCar = profileNamespace getVariable["life_viewDistanceCar",1250];
life_settings_viewDistanceAir = profileNamespace getVariable["life_viewDistanceAir",1250];

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];

//-- Police Bank Accounts
//life_westbankcount = 0;

life_clothing_filter = 0;
life_clothing_uniform = -1;

//Request medic related
Life_medic_requested = false; 
//life_respawn_timer = 60; //Actual time in seconds

// -- Suiciding Vest
life_isSuiciding = false;

// -- Request Medic Timer
//life_request_timer = false;

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
CASH = 0;

life_istazed = false;
life_isdowned = false;
life_isknocked = false;
life_vehicles = [];

life_seatbelt = false;

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
