class Life_marker {
    idd = 9000;
    name= "life_marker";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.64;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.64;
            h = 0.3 - (5 / 250);
        };
    };

    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 9001;
            text = "$STR_marker";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MarkerPlace: Life_RscButtonMenu {
            idc = 9015;
            text = "Postaw 1";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[1,false] call life_fnc_copZones;";
            x = 0.11;
            y = 0.27;
            w = 0.2;
            h = (1 / 25);
        };

        class MarkerDelete: Life_RscButtonMenu {
            idc = 9016;
            text = "Usuń 1";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[1,true] call life_fnc_copZones;";
            x = 0.32;
            y = 0.27;
            w = 0.2;
            h = (1 / 25);
        };
		class MarkerPlacee: Life_RscButtonMenu {
            idc = 9017;
            text = "Postaw 2";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[2,false] call life_fnc_copZones;";
            x = 0.11;
            y = 0.32;
            w = 0.2;
            h = (1 / 25);
        };

        class MarkerDeletee: Life_RscButtonMenu {
            idc = 9018;
            text = "Usuń 2";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[2,true] call life_fnc_copZones;";
            x = 0.32;
            y = 0.32;
            w = 0.2;
            h = (1 / 25);
        };
		class MarkerPlaceee: Life_RscButtonMenu {
            idc = 9019;
            text = "Postaw 3";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[3,false] call life_fnc_copZones;";
            x = 0.11;
            y = 0.37;
            w = 0.2;
            h = (1 / 25);
        };

        class MarkerDeleteee: Life_RscButtonMenu {
            idc = 9020;
            text = "Usuń 3";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[3,true] call life_fnc_copZones;";
            x = 0.32;
            y = 0.37;
            w = 0.2;
            h = (1 / 25);
        };
		class MarkerPlacePunkt: Life_RscButtonMenu {
            idc = 9019;
            text = "Big Zone";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[4,false,1000] call life_fnc_copZones;";
            x = 0.11;
            y = 0.42;
            w = 0.2;
            h = (1 / 25);
        };

        class MarkerDeletePunkt: Life_RscButtonMenu {
            idc = 9020;
            text = "Usuń Big Zone";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[4,true] call life_fnc_copZones;";
            x = 0.32;
            y = 0.42;
            w = 0.2;
            h = (1 / 25);
        };
		class MarkerDeleteall: Life_RscButtonMenu {
            idc = 9022;
            text = "Usuń all";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[1,true] call life_fnc_copZones; [2,true] call life_fnc_copZones; [3,true] call life_fnc_copZones; [4,true] call life_fnc_copZones; closeDialog 0; closeDialog 0;";
            x = 0.11;
            y = 0.47;
            w = 0.2;
            h = (1 / 25);
        };

        class CloseButttonKey: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.51 + (1 / 50);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};