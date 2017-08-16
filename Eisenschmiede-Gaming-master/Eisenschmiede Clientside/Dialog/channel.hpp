class channel{
    idd = 9000;
    name= "channel";
    movingEnable = 0;
    enableSimulation = 1;
    
    class controlsBackground {
        class ES_RscTitleBackground:ES_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        
        class MainBackground:ES_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.6 - (22 / 250);
        };
    };
    
class controls {


        
        class Title : ES_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Channel 7 News";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        
        class Channel7NewsEditText : ES_RscStructuredText
        {
            idc = -1;
            text = "Nachricht:";
            x = 0.12;
            y = 0.4;
            w = 0.2;
            h = 0.1;
        };
        
        class Channel7Edit : ES_RscEdit
        {
            idc = 9001;
            text = "";
            sizeEx = 0.04;
            x = 0.275; 
            y = 0.4;
            w = 0.4; 
            h = 0.04;    
        };
        
        class Channel7Description : ES_RscStructuredText
        {
            idc = -1;
            text = "Diese Nachricht wird an JEDEN gesendet! Du musst sie jedoch bezahlen.";
            x = 0.12;
            y = 0.5;
            w = 0.5;
            h = 0.1;
        };


        class CloseButtonKey : ES_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
        
        class SendButtonKey : ES_RscButtonMenu {
            idc = 9005;
            text = "Senden";
            onButtonClick = "[] call ES_fnc_sendChannel; closeDialog 0;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};
