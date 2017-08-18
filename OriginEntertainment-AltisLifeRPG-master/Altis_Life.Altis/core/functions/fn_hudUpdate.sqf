#include <macro.h>
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_BAR_WANTED 2204
#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
#define IDC_LIFE_WANTED_TEXT 1003
#define IDC_LIFE_BAR_STAMINA 2199
#define IDC_LIFE_STAMINA_TEXT 0999

#define LIFEdisplay (uiNameSpace getVariable ["playerHUD",displayNull])
#define LIFEctrl(ctrl) ((uiNameSpace getVariable ["playerHUD",displayNull]) displayCtrl ctrl)
/*
	File: fn_hudUpdate.sqf
	Author: Dillon "Itsyuka" Modine-Thuen
	
	Description:
	Updates the HUD when it needs to.
*/
private["_bounty","_crime"];
disableSerialization;

if(isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(IDC_LIFE_BAR_STAMINA) progressSetPosition (1 - (getFatigue player));
LIFEctrl(IDC_LIFE_BAR_FOOD) progressSetPosition (1 / (100 / life_hunger));
LIFEctrl(IDC_LIFE_BAR_WATER) progressSetPosition (1 / (100 / life_thirst));
LIFEctrl(IDC_LIFE_BAR_HEALTH) progressSetPosition (1 - (damage player));
if(playerSide == civilian) then
{
	if(oe_wanted_status > 0) then
	{
		LIFEctrl(IDC_LIFE_BAR_WANTED)ctrlSetBackgroundColor [1, 0, 0, .5];
		LIFEctrl(IDC_LIFE_BAR_WANTED) progressSetPosition (100);
		LIFEctrl(IDC_LIFE_WANTED_TEXT) ctrlSetText format["$%1", ([oe_wanted_status] call life_fnc_numberText)];
	}
	else
	{
		LIFEctrl(IDC_LIFE_BAR_WANTED)ctrlSetBackgroundColor [0, 1, 0, .5];
		LIFEctrl(IDC_LIFE_BAR_WANTED) progressSetPosition (100);
		LIFEctrl(IDC_LIFE_WANTED_TEXT) ctrlSetText format["$%1", ([oe_wanted_status] call life_fnc_numberText)];
	};
}
else
{
	LIFEctrl(IDC_LIFE_BAR_WANTED) ctrlShow false;
	LIFEctrl(IDC_LIFE_WANTED_TEXT) ctrlShow false;
	LIFEctrl(IDC_LIFE_PICTURE_WANTED) ctrlShow false;
};

LIFEctrl(IDC_LIFE_STAMINA_TEXT) ctrlsetText format["%1", round((1 - (getFatigue player)) * 100)];
LIFEctrl(IDC_LIFE_FOOD_TEXT) ctrlsetText format["%1", life_hunger];
LIFEctrl(IDC_LIFE_WATER_TEXT) ctrlsetText format["%1", life_thirst];
LIFEctrl(IDC_LIFE_HEALTH_TEXT) ctrlsetText format["%1", round((1 - (damage player)) * 100)];