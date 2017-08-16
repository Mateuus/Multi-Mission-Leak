class life_bounty_Addmenu {
    idd = 240000;
    name= "life_bounty_Addmenu";
    movingEnable = false;
    enableSimulation = true;
    //onLoad = "[] spawn life_fnc_wantedadd2;";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.6 - (22 / 250);
        };
    };

    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_BountyA_Title";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
/*
        class WantedConnection: Title {
            idc = 240400;
            style = 1;
            text = "";
        };
*/
        class PlayerList: Life_RscListBox {
            idc = 240600;
            text = "";
            sizeEx = 0.035;
            //colorBackground[] = {0,0,0,0};
            onLBSelChanged = "";
            x = 0.12;
            y = 0.28;
            w = 0.38;
            h = 0.3;
        };

        class WantedAddL: Life_RscCombo    {
            idc = 240700;
            x = 0.52;
            y = 0.28;
            w = 0.16;
            h = 0.03;
        };

        class CloseButtonKey: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
		/*
        class PardonButtonKey: Life_RscButtonMenu {
            idc = 2405;
            text = "$STR_Wanted_Pardon";
            onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
		*/
        class ButtonWantedAdd: Life_RscButtonMenu {
            idc = 980000;
            //shortcuts[] = {0x00050000 + 2};
            text = "$STR_Wanted_Add";
            onButtonClick = "[] call life_fnc_bountyAddP; closeDialog 0;";
            x = 0.7 - (6.25 / 40);
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};