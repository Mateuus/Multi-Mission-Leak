class life_bounty_menu {
    idd = 69690;
    name= "life_bounty_menu";
    movingEnable = false;
    enableSimulation = true;
    //onLoad = "[] spawn life_fnc_wantedadd2;";

    class controlsBackground {
        class EXphone: life_RscPicture
        {
            idc = 3001;

            text = "textures\phone.paa"; //--- ToDo: Localize;
            x = 0.439625 * safezoneW + safezoneX;
            y = 0.14692 * safezoneH + safezoneY;
            w = 0.426562 * safezoneW;
            h = 0.725732 * safezoneH;
        };
        class Title: Life_RscTitle
        {
            idc = -1;

            text = "$STR_Bounty_Title"; //--- ToDo: Localize;
            x = 0.611562 * safezoneW + safezoneX;
            y = 0.276 * safezoneH + safezoneY;
            w = 0.315 * safezoneW;
            h = 0.028 * safezoneH;
            colorText[] = {0.95,0.95,0.95,1};
        };
    };

    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        /*class WantedConnection: Title
        {
            idc = 24040;
            style = 1;
            text = "";
            x = 0.611562 * safezoneW + safezoneX;
            y = 0.248 * safezoneH + safezoneY;
            w = 0.118125 * safezoneW;
            h = 0.028 * safezoneH;
            colorText[] = {0.95,0.95,0.95,1};
        };*/
        class WantedList: Life_RscListBox
        {
            idc = 6969;
            onLBSelChanged = "[] spawn life_fnc_bountyGrab";
            text = "";
            sizeEx = 0.035;
            x = 0.548125 * safezoneW + safezoneX;
            y = 0.316889 * safezoneH + safezoneY;
            w = 0.185937 * safezoneW;
            h = 0.281111 * safezoneH;
        };
        class WantedDetails: Life_RscListBox
        {
            idc = 24020;
            text = "";
            sizeEx = 0.035;
            x = 0.6;
            y = 0.68;
            w = 0.35;
            h = 0.16;
            colorBackground[] = {0,0,0,0};
        };
        class BountyPrice: Life_RscText
        {
            idc = 24030;
            text = "";
            x = 0.548125 * safezoneW + safezoneX;
            y = 0.599111 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class CloseButtonKey: Life_RscButtonMenu
        {
            onButtonClick = "closeDialog 0;";

            idc = 1008;
            text = "$STR_Global_Close";
            x = 0.550312 * safezoneW + safezoneX;
            y = 0.739111 * safezoneH + safezoneY;
            w = 0.0820312 * safezoneW;
            h = 0.028 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.8};
        };
        class PardonButtonKey: Life_RscButtonMenu
        {
            idc = 24050;
            onButtonClick = "[] call life_fnc_bountyKill; closeDialog 0;";

            text = "$STR_Wanted_Pardon";
            x = 0.647187 * safezoneW + safezoneX;
            y = 0.739111 * safezoneH + safezoneY;
            w = 0.0820312 * safezoneW;
            h = 0.028 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.8};
        };
        class ButtonClose: Life_RscButtonInvisible
        {
            onButtonClick = "closeDialog 0;";

            idc = 1012;
            x = 0.601719 * safezoneW + safezoneX;
            y = 0.801 * safezoneH + safezoneY;
            w = 0.0820312 * safezoneW;
            h = 0.0875 * safezoneH;
            colorText[] = {1,1,1,0};
            colorBackground[] = {0,0,0,0};
            tooltip = "Go back"; //--- ToDo: Localize;
        };
    };
};