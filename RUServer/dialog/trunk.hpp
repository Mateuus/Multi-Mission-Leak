
class TrunkMenu
{
	idd = 3500;
	name = "TrunkMenu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground
	{


		class MainBackground: Life_RscText
		{
			idc = -1;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.594 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};

		class BG: Life_RscText
		{
			idc = -1;
			x = 0.23651 * safezoneW + safezoneX;
			y = 0.22963 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

		class RscTitleText: Life_RscTitle
		{
			idc = 3501;
			text = "";
			x = 0.236979 * safezoneW + safezoneX;
			y = 0.233334 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class VehicleWeight: RscTitleText
		{
			idc = 3504;
			style = 1;
			text = "";
		};

		class RscTrunkText: Life_RscText
		{
			idc = -1;
			text = "$STR_Trunk_TInventory";
			sizeEx = 0.04;

			x = 0.242187 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

		class RscPlayerText: Life_RscText
		{
			idc = -1;
			text = "$STR_Trunk_PInventory";
			sizeEx = 0.04;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};
	class Controls
	{
		class TrunkGear: Life_RscListbox
		{
			idc = 3502;
			text = "";
			sizeEx = 0.030;

			x = 0.242187 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.363 * safezoneH;
		};

		class PlayerGear: Life_RscListbox
		{
			idc = 3503;
			text = "";
			sizeEx = 0.030;

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.363 * safezoneH;
		};

		class TrunkEdit: Life_RscEdit
		{
			idc = 3505;
			text = "1";
			sizeEx = 0.030;

			x = 0.242187 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class PlayerEdit: Life_RscEdit
		{
			idc = 3506;
			text = "1";
			sizeEx = 0.030;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TakeItem: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Trunk_Take";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call Life_fnc_vehTakeItem;";

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class StoreItem: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Trunk_Store";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call Life_fnc_vehStoreItem;";

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TakeAllItem: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Trunk_Take_All";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call Life_fnc_vehTakeAllItem;";

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class StoreAllItem: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Trunk_Store_All";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call Life_fnc_vehStoreAllItem;";

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.76 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ButtonClose: Life_RscButtonMenu
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";

			x = 0.237031 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Close"; //--- ToDo: Localize;
		};
	};
};

/*class TrunkMenu {
    idd = 3500;
    name = "TrunkMenu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.7;
            h = (1 / 25);
        };

        class RscBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.7;
            h = 0.7 - (22 / 250);
        };

        class RscTitleText: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 3501;
            text = "";
            x = 0.1;
            y = 0.2;
            w = 0.7;
            h = (1 / 25);
        };

        class VehicleWeight : RscTitleText {
            idc = 3504;
            style = 1;
            text = "";
        };

        class RscTrunkText: Life_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "$STR_Trunk_TInventory";
            sizeEx = 0.04;
            x = 0.11;
            y = 0.25;
            w = 0.3;
            h = 0.04;
        };

        class RscPlayerText: Life_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "$STR_Trunk_PInventory";
            sizeEx = 0.04;
            x = 0.49;
            y = 0.25;
            w = 0.3;
            h = 0.04;
        };
    };

    class Controls {
        class TrunkGear: Life_RscListBox {
            idc = 3502;
            text = "";
            sizeEx = 0.030;
            x = 0.11;
            y = 0.29;
            w = 0.3;
            h = 0.42;
        };

        class PlayerGear: Life_RscListBox {
            idc = 3503;
            text = "";
            sizeEx = 0.030;

            x = 0.49;
            y = 0.29;
            w = 0.3;
            h = 0.42;
        };

        class TrunkEdit: Life_RscEdit {
            idc = 3505;
            text = "1";
            sizeEx = 0.030;
            x = 0.11;
            y = 0.72;
            w = 0.3;
            h = 0.03;
        };

        class PlayerEdit: Life_RscEdit {
            idc = 3506;
            text = "1";
            sizeEx = 0.030;
            x = 0.49;
            y = 0.72;
            w = 0.3;
            h = 0.03;
        };

        class TakeItem: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Trunk_Take";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_vehTakeItem;";
            x = 0.19;
            y = 0.78;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class StoreItem: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Trunk_Store";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_vehStoreItem;";
            x = 0.57;
            y = 0.78;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonClose: Life_RscButtonMenu {
            idc = -1;
            //shortcuts[] = {0x00050000 + 2};
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.1;
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};
*/
