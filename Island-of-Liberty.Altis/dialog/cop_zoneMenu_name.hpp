class life_cop_sperrzone_name {
    idd = 8010;
    name = "life_cop_sperrzone_name";
    movingEnabled = false;
    enableSimulation = true;
    onLoad = "[] spawn { uiSleep 0.2; { private [""_index""]; _index = lbAdd [8012, _x]; lbSetData [8012, _index, _x]; nil } count [""50"",""100"",""200"",""300"",""500"",""1000""]; };";
    
    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.3;
            y = 0.2;
            w = 0.47;
            h = (1 / 25);
        };
        
        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.3;
            y = 0.2 + (11 / 250);
            w = 0.47;
            h = 0.3 - (22 / 250);
        };
    };
    
    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Sperrzone benennen";
            x = 0.3;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        
        class NameEdit: Life_RscEdit 
        {
            idc = 8011;            
            text = "Name...";
            sizeEx = 0.030;
            x = 0.40; y = 0.30;
            w = 0.25; h = 0.03;
        };

        class CreateMarker: Life_RscButtonMenu {
            idc = -1;
            text = "Ok";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "closeDialog 0; [ctrlText 8011, lbData [8012, lbCurSel 8012]] spawn life_fnc_cop_zoneMenu_create;";
            x             = 0.45;
            y             = 0.40;
            w             = (6.25 / 40);
            h             = (1 / 25);
        };

        class Dropdown: Life_RscCombo {
            idc = 8012;
            text = "Radius";
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.35;
            w = 0.103125 * safezoneW;
            h = 0.0165 * safezoneH;
        };
    };
};