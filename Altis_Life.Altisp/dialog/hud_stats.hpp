#define INFINITE 1e+1000
 
#define IDC_LIFE_PICTURE_FOOD 1200
#define IDC_LIFE_PICTURE_WATER 1201
#define IDC_LIFE_PICTURE_HEALTH 1202
#define IDC_LIFE_PICTURE_WEIGHT 1204
#define IDC_LIFE_PICTURE_WATERMARK 1205
#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
#define IDC_LIFE_WEIGHT1_TEXT 1004
#define IDC_LIFE_WEIGHT2_TEXT 1005
#define IDC_LIFE_BAR_SeatBelt 4203
/*
    Author: Daniel Stuart

    File: hud_stats.hpp
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
       
				
                LIFE_PICTURE_FOOD,
                LIFE_PICTURE_WATER,
                LIFE_PICTURE_HEALTH,
				LIFE_PICTURE_WEIGHT,
				LIFE_PICTURE_WATERMARK,
                LIFE_FOOD_TEXT,
                LIFE_WATER_TEXT,
                LIFE_HEALTH_TEXT,
				LIFE_WEIGHT1_TEXT,
				LIFE_WEIGHT2_TEXT,
				LIFE_BAR_SeatBelt
 
        };
			
        /* Text */ //0.036
 
        class LIFE_FOOD_TEXT: Life_RscText
        {
                idc = IDC_LIFE_FOOD_TEXT;
                text = "";
                x = 0.960906  * safezoneW + safezoneX;
                y = 0.744 * safezoneH + safezoneY; //..4
                w = 0.050625 ;
                h = 0.034 ;
        };
 
        class LIFE_WATER_TEXT: Life_RscText
        {
                idc = IDC_LIFE_WATER_TEXT;
                text = "";
                x = 0.960906 * safezoneW + safezoneX;
                y = 0.78 * safezoneH + safezoneY;
                w = 0.050625 ;
                h = 0.034 ;
        };
        class LIFE_HEALTH_TEXT: Life_RscText
        {
                idc = IDC_LIFE_HEALTH_TEXT;
                text = "";
                x = 0.960906 * safezoneW + safezoneX;
                y = 0.816 * safezoneH + safezoneY;
                w = 0.050625 ;
                h = 0.034 ;
        };
		
		class LIFE_WEIGHT1_TEXT: Life_RscText
        {
				//colorText[] = {0,1,0,1};
				
                idc = IDC_LIFE_WEIGHT1_TEXT;
                text = "";
				sizeEx = 0.03;
                x = 0.960906 * safezoneW + safezoneX;
                y = 0.852 * safezoneH + safezoneY;//89
                w = 0.050625 ;
                h = 0.034 ;
        };
		class LIFE_WEIGHT2_TEXT: Life_RscText
        {
				//colorText[] = {0,1,0,1};
				
                idc = IDC_LIFE_WEIGHT2_TEXT;
                text = "";
				sizeEx = 0.03;
                x = 0.970906 * safezoneW + safezoneX;
                y = 0.87 * safezoneH + safezoneY;
                w = 0.050625 ;
                h = 0.034 ;
        };
 

        /* Icons */
        
		class LIFE_PICTURE_FOOD: life_RscPicture
        {
                idc = IDC_LIFE_PICTURE_FOOD;
                text = "icons\ico_apple.paa";
                x = 0.942813 * safezoneW + safezoneX;
                y = 0.744 * safezoneH + safezoneY;
                w = 0.03; h = 0.04;
        };
        
		class LIFE_PICTURE_WATER: life_RscPicture
        {
                idc = IDC_LIFE_PICTURE_WATER;
                text = "icons\ico_waterBottle.paa";
                x = 0.942813 * safezoneW + safezoneX;
                y = 0.78 * safezoneH + safezoneY;
                w = 0.03; h = 0.04;
        };
        
		class LIFE_PICTURE_HEALTH: life_RscPicture
        {
                idc = IDC_LIFE_PICTURE_HEALTH;
                text = "icons\health.paa";
                x = 0.942813 * safezoneW + safezoneX;
                y = 0.816 * safezoneH + safezoneY;
                w = 0.03; h = 0.04;
        };
		
		class LIFE_PICTURE_WEIGHT: life_RscPicture
        {
                idc = IDC_LIFE_PICTURE_WEIGHT;
                text = "icons\bag.paa";
                x = 0.942813 * safezoneW + safezoneX;
                y = 0.852 * safezoneH + safezoneY;
                w = 0.03;
				h = 0.04;
        };
		
		class LIFE_PICTURE_WATERMARK: Life_RscPicture
		{
			idc = IDC_LIFE_PICTURE_WATERMARK;
			text = "icons\watermark.paa";
			x = 0.01 * safezoneW + safezoneX;
			y = 0.89 * safezoneH + safezoneY;
			w = 0.128;
			h = 0.128;
		};
		
		class LIFE_BAR_SeatBelt: Life_RscPicture
		{
			idc = IDC_LIFE_BAR_SeatBelt;
			text = "";
			x = 0.952292 * safezoneW + safezoneX;
			y = 0.664333 * safezoneH + safezoneY;
			w = 0.0331042 * safezoneW;
			h = 0.0589743 * safezoneH;
		};
};
