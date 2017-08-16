#define IDC_LIFE_BAR_Health 444440
#define IDC_LIFE_BAR_Food 444441
#define IDC_LIFE_BAR_Drink 444442
#define IDC_LIFE_BAR_SeatBelt 4203

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
        LIFE_BAR_Health,
        LIFE_BAR_Food,
        LIFE_BAR_Drink,
        LIFE_BAR_SeatBelt
    };

            class LIFE_BAR_Health: Life_RscPicture
            {
                idc=IDC_LIFE_BAR_Health;
                x = 0.952292 * safezoneW + safezoneX;
                y = 0.3 * safezoneH + safezoneY;
                w = 0.0331042 * safezoneW;
                h = 0.0589743 * safezoneH;
                text="";
            };
            class LIFE_BAR_Food: Life_RscPicture
            {
                idc=IDC_LIFE_BAR_Food;
                x = 0.952292 * safezoneW + safezoneX;
                y = 0.4 * safezoneH + safezoneY;
                w = 0.0331042 * safezoneW;
                h = 0.0589743 * safezoneH;
                text="";
            };
            class LIFE_BAR_Drink: Life_RscPicture
            {
                idc=IDC_LIFE_BAR_Drink;
                x = 0.952292 * safezoneW + safezoneX;
                y = 0.5 * safezoneH + safezoneY;
                w = 0.0331042 * safezoneW;
                h = 0.0589743 * safezoneH;
                text="";
            };
            class LIFE_BAR_SeatBelt: Life_RscPicture
            {
                idc=IDC_LIFE_BAR_SeatBelt;
                x = 0.952292 * safezoneW + safezoneX;
                y = 0.6 * safezoneH + safezoneY;
                w = 0.0331042 * safezoneW;
                h = 0.0589743 * safezoneH;
                text="";
            };
};