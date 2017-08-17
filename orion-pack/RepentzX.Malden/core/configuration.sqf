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
life_spikestrip = objNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_action_harvesting = false;
tawvd_addon_disable = true;
life_god = false;
life_frozen = false;
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
life_request_timer = false;
life_banking_isclosing = false;
life_banking_pin = 0;
life_fadeSound = false;
life_removeBounty = false;
life_seatbelt = false;
safezone = false;
life_knockout = false;
life_tied = false;
life_gagged = false;
life_blindfolded = false;
life_has_debit = false;
life_gps_point = "";
life_lastgps_point = "";
life_placeables = [];
life_isSuiciding = false;
life_nlrtimer_running = false;
life_nlrtimer_stop = false;
life_smartphoneTarget = ObjNull;
life_truck_deposit_paid = false;
life_truck_deposit_val = false;
life_deposit_action = false;
life_airhorn = ObjNull;
airhorn_played = false;
life_animal = ObjNull;
animal_played = false;
life_megaphone = ObjNull;
megaphone_played = false;
life_gang_bank_time = 0;
volleyball = ObjNull;
kart_placed = 0;
life_tracked = [];
life_flashlight = false;
life_bloodActionPlaying = false;
life_open_notifications = [];
player setVariable ["Vehicle",objNull,true];
player setVariable ["Job","",true];
player setVariable ["RepairJobDone",false,true];
player setVariable ["JobStarted",false,true];
player setVariable ["Repairing",false,true];
player setVariable ["taskStart",false,true];
player setVariable ["taskStartCiv",false,true];
player setVariable ["tied",false,true];
player setVariable ["isDragging", false, true];

life_dog = objNull;
life_licenseIndex = 0;
life_airstrike = false;
life_dartFired = false;
life_bodyArmor = false; 
life_AdminUniformOn = false;
life_callBackup = true;
life_hiding = false;
life_adminAction = false;
life_PlayerMarkers = false;
life_speakerInUse = false;
life_robbedAlready = false;
life_speakingIcon = 1;

life_cannotRevive = false;
life_firstCombatActive = false;
life_combatTime = 0;
life_copGroup = grpNull; 
life_civGang = grpNull;

//repentz extended maverick

mav_ttm_var_canRepair = 0;
mav_ttm_var_infiniteRepair = 0;
mav_ttm_var_terrorist = 0;
mav_ttm_var_rebel = 0;
mav_ttm_var_loadouts = 0;
mav_ttm_var_home = 0;
mav_ttm_var_air = 0;
mav_ttm_var_advCop = 0;
mav_ttm_var_uranium = 0;
mav_ttm_var_lsd = 0;
mav_ttm_var_relicReward = 0;
mav_ttm_var_relicReward2 = 0;
mav_ttm_var_relicReward3 = 0;
mav_ttm_var_hideBody = 0;

//life_callBackup = true;

// DonkeyPunch Vector Building Variables
BuildPosX = 0;
BuildPosY = 2;
BuildPosZ = 1;
BuildVecYaw = 0;
BuildVecPitch = 0;
BuildVecRoll = 0;
life_container_activeObjClassName = "";

//Settings
life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_enableNewsBroadcast",true];
life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
life_settings_tagson = profileNamespace getVariable ["life_settings_tagson",true];
life_settings_revealObjects = profileNamespace getVariable ["life_settings_revealObjects",true];
life_settings_viewDistanceFoot = profileNamespace getVariable ["life_viewDistanceFoot",1250];
life_settings_viewDistanceCar = profileNamespace getVariable ["life_viewDistanceCar",1250];
life_settings_viewDistanceAir = profileNamespace getVariable ["life_viewDistanceAir",1250];

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
civRDM = 0;
life_drug = 0;

life_istazed = false;
life_isknocked = false;
life_vehicles = [];
life_smuggler_drops = ["sd_0","sd_1","sd_2","sd_3","sd_4","sd_5","sd_6"];

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
