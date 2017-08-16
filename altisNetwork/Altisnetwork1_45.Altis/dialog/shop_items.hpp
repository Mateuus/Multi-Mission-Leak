class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "['guns'] execVM 'gear\switch.sqf'";
	
	class controlsBackground {
	
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			text = "Your Inventory"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class MainBackgroundLeft : Life_RscText
		{
			idc = -1;

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class MainBackgroundRight: Life_RscText
		{
			idc = -1;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		
		class HeaderShopItems: Life_RscText
		{
			idc = -1;

			text = "Shop Items"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
			
	
	};
	
	class controls {
		
		class itemList: Life_RscListBox
		{
			idc = 2401;
			rowHeight = 0.1;
			sizeEx = 0.03;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0.4,0.4,0.4,0.3};
		};
		class pItemlist: Life_RscListBox
		{
			idc = 2402;
			rowHeight = 0.1;
			sizeEx = 0.03;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0.4,0.4,0.4,0.3};
		};
		class buyEdit: Life_RscEdit
		{
			idc = 2404;

			text = "1"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class ButtonAddG: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_virt_buy;";

			idc = -1;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class sellEdit: Life_RscEdit
		{
			idc = 2405;

			text = "1"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class ButtonRemoveG: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_virt_sell";

			idc = -1;
			text = "Sell"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class ButtonClose: Life_RscButtonMenuIcon
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0129167 * safezoneW;
			h = 0.022926 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			tooltip = "Close"; //--- ToDo: Localize;
		   text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};


	};
};