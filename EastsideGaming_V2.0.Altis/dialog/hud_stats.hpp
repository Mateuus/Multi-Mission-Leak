#define ST_CENTER         0x02
/*
    Author: Daniel Stuart

    File: hud_stats.hpp
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
        LIFE_INFOTEXT,
        Life_RscProgress_HUDFood,
        Life_RscProgress_HUDHealth,
        Life_RscProgress_HUDWater,
		LIFE_PIC_LEBEN,
		LIFE_PIC_ESSEN,
		LIFE_PIC_TRINKEN
    };

    /* Background */
    class LIFE_INFOTEXT: life_RscStructuredtext
	{
		idc = 1000;
		text = "Hier steht eine coole information, welche basti noch einfügt"; //--- ToDo: Localize;
		x = 0.659844 * safezoneW + safezoneX;
		y = 0.973 * safezoneH + safezoneY;
		w = 0.340312 * safezoneW;
		h = 0.022 * safezoneH;
	};

    /* Progress Bars */
    class LIFE_RscProgress_HUDCommon: Life_RscProgress {
        colorFrame[] = {0, 0, 0, 0.8};
        y = 0.972223 * safezoneH + safezoneY;
        w = 0.0462964 * safezoneW;
        h = 0.0222222 * safezoneH;
    };

    class Life_RscProgress_HUDFood: LIFE_RscProgress_HUDCommon {
        idc = 2200;
        colorBar[] = {1,0.816,0,0.65};
        x = 0.886719 * safezoneW + safezoneX;
		y = 0.896 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.011 * safezoneH;
    };

    class Life_RscProgress_HUDHealth: LIFE_RscProgress_HUDCommon {
        idc = 2201;
        colorBar[] = {0.85,0.05,0,0.65};
        x = 0.886719 * safezoneW + safezoneX;
		y = 0.94 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.011 * safezoneH;
    };

    class Life_RscProgress_HUDWater: LIFE_RscProgress_HUDCommon {
        idc = 2202;
        colorBar[] = {0,0.25,0.65,0.65};
        x = 0.886719 * safezoneW + safezoneX;
		y = 0.852 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.011 * safezoneH;
    };
	class LIFE_PIC_LEBEN: life_RscPicture
	{
		idc = -1;
		text = "icons\leben.paa";
		x = 0.860937 * safezoneW + safezoneX;
		y = 0.929 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class LIFE_PIC_ESSEN: life_RscPicture
	{
		idc = -1;
		text = "icons\essen.paa";
		x = 0.860937 * safezoneW + safezoneX;
		y = 0.885 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class LIFE_PIC_TRINKEN: life_RscPicture
	{
		idc = -1;
		text = "icons\trinken.paa";
		x = 0.860937 * safezoneW + safezoneX;
		y = 0.841 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.033 * safezoneH;
	};
};