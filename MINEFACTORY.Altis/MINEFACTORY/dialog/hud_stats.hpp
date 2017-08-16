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
#define IDC_LIFE_BAR_background 1256
#define IDC_LIFE_BAR_Speaker 3007
#define IDC_LIFE_BAR_civbild 1208
#define IDC_LIFE_BAR_civanzahl 1002
#define IDC_LIFE_BAR_copbild 1215
#define IDC_LIFE_BAR_copanzahl 1004
#define IDC_LIFE_BAR_medbild 1216
#define IDC_LIFE_BAR_medanzahl 1003
#define IDC_LIFE_BAR_ANSCHNALL 4763

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
		LIFE_BAR_FOOD,
		LIFE_BAR_FOOD_RING,
		LIFE_BAR_WATER,
		LIFE_BAR_WATER_RING,
		LIFE_BAR_HEALTH,
		LIFE_BAR_HEALTH_RING,
		LIFE_BAR_FPS,
		LIFE_BAR_ANSCHNALL,
		LIFE_BAR_Speaker,
		LIFE_BAR_civbild,
		LIFE_BAR_civanzahl,
		LIFE_BAR_copbild,
		LIFE_BAR_copanzahl,
		LIFE_BAR_medbild,
		LIFE_BAR_medanzahl
	};
	
		class LIFE_BAR_FOOD_RING: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_FOOD_RING;
			text = "";
			x = 0.408333 * safezoneW + safezoneX;
			y = 0.928833 * safezoneH + safezoneY;
			w = 0.0401042 * safezoneW;
			h = 0.0659743 * safezoneH;
			colorText[] = {0.15,1,0.23,1};
		};
		class LIFE_BAR_FOOD: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_FOOD;
			text = "MINEFACTORY\icons\food.paa";
			x = 0.414063 * safezoneW + safezoneX;
			y = 0.939828 * safezoneH + safezoneY;
			w = 0.0286458 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class LIFE_BAR_HEALTH_RING: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_HEALTH_RING;
			text = "";
			x = 0.482812 * safezoneW + safezoneX;
			y = 0.928833 * safezoneH + safezoneY;
			w = 0.0401042 * safezoneW;
			h = 0.0659743 * safezoneH;
			colorText[] = {0.99,0.1,0.01,1};
		};
		class LIFE_BAR_WATER_RING: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_WATER_RING;
			text = "";
			x = 0.557292 * safezoneW + safezoneX;
			y = 0.928833 * safezoneH + safezoneY;
			w = 0.0401042 * safezoneW;
			h = 0.0659743 * safezoneH;
			colorText[] = {0.02,0.32,0.95,1};
		};
		class LIFE_BAR_WATER: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_WATER;
			text = "MINEFACTORY\icons\water.paa";
			x = 0.563021 * safezoneW + safezoneX;
			y = 0.939828 * safezoneH + safezoneY;
			w = 0.0286458 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class LIFE_BAR_HEALTH: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_HEALTH;
			text = "MINEFACTORY\icons\health.paa";
			x = 0.488542 * safezoneW + safezoneX;
			y = 0.939828 * safezoneH + safezoneY;
			w = 0.0286458 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class LIFE_BAR_Speaker: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_Speaker;
			text = "";
			x = 0.964063 * safezoneW + safezoneX;
			y = 0.510996 * safezoneH + safezoneY;
			w = 0.0286458 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class LIFE_BAR_FPS: Life_RscText
		{
			idc = IDC_LIFE_BAR_FPS;
			text = ""; //--- ToDo: ;
			x = 0.952604 * safezoneW + safezoneX;
			y = 0.950824 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorText[] = {0.15,1,0.23,1};
		};
		class LIFE_BAR_ANSCHNALL: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_ANSCHNALL;
			text = "";
			x = 0.964063 * safezoneW + safezoneX;
			y = 0.609957 * safezoneH + safezoneY;
			w = 0.0286458 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class LIFE_BAR_civbild: RscPicture
		{
			idc = IDC_LIFE_BAR_civbild;
			text = "MINEFACTORY\textures\civilist.paa";
			x = 0.723438 * safezoneW + safezoneX;
			y = 0.00519296 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class LIFE_BAR_copbild: RscPicture
		{
			idc = IDC_LIFE_BAR_copbild;
			text = "MINEFACTORY\textures\polizei.paa";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.00519296 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class LIFE_BAR_medbild: RscPicture
		{
			idc = IDC_LIFE_BAR_medbild;
			text = "MINEFACTORY\textures\arzt.paa";
			x = 0.786458 * safezoneW + safezoneX;
			y = 0.00519296 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class LIFE_BAR_civanzahl: RscText
		{
			idc = IDC_LIFE_BAR_civanzahl;
			text = "0"; //--- ToDo: ;
			x = 0.740625 * safezoneW + safezoneX;
			y = -0.00580276 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class LIFE_BAR_medanzahl: RscText
		{
			idc = IDC_LIFE_BAR_medanzahl;
			text = "0"; //--- ToDo: ;
			x = 0.803646 * safezoneW + safezoneX;
			y = -0.00580276 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class LIFE_BAR_copanzahl: RscText
		{
			idc = IDC_LIFE_BAR_copanzahl;
			text = "0"; //--- ToDo: ;
			x = 0.775 * safezoneW + safezoneX;
			y = -0.00580276 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
};