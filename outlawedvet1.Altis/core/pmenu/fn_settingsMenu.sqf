#include "..\..\script_macros.hpp"
/*
    File: fn_settingsMenu
    Author: Bryan "Tonic" Boardwine

    Description:
    Setup the settings menu.
*/
if (isNull (findDisplay 2900)) then {
    if (!createDialog "SettingsMenu") exitWith {hint localize "STR_NOTF_menuWillNotOpen";};
};

disableSerialization;

ctrlSetText[2902, format["%1", life_settings_viewDistanceFoot]];
ctrlSetText[2912, format["%1", life_settings_viewDistanceCar]];
ctrlSetText[2922, format["%1", life_settings_viewDistanceAir]];
ctrlSetText[2952, format["%1", life_settings_oviewDistanceFoot]];
ctrlSetText[2962, format["%1", life_settings_oviewDistanceCar]];
ctrlSetText[2972, format["%1", life_settings_oviewDistanceAir]];


/* Set up the sliders */
{
    slidersetRange [(_x select 0),100,8000];
    CONTROL(2900,(_x select 0)) sliderSetSpeed [100,100,100];
    sliderSetPosition [(_x select 0),(_x select 1)];
} forEach [[2901,life_settings_viewDistanceFoot],[2911,life_settings_viewDistanceCar],[2921,life_settings_viewDistanceAir],[2951,life_settings_oviewDistanceFoot],[2961,life_settings_oviewDistanceCar],[2971,life_settings_oviewDistanceAir]];


if (isNil "life_settings_revealObjects") then {
    life_settings_enableNewsBroadcast = profileNamespace setVariable ["life_enableNewsBroadcast",true];
    life_settings_enableSidechannel = profileNamespace setVariable ["life_enableSidechannel",true];
    life_settings_tagson = profileNamespace setVariable ["life_settings_tagson",true];
    life_settings_revealObjects = profileNamespace setVariable ["life_settings_revealObjects",true];
};

CONTROL(2900,2971) cbSetChecked life_settings_enableSidechannel;
CONTROL(2900,2973) cbSetChecked life_settings_enableNewsBroadcast;
CONTROL(2900,2970) cbSetChecked life_settings_tagson;
CONTROL(2900,2972) cbSetChecked life_settings_revealObjects;
