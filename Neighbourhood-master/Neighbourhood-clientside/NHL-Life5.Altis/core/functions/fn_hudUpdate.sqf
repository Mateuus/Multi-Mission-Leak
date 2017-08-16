#include <macro.h>
#define IDD_LIFE_MAIN_DISP 2203
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_BAR_LEVEL 2207
#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
#define IDC_LIFE_LEVEL_TEXT 1007
#define GVAR_UINS uiNamespace getVariable
#define LIFEdisplay (GVAR_UINS ["playerHUD",displayNull]) 
#define LIFEctrl(ctrl) ((GVAR_UINS ["playerHUD",displayNull]) displayCtrl ctrl)
/*
	File: fn_hudUpdate.sqf
	Author: Dillon "Itsyuka" Modine-Thuen
	
	Description:
	Updates the HUD when it needs to.
*/
private["_bounty","_crime","_level","_benexp","_exp"];
switch (true) do {

	case (life_erfahrung <= 1):
	{
	
	_level = 0;
	_benexp = 1;
	_exp = 1;
	
	};
	case ((life_erfahrung >= 2) AND (life_erfahrung <=99)):
	{
	
	_level = 0;
	_benexp = 100;
	_exp = life_erfahrung;
	
	};
	case ((life_erfahrung >= 100) AND (life_erfahrung <=249)):
	{
	
	_level = 1;
	_benexp = 250-100;
	_exp = life_erfahrung - 100;
	
	
	
	};
	case ((life_erfahrung >= 250) AND (life_erfahrung <=424)):
	{
	
	_level = 2;
	_benexp = 425-250;
	_exp = life_erfahrung - 250;
	
	
	};
	case ((life_erfahrung >= 425) AND (life_erfahrung <=624)):
	{
	
	_level = 3;
	_benexp = 625-425;
	_exp = life_erfahrung - 425;
	
	};
	case ((life_erfahrung >= 625) AND (life_erfahrung <=849)):
	{
	
	_level = 4;
	_benexp = 850-625;
	_exp = life_erfahrung - 625;
	
	};
	case ((life_erfahrung >= 850) AND (life_erfahrung <=1099)):
	{
	
	_level = 5;
	_benexp = 1100-850;
	_exp = life_erfahrung - 850;
	
	};
	case ((life_erfahrung >= 1110) AND (life_erfahrung <=1374)):
	{
	
	_level = 6;
	_benexp = 1375-1100;
	_exp = life_erfahrung - 1110;
	
	};
	case ((life_erfahrung >= 1375) AND (life_erfahrung <=1674)):
	{
	
	_level = 7;
	_benexp = 1675-1375;
	_exp = life_erfahrung - 1375;
	
	};
	case ((life_erfahrung >= 1675) AND (life_erfahrung <=1999)):
	{
	
	_level = 8;
	_benexp =2000 -1675;
	_exp = life_erfahrung - 1675;
	
	};
	case ((life_erfahrung >= 2000) AND (life_erfahrung <=2399)):
	{
	
	_level = 9;
	_benexp = 2400 - 2000;
	_exp = life_erfahrung - 2000;
	
	};
	case ((life_erfahrung >= 2400) AND (life_erfahrung <=2874)):
	{
	
	_level = 10;
	_benexp = 2875 - 2400;
	_exp = life_erfahrung - 2400;
	
	};
	case ((life_erfahrung >= 2875) AND (life_erfahrung <=3424)):
	{
	
	_level = 11;
	_benexp = 3425 - 2875;
	_exp = life_erfahrung - 2875;
	
	};
	case ((life_erfahrung >= 3425) AND (life_erfahrung <=4049)):
	{
	
	_level = 12;
	_benexp = 4050 - 3425;
	_exp = life_erfahrung - 3425;
	
	};
	case ((life_erfahrung >= 4050) AND (life_erfahrung <=4749)):
	{
	
	_level = 13;
	_benexp = 4750 - 4050;
	_exp = life_erfahrung - 4050;
	
	};
	case ((life_erfahrung >= 4750) AND (life_erfahrung <=5524)):
	{
	
	_level = 14;
	_benexp = 5525 - 4750;
	_exp = life_erfahrung - 4750;
	
	};
	case ((life_erfahrung >= 5525) AND (life_erfahrung <=6374)):
	{
	
	_level = 15;
	_benexp = 6375 -5525;
	_exp = life_erfahrung - 5525;
	
	};
	case ((life_erfahrung >= 6375) AND (life_erfahrung <=7299)):
	{
	
	_level = 16;
	_benexp = 7300 -6375;
	_exp = life_erfahrung - 6375;
	
	};
	case ((life_erfahrung >= 7300) AND (life_erfahrung <=8299)):
	{
	
	_level = 17;
	_benexp = 8300 -7300;
	_exp = life_erfahrung - 7300;
	
	};
	case ((life_erfahrung >= 8300) AND (life_erfahrung <=9374)):
	{
	
	_level = 18;
	_benexp = 9375 -8300;
	_exp = life_erfahrung - 8300;
	
	};
	case ((life_erfahrung >= 9375) AND (life_erfahrung <=10600)):
	{
	
	_level = 18;
	_benexp = 10600 -9375;
	_exp = life_erfahrung - 9375;
	
	};
	
	case (life_erfahrung >= 10600):
	{
	
	_level = 20;
	_benexp = 100000 - 10600;
	_exp = life_erfahrung - 10600;
	
	};
};

disableSerialization;

if(isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(IDC_LIFE_BAR_FOOD) progressSetPosition (1 / (100 / life_hunger));
LIFEctrl(IDC_LIFE_BAR_WATER) progressSetPosition (1 / (100 / life_thirst));
LIFEctrl(IDC_LIFE_BAR_HEALTH) progressSetPosition (1 - (damage player));
LIFEctrl(IDC_LIFE_BAR_LEVEL) progressSetPosition (1 / (_benexp / _exp));

LIFEctrl(IDC_LIFE_FOOD_TEXT) ctrlsetText format["%1", life_hunger];
LIFEctrl(IDC_LIFE_WATER_TEXT) ctrlsetText format["%1", life_thirst];
LIFEctrl(IDC_LIFE_HEALTH_TEXT) ctrlsetText format["%1", round((1 - (damage player)) * 100)];
LIFEctrl(IDC_LIFE_LEVEL_TEXT) ctrlsetText format["%1", _level];
