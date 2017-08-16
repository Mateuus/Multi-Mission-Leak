class TrunkMenu
{
	idd = 3500;
	name = "TrunkMenu";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{

		class BGpic: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\menu_veh.jpg";
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.594 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};

		class BG: ES_RscText
		{
			idc = -1;
			x = 0.23651 * safezoneW + safezoneX;
			y = 0.22963 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

		class RscTitleText: ES_RscTitle
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

		class RscTrunkText: ES_RscText
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

		class RscPlayerText: ES_RscText
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
		class TrunkGear: ES_RscListbox
		{
			idc = 3502;
			text = "";
			sizeEx = 0.030;

			x = 0.242187 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.363 * safezoneH;
		};

		class PlayerGear: ES_RscListbox
		{
			idc = 3503;
			text = "";
			sizeEx = 0.030;

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.363 * safezoneH;
		};

		class TrunkEdit: ES_RscEdit
		{
			idc = 3505;
			text = "1";
			sizeEx = 0.030;

			x = 0.242187 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class PlayerEdit: ES_RscEdit
		{
			idc = 3506;
			text = "1";
			sizeEx = 0.030;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TakeItem: ES_RscButtonMenu
		{
			idc = -1;
			text = "Auslagern";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_vehTakeItem;";

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class StoreItem: ES_RscButtonMenu
		{
			idc = -1;
			text = "Einlagern";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_vehStoreItem;";

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ButtonClose: ES_RscButtonMenu
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Schließen"; //--- ToDo: Localize;
		};
	};
};
