#include <macro.h>
/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine

	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then {
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

if("ItemRadio" in (assignedItems  player)) then {
	ctrlSetText[2016,"icons\phone\padfone_1024_hz_settings.paa"];
} else {
	ctrlSetText[2016,"icons\phone\tafel_1024_hz.paa"];
};

disableSerialization;

ctrlSetText[2902, format["%1", life_vdFoot]];
ctrlSetText[2912, format["%1", life_vdCar]];
ctrlSetText[2922, format["%1", life_vdAir]];


/* Set up the sliders */
{
	slidersetRange [SEL(_x,0),100,3000];
	CONTROL(2900,SEL(_x,0)) sliderSetSpeed [100,100,100];
	sliderSetPosition [SEL(_x,0),SEL(_x,1)];
} foreach [[2901,life_vdFoot],[2911,life_vdCar],[2921,life_vdAir]];

//CONTROL(2900,2971) cbSetChecked life_sidechat;
CONTROL(2900,2970) cbSetChecked life_tagson;
CONTROL(2900,2972) cbSetChecked life_revealObjects;
CONTROL(2900,2973) cbSetChecked life_skipIntro;
