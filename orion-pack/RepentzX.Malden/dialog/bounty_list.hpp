class life_bounty_menu {
    idd = 66600;
    name= "life_bounty_menu";
    movingEnable = false;
    enableSimulation = true;
    //onLoad = "[] spawn life_fnc_wantedadd2;";

    class controlsBackground {
        class imagebackground: Life_RscPictureKeepAspect
        {
            idc = -1;
            //moving = 1;
            text = "images\Textures\Phone\phoneBounty.paa";
            x = -0.0625;
            y = -0.3;
            w = 1.1375;
            h = 1.5;
        };
    };

    class controls {
        class Title: Life_RscTitle {
            idc = -1;
            text = "List of Available Set Bounties"; //--- ToDo: Localize;
            x = 15 * GUI_GRID_W + GUI_GRID_X;
            y = 0.87 * GUI_GRID_H + GUI_GRID_Y;
            w = 10.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0};
        };

        class WantedList: Life_RscListBox {
            idc = 77700;
            text = "";
            sizeEx = 0.035;
            onLBSelChanged = "[] spawn life_fnc_bountyGrab";
            colorBackground[] = {0, 0, 0, 0};
            x = 13.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 13.5 * GUI_GRID_W;
            h = 16.5 * GUI_GRID_H;
        };
        /*
        class WantedDetails: Life_RscListBox {
            idc = 24020;
            text = "";
            colorBackground[] = {0, 0, 0, 0};
            
        };
        */
        class BountyPrice: Life_RscText    {
            idc = 24030;
            text = "";
            x = 0.12;
            y = 0.60;
            w = 0.6;
            h = 0.2;
        };

        class CloseButtonKey: Life_RscButtonInvisible {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            tooltip = "Previous Menu";
            x = 0.40294 * safezoneW + safezoneX;
            y = 0.733 * safezoneH + safezoneY;
            w = 0.059 * safezoneW;
            h = 0.049 * safezoneH;
        };

		
        class PardonButtonKey: Life_RscButtonInvisible {
            idc = 24050;
            onButtonClick = "[] call life_fnc_bountyKill;";
            x = 13.5 * GUI_GRID_W + GUI_GRID_X;
            y = 18.67 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0};
        };
    };
};