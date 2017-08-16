class life_admin_menu {
    idd = 2900;
    name= "life_admin_menu";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn life_fnc_adminMenu;";

    class controlsBackground {
        class MainBackground: Life_RscText {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.436 * safezoneH;
        };
		
		 class MainBackground1: Life_RscText {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.7 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.1 * safezoneW;
            h = 0.436 * safezoneH;
        };
		
		class MainBackground2: Life_RscText {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.2 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.1 * safezoneW;
            h = 0.436 * safezoneH;
        };
		
		class MainBackground3: Life_RscText {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.313 * safezoneW + safezoneX;
            y = 0.783 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.06 * safezoneH;
        };
		
        class Life_RscTitleBackground: Life_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            text = "$STR_Admin_Title";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.022 * safezoneH;
        };
		
		class Life_RscTitleBackground1: Life_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            text = "Punishments";
            x = 0.7 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.1 * safezoneW;
            h = 0.022 * safezoneH;
        };
		
		class Life_RscTitleBackground2: Life_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            text = "Actions";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.1 * safezoneW;
            h = 0.022 * safezoneH;
        };
		
		class Life_RscTitleBackground3: Life_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            text = "Punish Reason:";
            x = 0.313 * safezoneW + safezoneX;
            y = 0.763 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.022 * safezoneH;
        };
		
    };

    class controls {
		
		class Punishreason: Life_RscEdit {
            idc = 2950;
            text = "Breaking our rules, please read and follow them! www.outlawed-veterans.com";
            sizeEx = 0.033;
            x = 0.323 * safezoneW + safezoneX;
            y = 0.795 * safezoneH + safezoneY;
            w = 0.35125 * safezoneW;
            h = 0.04 * safezoneH;
        };
		
		class RscButtonMenu_2420: Life_RscButtonMenu {
            idc = 2920;
            text = "Kick";
            onButtonClick = "[0,1] call life_fnc_adminactions;";
            x = 0.72 * safezoneW + safezoneX;
            y = 0.343 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		
		class RscButtonMenu_2421: Life_RscButtonMenu {
            idc = 2921;
            text = "Temp Ban";
            onButtonClick = "[0,2] call life_fnc_adminactions;";
            x = 0.72 * safezoneW + safezoneX;
            y = 0.383 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		
		class RscButtonMenu_2422: Life_RscButtonMenu {
            idc = 2922;
            text = "Combatlog";
            onButtonClick = "[0,3] call life_fnc_adminactions;";
            x = 0.72 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		
		class RscButtonMenu_2423: Life_RscButtonMenu {
            idc = 2923;
            text = "Perm ban";
            onButtonClick = "[0,4] call life_fnc_adminactions;";
            x = 0.72 * safezoneW + safezoneX;
            y = 0.463 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		
		class RscButtonMenu_2424: Life_RscButtonMenu {
            idc = 2924;
            text = "Blacklist";
            onButtonClick = "[0,5] call life_fnc_adminactions;";
            x = 0.72 * safezoneW + safezoneX;
            y = 0.503 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		
		class PunishHeader : Life_RscText
		{
			idc = -1;
			text = "24+ bans or blacklists NEED";
			sizeEx = 0.025;
            x = 0.708 * safezoneW + safezoneX;
            y = 0.693 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.042 * safezoneH;
		};
		
				
		class PunishHeader1 : Life_RscText
		{
			idc = -1;
			text = "to be logged on the panel!";
			sizeEx = 0.025;
            x = 0.71 * safezoneW + safezoneX;
            y = 0.7103 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.042 * safezoneH;
		};
		
		
		
		
		class RscButtonMenu_2400: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
			colorBackground[] = {1,0,0,0.75};
            x = 0.72 * safezoneW + safezoneX;
            y = 0.803 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
		};

        class RscButtonMenu_2411: Life_RscButtonMenu {
            idc = 2906;
            text = "Teleport";
            onButtonClick = "closeDialog 0;[] spawn life_fnc_adminTPMenu;";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.343 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };

		class RscButtonMenu_2401: Life_RscButtonMenu {
            idc = 2907;
            text = "TP X to ME";
            onButtonClick = "[] call life_fnc_adminTpHere;";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.383 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		
		class RscButtonMenu_2410: Life_RscButtonMenu {
            idc = 2912;
            text = "TP ME to X";
            onButtonClick = "[] call life_fnc_adminTpMe;";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		
		
        class RscButtonMenu_2402: Life_RscButtonMenu {
            idc = 2908;
            text = "Spectate";
            onButtonClick = "[] call life_fnc_adminSpectate;";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.463 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };

        class RscButtonMenu_2403: Life_RscButtonMenu {
            idc = 2904;
            text = "Unrestr.";
            onButtonClick = "[] call life_fnc_adminUnrestrain;";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.503 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };

        class RscButtonMenu_2404: Life_RscButtonMenu {
            idc = 2905;
            text = "Rel. Jail";
            onButtonClick = "[] call life_fnc_adminRelease;";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.543 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		
		/*
		class RscButtonMenu_2405: Life_RscButtonMenu {
            idc = 2909;
            text = "Impound";
            onButtonClick = "";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.543 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		*/

		/*
        class RscButtonMenu_2405: Life_RscButtonMenu {
            idc = 2906;
            text = "$STR_Admin_Teleport";
            onButtonClick = "[] call life_fnc_adminTeleport; hint 'Select where you would like to teleport';";
            x = 0.613437 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };
		*/

		/*
        class RscButtonMenu_2406: Life_RscButtonMenu {
            idc = 2908;
            text = "$STR_Admin_God";
            onButtonClick = "[] call life_fnc_adminGodMode;";
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };
		*/

		/*
        class RscButtonMenu_2407: Life_RscButtonMenu {
            idc = 2909;
            text = "$STR_Admin_Freeze";
            onButtonClick = "[] call life_fnc_adminFreeze;";
            x = 0.469062 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };
		*/

        class RscButtonMenu_2408: Life_RscButtonMenu {
            idc = 2910;
            text = "Wanted List";
            onButtonClick = "closeDialog 0; [] call life_fnc_wantedMenu;";
		    x = 0.21 * safezoneW + safezoneX;
            y = 0.653 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };

		
        class RscButtonMenu_2409: Life_RscButtonMenu {
            idc = 2911;
            text = "Revive";
			colorBackground[] = {1,1,0.1,0.75};
            onButtonClick = "[] call life_fnc_adminrevive;";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.693 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes 
            {
                align = "center";
            };
        };
		

        class PlayerList_Admin: Life_RscListBox {
            idc = 2902;
            text = "";
            sizeEx = 0.035;
            onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.4* safezoneH;
        };

        class PlayerBInfo: Life_RscStructuredText {
            idc = 2903;
            text = "";
            x = 0.489687 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.4 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
    };
};