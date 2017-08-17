class police_speaker {
    idd = 6969;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class RscTitleBackground: Life_RscText {
            idc = -1;
            x = 14 * GUI_GRID_W + GUI_GRID_X;
            y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 11.5 * GUI_GRID_W;
            h = 18.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };

        class RscText_6969: Life_RscText
        {
            idc = -1;
            text = "POLICE SPEAKER SYSTEM"; //--- ToDo: Localize;
            x = 15 * GUI_GRID_W + GUI_GRID_X;
            y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 9.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.9};
        };
    };

    class controls {
        class RscButton_1600: Life_RscButtonMenu
        {
            idc = 1600;
            text = "Pullovr"; //--- ToDo: Localize;
            onButtonClick = "[] call life_fnc_pullOver";
            x = 15 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1601: Life_RscButtonMenu
        {
            idc = 1601;
            text = "Clear"; //--- ToDo: Localize;
            onButtonClick = "[] call life_fnc_clearStreets";
            x = 20.5 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1602: Life_RscButtonMenu
        {
            idc = 1602;
            text = "ExitVeh"; //--- ToDo: Localize;
            onButtonClick = "[] call life_fnc_exitVehicle";
            x = 15 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1603: Life_RscButtonMenu
        {
            idc = -1;
            text = "Wail"; //--- ToDo: Localize;
            onButtonClick = "[] call life_fnc_wail";
            x = 20.5 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1604: Life_RscButtonMenu
        {
            idc = -1;
            text = "GTFO"; //--- ToDo: Localize;
            onButtonClick = "[] call life_fnc_GTFO";
            x = 20.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1605: Life_RscButtonMenu
        {
            idc = -1;
            text = "iPhoneLewis"; //--- ToDo: Localize;
            onButtonClick = "[] call life_fnc_iPhoneLewis";
            x = 15 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1606: Life_RscButtonMenu
        {
            idc = -1;
            text = ""; //--- ToDo: Localize;
            x = 15 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1607: Life_RscButtonMenu
        {
            idc = -1;
            text = ""; //--- ToDo: Localize;
            x = 20.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1608: Life_RscButtonMenu
        {
            idc = -1;
            text = ""; //--- ToDo: Localize;
            x = 20.5 * GUI_GRID_W + GUI_GRID_X;
            y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1609: Life_RscButtonMenu
        {
            idc = -1;
            text = ""; //--- ToDo: Localize;
            onButtonClick = "";
            x = 15 * GUI_GRID_W + GUI_GRID_X;
            y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
        class RscButton_1610: Life_RscButtonMenu
        {
            idc = -1;
            text = "Close"; //--- ToDo: Localize;
            onButtonClick = "closeDialog 0";
            x = 21 * GUI_GRID_W + GUI_GRID_X;
            y = 21 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorBackground[] = {0,0,0,1};
        };
    };
};