#include "..\script_macros.hpp"
/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then {
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

ctrlSetText[2902, format["%1", ES_vdFoot]];
ctrlSetText[2912, format["%1", ES_vdCar]];
ctrlSetText[2922, format["%1", ES_vdAir]];

/* Set up the sliders */
{
	slidersetRange [SEL(_x,0),100,12000];
	CONTROL(2900,SEL(_x,0)) sliderSetSpeed [100,100,100];
	sliderSetPosition [SEL(_x,0),SEL(_x,1)];
} foreach [[2901,ES_vdFoot],[2911,ES_vdCar],[2921,ES_vdAir]];

if(isNil "ES_tagson") then {
	ES_sidechat = true;
	ES_tagson = true;
	ES_revealObjects = true;
};

CONTROL(2900,2971) cbSetChecked ES_sidechat;
CONTROL(2900,2970) cbSetChecked ES_tagson;
CONTROL(2900,2972) cbSetChecked ES_revealObjects;
