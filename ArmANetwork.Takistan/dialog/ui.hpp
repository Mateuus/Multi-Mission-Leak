#define INFINITE 1e+1000
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_BAR_WEIGHT 2203
#define IDC_LIFE_PICTURE_FOOD 1200
#define IDC_LIFE_PICTURE_WATER 1201
#define IDC_LIFE_PICTURE_HEALTH 1202
#define IDC_LIFE_PICTURE_WEIGHT 1203
/*
	Name: Dillon "Itsyuka" Modine-Thuen
	Modified by ArmA.Network
	File: ui.hpp
*/

class playerHUD {
	idd = -1;
	duration = INFINITE;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[] = {};
	controls[] = {
		LIFE_UI_BACK,
		LIFE_BAR_FOOD,
		LIFE_BAR_WATER,
		LIFE_BAR_HEALTH,
		LIFE_BAR_WEIGHT,
		LIFE_PICTURE_FOOD,
		LIFE_PICTURE_WATER,
		LIFE_PICTURE_HEALTH,
		LIFE_PICTURE_WEIGHT
	};

		class LIFE_UI_BACK: Life_RscBackground
		{
			colorBackground[] = {0,0,0,0};
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class LIFE_BAR_HEALTH: Life_RscProgress
		{
			idc = IDC_LIFE_BAR_HEALTH;
			colorBar[] = {0.57,0.11,0.11,1};
			colorBackground[] = {0,0,0,0};
			style = 0x01;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.94715 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.0385 * safezoneH;
		};
		class LIFE_BAR_FOOD: Life_RscProgress
		{
			idc = IDC_LIFE_BAR_FOOD;
			colorBar[] = {0.25,0.53,0.13,1};
			colorBackground[] = {0,0,0,0};
			style = 0x01;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.9488 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.03575 * safezoneH;
		};
		class LIFE_BAR_WATER: Life_RscProgress
		{
			idc = IDC_LIFE_BAR_WATER;
			colorBar[] = {0.1,0.36,0.54,1};
			colorBackground[] = {0,0,0,0};
			style = 0x01;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.94825 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.038225 * safezoneH;
		};
		class LIFE_BAR_WEIGHT: Life_RscProgress
		{
			idc = IDC_LIFE_BAR_WEIGHT;
			colorBar[] = {0.18,0.18,0.18,1};
			colorBackground[] = {0,0,0,0};
			style = 0x01;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.9455 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class LIFE_PICTURE_HEALTH: Life_RscPicture
		{
			idc = IDC_LIFE_PICTURE_HEALTH;
			text = "icons\HealthUI.paa";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class LIFE_PICTURE_FOOD: Life_RscPicture
		{
			idc = IDC_LIFE_PICTURE_FOOD;
			text = "icons\FoodUI.paa";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class LIFE_PICTURE_WATER: Life_RscPicture
		{
			idc = IDC_LIFE_PICTURE_WATER;
			text = "icons\DrinkUI.paa";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class LIFE_PICTURE_WEIGHT: Life_RscPicture
		{
			idc = IDC_LIFE_PICTURE_WEIGHT;
			text = "icons\WeightUI.paa";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
		};
};
