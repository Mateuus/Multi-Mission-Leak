class Life_impound_menu {
    idd = 2800;
    name="life_vehicle_shop";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText    {
            
            idc = -1;
            x = 0.291667 * safezoneW + safezoneX;
            y = 0.233222 * safezoneH + safezoneY;
            w = 0.413802 * safezoneW;
            h = 0.543741 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };

        class MainBackground: Life_RscText {
            idc = -1;
            x = 0.705219 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.0056771 * safezoneW;
            h = 0.560074 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };


        class Title: Life_RscTitle {
            idc = 2801;
            text = "ALTIS INPOUND & STORAGE";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.233222 * safezoneH + safezoneY;
            w = 0.104688 * safezoneW;
            h = 0.0357778 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };

        class RscText_1303: Life_RscText
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.775 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.0101298 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };

        class RscText_10023: Life_RscText
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.0101298 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };

        class RscText_1202: Life_RscText
        {
            idc = -1;
            x = 0.288594 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.00515625 * safezoneW;
            h = 0.560074 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };
        /*
        class VehicleTitleBox: Life_RscText {
            idc = -1;
            text = "$STR_GUI_YourVeh";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.11;
            y = 0.26;
            w = 0.3;
            h = (1 / 25);
        };

        class VehicleInfoHeader: Life_RscText {
            idc = 2830;
            text = "$STR_GUI_VehInfo";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.42;
            y = 0.26;
            w = 0.46;
            h = (1 / 25);
        };*/

        class CloseBtn: Life_RscButtonMenu {
            idc = -1;
            text = "Close"; //--- ToDo: Localize;
            onButtonClick = "closeDialog 0;";
            x = 0.665 * safezoneW + safezoneX;
            y = 0.753 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class RetrieveCar: Life_RscButtonMenu {
            idc = -1;
            onButtonClick = "[] call life_fnc_unimpound;";
            text = "Retrieve Selected Vehicle"; //--- ToDo: Localize;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class SellCar: Life_RscButtonMenu {
            idc = -1;
            onButtonClick = "[] call life_fnc_sellGarage; closeDialog 0;";
            text = "Sell Selected Vehicle"; //--- ToDo: Localize;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.742 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class InsureCar : life_RscButtonMenu { 
            idc = 97480; 
            onButtonClick = "[] call life_fnc_insureCar;"; 
            text = "Buy Vehicle Insurance "; //--- ToDo: Localize;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
        }; 
    };

    class controls {
        class VehicleList: Life_RscListBox {
            idc = 2802;
            text = "";
            //sizeEx = 0.04;
            //colorBackground[] = {0.1,0.1,0.1,0.9};
            onLBSelChanged = "_this call life_fnc_garageLBChange;";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.385 * safezoneH;
        };  
        

        class vehicleInfomationList: Life_RscStructuredText {
            idc = 2803;
            text = "";
            sizeEx = 0.035;
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.385 * safezoneH;
        };
        /*
        class MainBackgroundHider: Life_RscText {
            colorBackground[] = {0,0,0,1};
            idc = 2810;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.7 - (22 / 250);
        };*/
    };
};