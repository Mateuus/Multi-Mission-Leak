/*
	Name: Dillon "Itsyuka" Modine-Thuen
	File: ui.hpp
*/
class playerHUD {
	idd = -1;
	duration = 10e10;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[] = {};
	controls[] = {
		//ES_UI_XP,
		ES_UI_BACK,
		//ES_BAR_FOOD,
		//ES_BAR_WATER,
		//ES_BAR_HEALTH,
		ES_BAR_XP,
		//ES_PICTURE_FOOD,
		//ES_PICTURE_WATER,
		//ES_PICTURE_HEALTH,
		//ES_PICTURE_XP,
		//ES_FOOD_TEXT,
		//ES_WATER_TEXT,
		//ES_HEALTH_TEXT,
		//ES_XP_TEXT
	};
	
	class ES_UI_BACK: ES_RscBackground
	{
		colorBackground[] = {0, 0, 0, 0.0};				
		x = 0.917656 * safezoneW + safezoneX;
		y = 0.819 * safezoneH + safezoneY;
		w = 0.0825 * safezoneW;
		h = 0.11 * safezoneH;
	};
/*

	class ES_UI_XP: ES_RscPicture
		{
		idc = 1004;
		text = "";
		x = 0.835792 * safezoneW + safezoneX;
		y = 0.8586 * safezoneH + safezoneY;
		w = 0.159655 * safezoneW;
		h = 0.242 * safezoneH;
	};

	class ES_BAR_FOOD: ES_RscProgress
	{
		colorBar[] = {1,0.502,0,1};
		idc = 2200;
		x = 0.834265 * safezoneW + safezoneX;
		y = 0.8304 * safezoneH + safezoneY;
		w = 0.17041 * safezoneW;
		h = 0.028 * safezoneH;
	};

	class ES_BAR_WATER: ES_RscProgress
	{
		colorBar[] = {0,0.502,1,1};
		idc = 2201;
		x = 0.834265 * safezoneW + safezoneX;
		y = 0.864 * safezoneH + safezoneY;
		w = 0.17041 * safezoneW;
		h = 0.028 * safezoneH;
	};

	class ES_BAR_HEALTH: ES_RscProgress
	{
		colorBar[] = {1,0,0,1};
		idc = 2202;
		x = 0.834265 * safezoneW + safezoneX;
		y = 0.8976 * safezoneH + safezoneY;
		w = 0.17041 * safezoneW;
		h = 0.028 * safezoneH;
	};
/*
	class ES_BAR_XP: ES_RscProgress
	{
		colorBar[] = {1,1,0,1};
		idc = 2203;
		x = 0.834265 * safezoneW + safezoneX;
		y = 0.9312 * safezoneH + safezoneY;
		w = 0.17041 * safezoneW;
		h = 0.028 * safezoneH;
	};

	/* Text 
	class ES_FOOD_TEXT: ES_RscText
	{
		idc = 1000;
		text = "";
		x = 0.838197 * safezoneW + safezoneX;
		y = 0.836 * safezoneH + safezoneY;
		w = 0.0262169 * safezoneW;
		h = 0.014 * safezoneH;
	};

	class ES_WATER_TEXT: ES_RscText
	{
		idc = 1001;
		text = "";
		x = 0.838197 * safezoneW + safezoneX;
		y = 0.8696 * safezoneH + safezoneY;
		w = 0.0262169 * safezoneW;
		h = 0.014 * safezoneH;
	};

	class ES_HEALTH_TEXT: ES_RscText
	{
		idc = 1002;
		text = "";
		x = 0.838197 * safezoneW + safezoneX;
		y = 0.9026 * safezoneH + safezoneY;
		w = 0.0262169 * safezoneW;
		h = 0.014 * safezoneH;
	};
/*
	class ES_XP_TEXT: ES_RscText
	{
		idc = 1003;
		text = "";
		x = 0.838197 * safezoneW + safezoneX;
		y = 0.9378 * safezoneH + safezoneY;
		w = 0.0262169 * safezoneW;
		h = 0.014 * safezoneH;
	};

/*	  Icons 
	class ES_PICTURE_FOOD: ES_RscPicture
	{
		idc = 1200;
		text = "Images\Icons\food.paa";
		x = 0.813494 * safezoneW + safezoneX;
		y = 0.8348 * safezoneH + safezoneY;
		w = 0.0196626; h = 0.028;
	};

	class ES_PICTURE_WATER: ES_RscPicture
	{
		idc = 1201;
		text = "Images\Icons\water.paa";
		x = 0.813494 * safezoneW + safezoneX;
		y = 0.867478 * safezoneH + safezoneY;
		w = 0.0196626; h = 0.028;
	};

	class ES_PICTURE_HEALTH: ES_RscPicture
	{
		idc = 1202;
		text = "Images\Icons\health.paa";
		x = 0.813494 * safezoneW + safezoneX;
		y = 0.9026 * safezoneH + safezoneY;
		w = 0.0196626; h = 0.028;
	};

	class ES_XP_TEXT: ES_RscText
	{
		idc = 1003;
		text = "";
		x = 0.838197 * safezoneW + safezoneX;
		y = 0.9378 * safezoneH + safezoneY;
		w = 0.0262169 * safezoneW;
		h = 0.014 * safezoneH;
	};
	
	class ES_PICTURE_XP: ES_RscPicture
	{
		idc = 1203;
		text = "Images\Icons\xp.paa";
		x = 0.813494 * safezoneW + safezoneX;
		y = 0.9362 * safezoneH + safezoneY;
		w = 0.0196626; h = 0.028;
	};
*/

	
	class ES_BAR_XP: ES_RscProgress
	{
		colorBar[] = {0.753,0.753,0.753,1};
		idc = 2203;
		x = 0.701094 * safezoneW + safezoneX;  
		y = 0.995 * safezoneH + safezoneY;
		w = 0.299062 * safezoneW;      //breite desobjekts
		h = 0.0055 * safezoneH;     // hoehe des objekts
	};
};