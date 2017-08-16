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
			text = "Take";
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
			text = "Store";
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
			text = "Take all";
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
			text = "Store all";
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