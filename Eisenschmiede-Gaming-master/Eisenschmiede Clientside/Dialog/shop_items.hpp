class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class BGpic: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\menu_logo2.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.228593 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

		class vasText: ES_RscText
		{
			idc = -1;
			text = "$STR_VS_SI";
			sizeEx = 0.04;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};

		class vasgText: ES_RscText
		{
			idc = -1;
			text = "$STR_VS_PI";
			sizeEx = 0.04;
			x = 0.51547 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
	};
	class controls {

		class itemList: ES_RscListbox
		{
			idc = 2401;
			text = "";
			sizeEx = 0.030;
			x = 0.299427 * safezoneW + safezoneX;
			y = 0.287296 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.33 * safezoneH;
		};

		class pItemList: ES_RscListbox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.030;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.33 * safezoneH;
		};

		class Title: ES_RscTitle
		{
			idc = 2403;
			text = "";

			x = 0.295259 * safezoneW + safezoneX;
			y = 0.178334 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class PlayersName: ES_RscTitle
		{
			idc = 601;
			style = 1;
			text = "";

			x = 0.410417 * safezoneW + safezoneX;
			y = 0.177778 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class buyEdit: ES_RscEdit
		{
			idc = 2404;
			
			text = "1";
			sizeEx = 0.030;

			x = 0.298906 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonAddG: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VS_BuyItem";
			onButtonClick = "[] spawn ES_fnc_virt_buy;";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class sellEdit: ES_RscEdit
		{
			idc = 2405;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonRemoveG: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VS_SellItem";
			onButtonClick = "[] call ES_fnc_virt_sell";

			x = 0.592716 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ButtonClose: ES_RscButtonMenu
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.295773 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.110341 * safezoneW;
			h = 0.0374 * safezoneH;
		};
	};
};
