class shops_menu {
    idd = 2400;
    name= "shops_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            idc = -1;
            x = 0.292708 * safezoneW + safezoneX;
            y = 0.232407 * safezoneH + safezoneY;
            w = 0.413542 * safezoneW;
            h = 0.542593 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class Title: Life_RscTitle
        {
            idc = 2403;
            text = ""; //--- ToDo: Localize;
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.233222 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        //
        class RscText_1004: Life_RscText
        {
            idc = -1;
            x = 0.705219 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.0056771 * safezoneW;
            h = 0.560074 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };

        class RscText_1003: Life_RscText
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.775 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.0101298 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };

        class RscText_1002: Life_RscText
        {
            idc = -1;
            x = 0.288594 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.00515625 * safezoneW;
            h = 0.560074 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };

        class RscText_1001: Life_RscText
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.0101298 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };
        //

        class vasText: Life_RscText {
            idc = -1;
            text = "Merchants Stock"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };

        class vasgText: Life_RscText {
            idc = -1;
            text = "Personal Items"; //--- ToDo: Localize;
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
    };

    class controls {
        class itemList: Life_RscListBox {
            idc = 2401;
            text = "";
            sizeEx = 0.030;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.385 * safezoneH;
        };

        class pItemlist: Life_RscListBox {
            idc = 2402;
            text = "";
            sizeEx = 0.030;
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.385 * safezoneH;
        };

        class buyEdit: Life_RscEdit {
            idc = 2404;
            text = "1";
            sizeEx = 0.030;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class sellEdit: Life_RscEdit {
            idc = 2405;
            text = "1";
            sizeEx = 0.030;
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAddG: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_VS_BuyItem";
            colorBackground[] = {0,0,0,0.7};
            onButtonClick = "[2] call life_fnc_debitCheck";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonRemoveG: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_VS_SellItem";
            colorBackground[] = {0,0,0,0.7};
            onButtonClick = "[4] call life_fnc_debitCheck";
            x = 0.634062 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.665 * safezoneW + safezoneX;
            y = 0.753 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};