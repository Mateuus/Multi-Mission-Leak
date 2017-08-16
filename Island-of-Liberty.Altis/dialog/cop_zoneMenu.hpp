class life_cop_sperrzone
{
    idd = 8000;
    name = "life_cop_sperrzone";
    movingenable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class Life_RscTitleBackground:Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        
        class MainBackground:Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.6 - (22 / 250);
        };
    };
    
    class controls {

        
        class Title : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Sperrzonen";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        
        class SafezoneList : Life_RscListBox 
        {
            idc = 8001;
            text = "";
            sizeEx = 0.035;
            
            x = 0.12; y = 0.26;
            w = 0.56; h = 0.370;
        };

        class CloseButtonKey : Life_RscButtonMenu {
            idc = -1;
            text = "Schliessen";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
        
        class Create : Life_RscButtonMenu {
            idc = -1;
            text = "Erstellen";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "closeDialog 0; createDialog ""life_cop_sperrzone_name"";";
            x = 0.11;
            y = 0.69;
            w = (8.25 / 40);
            h = (1 / 25);
        };
        
        class Remove : Life_RscButtonMenu {
            idc = 8002;
            text = "Löschen";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "closeDialog 0; [lbData [8001, (lbCurSel 8001)]] call life_fnc_cop_zoneMenu_remove;";
            x             = 0.48;
            y             = 0.69;
            w             = (8.25 / 40);
            h             = (1 / 25);
        };
    };
};