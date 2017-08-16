#include <macro.h>

/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine

	Description:
	Setup the settings menu.
*/
private["_countPlayer","_serverName","_player"];
if(isNull (findDisplay 2900)) then {
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

_countPlayer = count playableUnits;
_serverName = serverName;
_player = profileName;
_westside = west countSide playableUnits;
_independentside = independent countSide playableUnits;
_civilianside = civilian countSide playableUnits;

disableSerialization;

ctrlSetText[2902, format["%1", life_vdFoot]];
ctrlSetText[2912, format["%1", life_vdCar]];
ctrlSetText[2922, format["%1", life_vdAir]];

((findDisplay 2900)displayCtrl 1100) ctrlSetStructuredText parseText format ["Player Name: %1<br/>Server Name: %2<br/>Players On: %3",_player,_serverName,_countPlayer];
((findDisplay 2900)displayCtrl 2950) ctrlSetStructuredText parseText format ["Hive #1 <br/>Server Version: 1.0<br/><br/>Players<br/>TSF/UN: %1<br/>Medics: %2<br/>Civilian: %3",_westside,_independentside,_civilianside];

/* Set up the sliders */
{
	slidersetRange [SEL(_x,0),100,12000];
	CONTROL(2900,SEL(_x,0)) sliderSetSpeed [100,100,100];
	sliderSetPosition [SEL(_x,0),SEL(_x,1)];
} forEach [[2901,life_vdFoot],[2911,life_vdCar],[2921,life_vdAir]];

if(isNil "life_tagson") then {
	life_sidechat = true;
	life_tagson = true;
	life_revealObjects = true;
};

CONTROL(2900,2971) cbSetChecked life_sidechat;
CONTROL(2900,2970) cbSetChecked life_tagson;
CONTROL(2900,2972) cbSetChecked life_revealObjects;
