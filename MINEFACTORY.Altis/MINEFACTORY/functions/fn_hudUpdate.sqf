#include "..\..\script_macros.hpp"
/*################################
#	(c) 2016 Minefactory         #
#								 #
#	Author: PierreAmyf      	 #
#	Lizenz: Lizenz.txt Lesen!	 #
################################*/

#define INFINITE 1e+1000
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_FOOD_RING 3200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_WATER_RING 3201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_BAR_HEALTH_RING 3202
#define IDC_LIFE_BAR_FPS 1200
#define IDC_LIFE_BAR_Speaker 3007
#define IDC_LIFE_BAR_ANSCHNALL 4763
#define IDC_LIFE_BAR_civanzahl 1002
#define IDC_LIFE_BAR_copanzahl 1004
#define IDC_LIFE_BAR_medanzahl 1003
_fps = diag_fps;	
disableSerialization;
if(isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};

if(!isNil "life_thirst") then 
{
	// Trinken
	if (life_thirst <= 100) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_8.paa";
	};

	if (life_thirst <= 87) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_7.paa";
	};

	if (life_thirst <= 75) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_6.paa";
	};

	if (life_thirst <= 62) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_5.paa";
	};

	if (life_thirst <= 50) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_4.paa";
	};

	if (life_thirst <= 37) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_3.paa";
	};

	if (life_thirst <= 25) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_2.paa";
	};

	if (life_thirst <= 12) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_1.paa";
	};

	if (life_thirst <= 0) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_0.paa";
	};
};

// Leben
if (damage player >= 0) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_8.paa";
};

if (damage player >= 0.1) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_7.paa";
};

if (damage player >= 0.2) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_6.paa";
};
	
if (damage player >= 0.3) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_5.paa";
};
	
if (damage player >= 0.5) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_4.paa";
};
	
if (damage player >= 0.6) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_3.paa";
};
	
if (damage player >= 0.7) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_2.paa";
};

if (damage player >= 0.8) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_1.paa";
};

if (damage player >= 1) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_0.paa";
};

//ESSEN
if(!isNil "life_hunger") then 
{
	if (life_hunger <= 100) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_8.paa";
	};

	if (life_hunger <= 87) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_7.paa";
	};

	if (life_hunger <= 75) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_6.paa";
	};

	if (life_hunger <= 62) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_5.paa";
	};

	if (life_hunger <= 50) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_4.paa";
	};

	if (life_hunger <= 37) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_3.paa";
	};

	if (life_hunger <= 25) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_2.paa";
	};

	if (life_hunger <= 12) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_1.paa";
	};

	if (life_hunger <= 0) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "MINEFACTORY\textures\HUD\ring_0.paa";
	};
};

// ********** Ohrenstöpsel **********
if(!isNil "life_fadeSound") then 
{
	if(life_fadeSound) then
	{
		LIFEctrl(IDC_LIFE_BAR_Speaker) ctrlSetText "MINEFACTORY\textures\HUD\mute.paa";
	} else {
		LIFEctrl(IDC_LIFE_BAR_Speaker) ctrlSetText "";
	};
};

// ********** Anschnallen **********
if(!isNil "life_savelifes") then 
{
	if(life_savelifes) then
	{
		LIFEctrl(IDC_LIFE_BAR_ANSCHNALL) ctrlSetText "MINEFACTORY\textures\HUD\Anschnallen.paa";
	} else {
		LIFEctrl(IDC_LIFE_BAR_ANSCHNALL) ctrlSetText "";
	};
};

// ********** FPS Anzeige **********
LIFEctrl(IDC_LIFE_BAR_FPS) ctrlSetText format["%1",round (_fps)];

// ********** Cop / Med / Civ Anzeige ***********

_side = side player;
_s = "";
_countWest = 0;
_countCiv = 0;
_countindependent = 0;
if(_side == west) then {_s = "Polizei"};
if(_side == civilian) then {_s = "Civilist"};
if(_side == independent) then {_s = "Arzt"};
{
	if(isPlayer _x) then
	{	
		_si = side _x;
		if(_si == civilian) then {_countCiv = _countCiv + 1};
		if(_si == west) then {_countWest = _countWest + 1};
		if(_si == independent) then {_countindependent = _countindependent + 1};
	};
} forEach(playableUnits);


LIFEctrl(IDC_LIFE_BAR_civanzahl) ctrlSetText format["%1",_countCiv];
LIFEctrl(IDC_LIFE_BAR_copanzahl) ctrlSetText format["%1",_countWest];
LIFEctrl(IDC_LIFE_BAR_medanzahl) ctrlSetText format["%1",_countindependent];