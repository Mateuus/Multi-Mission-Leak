#define BGX 0.35
#define BGY 0.2
#define BGW 0.46

class pInteraction_Menu {
    idd = 37400;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class RscTitleBackground: life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = BGX;
            y = BGY;
            w = BGW;
            h = (1 / 25);
        };

        class MainBackground: life_RscText {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = BGX;
            y = BGY + (11 / 250);
            w = BGW;
            h = 0.6 - (22 / 250) + 0.05;
        };

        class Title: life_RscTitle    {
            colorBackground[] = {0,0,0,0};
            idc = 37401;
            text = "$STR_pInAct_Title";
            x = BGX;
            y = BGY;
            w = BGW;
            h = (1 / 25);
        };
    };

    class controls {
        class ButtonClose: Life_RscButtonMenu {
            idc = -1;
            //shortcuts[] = {0x00050000 + 2};
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = BGX;
            y = 0.8 - (1 / 25) + 0.05;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonOne: Life_RscButtonMenu {
            idc = 37450;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.025;
            x = BGX + 0.03;
            y = BGY + 0.07;
            w = 0.4;
            h = 0.038;
        };

        class ButtonTwo: Life_RscButtonMenu {
            idc = 37451;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.025;
            x = BGX + 0.03;
            y = BGY + 0.12;
            w = 0.4;
            h = 0.038;
        };

        class ButtonThree: Life_RscButtonMenu {
            idc = 37452;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.025;
            x = BGX + 0.03;
            y = BGY + 0.17;
            w = 0.4;
            h = 0.038;
        };

        class ButtonFour: Life_RscButtonMenu {
            idc = 37453;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.025;
            x = BGX + 0.03;
            y = BGY + 0.22;
            w = 0.4;
            h = 0.038;
        };

        class ButtonFive: Life_RscButtonMenu {
            idc = 37454;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.025;
            x = BGX + 0.03;
            y = BGY + 0.27;
            w = 0.4;
            h = 0.038;
        };

        class ButtonSix: Life_RscButtonMenu {
            idc = 37455;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.025;
            x = BGX + 0.03;
            y = BGY + 0.32;
            w = 0.4;
            h = 0.038;
        };

        class ButtonSeven: Life_RscButtonMenu {
            idc = 37456;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.025;
            x = BGX + 0.03;
            y = BGY + 0.37;
            w = 0.4;
            h = 0.038;
        };

        class ButtonEight: Life_RscButtonMenu {
            idc = 37457;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.025;
            x = BGX + 0.03;
            y = BGY + 0.42;
            w = 0.4;
            h = 0.038;
        };
    };
};


class pInteraction_MenuCop {
    idd = 37400;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class back: life_RscPicture
        {
            idc = 1201;
            text = "images\Textures\HUD\INT-COP-PLAYER.paa";
            x = 0.185572 * safezoneW + safezoneX;
            y = 0.23688 * safezoneH + safezoneY;
            w = 0.629062 * safezoneW;
            h = 0.528 * safezoneH;
        };
    };

    class controls {

        class ButtonOne: Life_RscButtonMenuRepentz {
            idc = 37450;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.335516 * safezoneW + safezoneX;
            y = 0.4175 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonTwo: Life_RscButtonMenuRepentz {
            idc = 37451;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.335 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonThree: Life_RscButtonMenuRepentz {
            idc = 37452;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.335 * safezoneW + safezoneX;
            y = 0.53586 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonFour: Life_RscButtonMenuRepentz {
            idc = 37453;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.4175 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonFive: Life_RscButtonMenuRepentz {
            idc = 37454;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonSix: Life_RscButtonMenuRepentz {
            idc = 37455;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.536704 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonSeven: Life_RscButtonMenuRepentz {
            idc = 37456;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.415704 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonEight: Life_RscButtonMenuRepentz {
            idc = 37457;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class RscButtonMenu_2472: Life_RscButtonMenuRepentz
        {
            idc = -1;
            text = ""; //--- ToDo: Localize;
            tooltip = "Exit";
            onButtonClick = "closedialog 0";
            x = 0.562396 * safezoneW + safezoneX;
            y = 0.535778 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        
        };
    };
};

class pInteraction_MenuCiv {
    idd = 37405;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class back: life_RscPicture
        {
            idc = 1201;
            text = "images\Textures\HUD\INT-CIV-PLAYER.paa";
            x = 0.247344 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.505313 * safezoneW;
            h = 0.44 * safezoneH;
        };
    };

    class controls {

        class ButtonOne: Life_RscButtonMenuRepentz {
            idc = 37450;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.457813 * safezoneW + safezoneX;
            y = 0.353704 * safezoneH + safezoneY;
            w = 0.0830208 * safezoneW;
            h = 0.0421481 * safezoneH;
        };

        class ButtonTwo: Life_RscButtonMenuRepentz {
            idc = 37451;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.458854 * safezoneW + safezoneX;
            y = 0.402778 * safezoneH + safezoneY;
            w = 0.0830208 * safezoneW;
            h = 0.0421481 * safezoneH;
        };

        class ButtonThree: Life_RscButtonMenuRepentz {
            idc = 37452;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.458333 * safezoneW + safezoneX;
            y = 0.452778 * safezoneH + safezoneY;
            w = 0.0830208 * safezoneW;
            h = 0.0421481 * safezoneH;
        };

        class ButtonFour: Life_RscButtonMenuRepentz {
            idc = 37453;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.503704 * safezoneH + safezoneY;
            w = 0.0830208 * safezoneW;
            h = 0.0421481 * safezoneH;
        };

        class ButtonFive: Life_RscButtonMenuRepentz {
            idc = 37454;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.0830208 * safezoneW;
            h = 0.0421481 * safezoneH;
        };

        class ButtonSix: Life_RscButtonMenuRepentz {
            idc = 37455;
            colorBackground[] = {0,0,0,0};
            tooltip = "Exit";
            onButtonClick = "closedialog 0";
            x = 0.458229 * safezoneW + safezoneX;
            y = 0.603519 * safezoneH + safezoneY;
            w = 0.0830208 * safezoneW;
            h = 0.0421481 * safezoneH;
        };    
    };
};

class vInteraction_MenuCopVeh {
    idd = 37400;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
       class back: life_RscPicture
        {
            idc = 1201;
            text = "images\Textures\HUD\INT-COP-VEH.paa";
            x = 0.242187 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.515625 * safezoneW;
            h = 0.451 * safezoneH;
        };
    };

    class controls {
    
        class ButtonOne: Life_RscButtonMenuRepentz {
            idc = 37450;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Repair Vehicle";
            x = 0.457188 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.085625 * safezoneW;
            h = 0.0357778 * safezoneH;
        };

        class ButtonTwo: Life_RscButtonMenuRepentz {
            idc = 37451;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Find the registration of the vehicle";
            x = 0.457813 * safezoneW + safezoneX;
            y = 0.340741 * safezoneH + safezoneY;
            w = 0.085625 * safezoneW;
            h = 0.0357778 * safezoneH;
        };

        class ButtonThree: Life_RscButtonMenuRepentz {
            idc = 37452;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Search Vehicle";
            x = 0.456667 * safezoneW + safezoneX;
            y = 0.393704 * safezoneH + safezoneY;
            w = 0.085625 * safezoneW;
            h = 0.0357778 * safezoneH;
        };

        class ButtonFour: Life_RscButtonMenuRepentz {
            idc = 37453;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Pull out players";
            x = 0.457188 * safezoneW + safezoneX;
            y = 0.444074 * safezoneH + safezoneY;
            w = 0.085625 * safezoneW;
            h = 0.0357778 * safezoneH;
        };

        class ButtonFive: Life_RscButtonMenuRepentz {
            idc = 37454;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Impound Vehicle";
            x = 0.456719 * safezoneW + safezoneX;
            y = 0.494556 * safezoneH + safezoneY;
            w = 0.085625 * safezoneW;
            h = 0.0357778 * safezoneH;
        };

        class ButtonSix: Life_RscButtonMenuRepentz {
            idc = 37455;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Crush Vehicle";
            x = 0.457188 * safezoneW + safezoneX;
            y = 0.545852 * safezoneH + safezoneY;
            w = 0.085625 * safezoneW;
            h = 0.0357778 * safezoneH;
        };

        class ButtonSeven: Life_RscButtonMenuRepentz {
            idc = 37456;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Unflip Vehicle";
            x = 0.457188 * safezoneW + safezoneX;
            y = 0.597148 * safezoneH + safezoneY;
            w = 0.085625 * safezoneW;
            h = 0.0357778 * safezoneH;
        };

        class RscButtonMenu_22323: life_RscButtonMenuRepentz
        {
            idc = -1;
            text = ""; //--- ToDo: Localize;
            tooltip = "Exit";
            onButtonClick = "closedialog 0";
            x = 0.457188 * safezoneW + safezoneX;
            y = 0.648556 * safezoneH + safezoneY;
            w = 0.085625 * safezoneW;
            h = 0.0357778 * safezoneH;
        };
    };
};

class vInteraction_MenuCivVeh {
    idd = 37404;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
       class back: life_RscPicture
        {
            idc = 1201;
            text = "images\Textures\HUD\INT-CIV-VEH.paa";
            x = 0.216406 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.551719 * safezoneW;
            h = 0.451 * safezoneH;
        };
    };

    class controls {
    
        class ButtonOne: Life_RscButtonMenuRepentz {
            idc = 37450;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Repair Vehicle";
            x = 0.446875 * safezoneW + safezoneX;
            y = 0.370778 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };

        class ButtonTwo: Life_RscButtonMenuRepentz {
            idc = 37451;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Unflip Vehicle";
            x = 0.446355 * safezoneW + safezoneX;
            y = 0.421148 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };

        class ButtonThree: Life_RscButtonMenuRepentz {
            idc = 37452;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Pull players out of vehicle";
            x = 0.446875 * safezoneW + safezoneX;
            y = 0.474296 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };

        class ButtonFour: Life_RscButtonMenuRepentz {
            idc = 37453;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Fill or unload your vehicle depending on the location you're at in a trucking mission";
            x = 0.446355 * safezoneW + safezoneX;
            y = 0.523852 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };

        class ButtonFive: life_RscButtonMenuRepentz
        {
            idc = 37454;
            text = ""; //--- ToDo: Localize;
            tooltip = "finish convoy";
            x = 0.446375 * safezoneW + safezoneX;
            y = 0.57524 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };

        class RscButtonMenu_22323: life_RscButtonMenuRepentz
        {
            idc = -1;
            text = ""; //--- ToDo: Localize;
            tooltip = "Exit";
            onButtonClick = "closedialog 0";
            x = 0.446375 * safezoneW + safezoneX;
            y = 0.62663 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };
    };
};

class vInteraction_MenuMedVeh {
    idd = 37409;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
       class back: life_RscPicture
        {
            idc = 1201;
            text = "images\Textures\HUD\INT-CIV-VEH.paa";
            x = 0.216406 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.551719 * safezoneW;
            h = 0.451 * safezoneH;
        };
    };

    class controls {
    
        class ButtonOne: Life_RscButtonMenuRepentz {
            idc = 37450;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Repair Vehicle";
            x = 0.446875 * safezoneW + safezoneX;
            y = 0.370778 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };

        class ButtonTwo: Life_RscButtonMenuRepentz {
            idc = 37451;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Unflip Vehicle";
            x = 0.446355 * safezoneW + safezoneX;
            y = 0.421148 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };

        class ButtonThree: Life_RscButtonMenuRepentz {
            idc = 37452;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "Pull players out of vehicle";
            x = 0.446875 * safezoneW + safezoneX;
            y = 0.474296 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };

        class ButtonFour: Life_RscButtonMenuRepentz {
            idc = 37453;
            colorBackground[] = {0,0,0,0};
            text = "";
            tooltip = "umm Vehicle";
            x = 0.446355 * safezoneW + safezoneX;
            y = 0.523852 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };

        class RscButtonMenu_22323: life_RscButtonMenuRepentz
        {
            idc = -1;
            text = ""; //--- ToDo: Localize;
            tooltip = "Exit";
            onButtonClick = "closedialog 0";
            x = 0.446375 * safezoneW + safezoneX;
            y = 0.57524 * safezoneH + safezoneY;
            w = 0.0907812 * safezoneW;
            h = 0.0394816 * safezoneH;
        };
    };
};
