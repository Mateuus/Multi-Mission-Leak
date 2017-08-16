#include <macro.h>
/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine

	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then {
	if(!createDialog "SettingsMenu") exitWith {hintSilent "Something went wrong, the menu won't open?"};
};
disableSerialization;
((findDisplay 2900)displayCtrl 1002) ctrlSetText format ["Player Name: %1",profileName];
((findDisplay 2900)displayCtrl 1003) ctrlSetText format ["Server Name: %1",serverName];
ctrlSetText[2902,format["%1",life_settings_viewDistanceFoot]];
ctrlSetText[2912,format["%1",life_settings_viewDistanceCar]];
ctrlSetText[2922,format["%1",life_settings_viewDistanceAir]];

/* Set up the sliders */
{
	slidersetRange [(_x select 0),100,8000];
	CONTROL(2900,(_x select 0)) sliderSetSpeed [100,100,100];
	sliderSetPosition [(_x select 0),(_x select 1)];
} forEach [[2901,life_settings_viewDistanceFoot],[2911,life_settings_viewDistanceCar],[2921,life_settings_viewDistanceAir]];

CONTROL(2900,2800) cbSetChecked life_systemChat;
CONTROL(2900,2801) cbSetChecked life_silentMode;
