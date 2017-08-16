// TFR Variables API
tf_no_auto_long_range_radio = true; 
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;

StartProgress = false;
enableSaving[false,false];
 
life_versionInfo = "Takistan Life RPG 0.0.7";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "effect.sqf";
[] execVM "core\noMineMarkers.sqf";
[] execVM "fog.sqf";

StartProgress = true;

[] spawn life_fnc_fuelUsage;

if(!isDedicated) exitWith{};
Tower2 setVariable ["eg_terror", false, true];