#define INFINITE 1e+1000
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_PICTURE_FOOD 1200
#define IDC_LIFE_PICTURE_WATER 1201
#define IDC_LIFE_PICTURE_HEALTH 1202
#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
#define IDC_LIFE_BAR_WANTED 2204
#define IDC_LIFE_PICTURE_WANTED 1203
#define IDC_LIFE_WANTED_TEXT 1003
#define IDC_LIFE_PICTURE_WATERMARK 9999
#define IDC_LIFE_STAMINA_TEXT 0999
#define IDC_LIFE_BAR_STAMINA 2199
#define IDC_LIFE_PICTURE_STAMINA 1199

/*
        Name: Dillon "Itsyuka" Modine-Thuen
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
                LIFE_PICTURE_FOOD,
                LIFE_PICTURE_WATER,
                LIFE_PICTURE_HEALTH,
                LIFE_FOOD_TEXT,
                LIFE_WATER_TEXT,
                LIFE_HEALTH_TEXT,
                LIFE_BAR_WANTED,
                LIFE_PICTURE_WANTED,
                LIFE_WANTED_TEXT,
				LIFE_PICTURE_WATERMARK,
				LIFE_PICTURE_STAMINA,
				LIFE_BAR_STAMINA,
				LIFE_STAMINA_TEXT
        };
		
		/* WaterMark */

		class LIFE_PICTURE_WATERMARK: Life_RscPicture
		{
			idc = 9999;
			text = "textures\watermark.paa";
			x = 0.933 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.12 * safezoneH;
		};
 
        /* Background */
        class LIFE_UI_BACK: Life_RscBackground
        {
                colorBackground[] = {0,0,0,0.5};
                x = 0.917656 * safezoneW + safezoneX;
                y = 0.785954 * safezoneH + safezoneY;
                w = 0.0825 * safezoneW;
                h = 0.178721 * safezoneH;
        };
 
        /* Progress Bars */
		class LIFE_BAR_STAMINA: Life_RscProgress
		{
				idc = IDC_LIFE_BAR_STAMINA;
				colorBar[] = {0,0.9,0.9,1};
				colorBackground[] = {0,0,0,0.7};
				x = 0.938281 * safezoneW + safezoneX;
				y = 0.796953 * safezoneH + safezoneY;
				w = 0.061875 * safezoneW;
				h = 0.022 * safezoneH;
		};
        class LIFE_BAR_FOOD: Life_RscProgress
        {
                idc = IDC_LIFE_BAR_FOOD;
				colorBar[] = {0,0.9,0.9,1};
				colorBackground[] = {0,0,0,0.7};
                x = 0.938281 * safezoneW + safezoneX;
                y = 0.83 * safezoneH + safezoneY;
                w = 0.061875 * safezoneW;
                h = 0.022 * safezoneH;
        };
        class LIFE_BAR_WATER: Life_RscProgress
        {
                idc = IDC_LIFE_BAR_WATER;
				colorBar[] = {0,0.9,0.9,1};
				colorBackground[] = {0,0,0,0.7};
                x = 0.938281 * safezoneW + safezoneX;
                y = 0.863 * safezoneH + safezoneY;
                w = 0.061875 * safezoneW;
                h = 0.022 * safezoneH;
        };
        class LIFE_BAR_HEALTH: Life_RscProgress
        {
                idc = 2202;
				colorBar[] = {0,0.9,0.9,1};
				colorBackground[] = {0,0,0,0.7};
                x = 0.938281 * safezoneW + safezoneX;
                y = 0.896 * safezoneH + safezoneY;
                w = 0.061875 * safezoneW;
                h = 0.022 * safezoneH;
        };
		class LIFE_BAR_WANTED: Life_RscProgress
        {
            idc = IDC_LIFE_BAR_WANTED;
            x = 0.938281 * safezoneW + safezoneX;
            y = 0.929 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
			colorBar[] = {1,0,0,0.7};
        };
 
        /* Text */
 
		class LIFE_STAMINA_TEXT: Life_RscText
		{
				idc = IDC_LIFE_STAMINA_TEXT;
				text = "";
				x = 0.958906 * safezoneW + safezoneX;
				y = 0.801353 * safezoneH + safezoneY;
				w = 0.020625 * safezoneW;
				h = 0.011 * safezoneH;
		};
        class LIFE_FOOD_TEXT: Life_RscText
        {
                idc = IDC_LIFE_FOOD_TEXT;
                text = "";
                x = 0.958906 * safezoneW + safezoneX;
                y = 0.8344 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.011 * safezoneH;
        };
        class LIFE_WATER_TEXT: Life_RscText
        {
                idc = IDC_LIFE_WATER_TEXT;
                text = "";
                x = 0.958905 * safezoneW + safezoneX;
                y = 0.8674 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.011 * safezoneH;
        };
        class LIFE_HEALTH_TEXT: Life_RscText
        {
                idc = IDC_LIFE_HEALTH_TEXT;
                text = "";
                x = 0.958906 * safezoneW + safezoneX;
                y = 0.9004 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.011 * safezoneH;
        };
		class LIFE_WANTED_TEXT: Life_RscText
        {
            idc = IDC_LIFE_WANTED_TEXT;
            text = "";
            x = 0.938906 * safezoneW + safezoneX;
            y = 0.9334 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.011 *safezoneH;
        };
 
		/* Icons */
		class LIFE_PICTURE_STAMINA: life_RscPicture
		{
			idc = IDC_LIFE_PICTURE_STAMINA;
			text = "icons\stamina.paa";
			x = 0.922813 * safezoneW + safezoneX;
			y = 0.796953 * safezoneH + safezoneY;
			w = 0.012375 * safezoneW;
			h = 0.0219965 * safezoneH;
		};
        class LIFE_PICTURE_FOOD: life_RscPicture
        {
                idc = IDC_LIFE_PICTURE_FOOD;
                text = "icons\food.paa";
                x = 0.922813 * safezoneW + safezoneX;
                y = 0.83 * safezoneH + safezoneY;
                w = 0.03; h = 0.04;
        };
        class LIFE_PICTURE_WATER: life_RscPicture
        {
                idc = IDC_LIFE_PICTURE_WATER;
                text = "icons\water.paa";
                x = 0.922813 * safezoneW + safezoneX;
                y = 0.863 * safezoneH + safezoneY;
                w = 0.03; h = 0.04;
        };
        class LIFE_PICTURE_HEALTH: life_RscPicture
        {
                idc = IDC_LIFE_PICTURE_HEALTH;
                text = "icons\health.paa";
                x = 0.922813 * safezoneW + safezoneX;
                y = 0.896 * safezoneH + safezoneY;
                w = 0.03; h = 0.04;
        };
		class LIFE_PICTURE_WANTED: life_RscPicture
        {
            idc = IDC_LIFE_PICTURE_WANTED;
            text = "icons\wanted.paa";
            x = 0.922813 * safezoneW + safezoneX;
                y = 0.929 * safezoneH + safezoneY;
                w = 0.03; h = 0.04;
        };
};