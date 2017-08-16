class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = 0;
	enableSimulation = 1;

class controlsBackground {
		class RscPicture_1200: life_RscPicture
		{
			idc = 1200;
			text = "textures\allgemein\bilder\Shop.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};
	};
	
	class controls {

		class itemList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.030;
			//onLBSelChanged = "[] call fnc_selection";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.114167 * safezoneW;
			h = 0.237408 * safezoneH;
		};
		
		class pItemlist : Life_RscListBox 
		{
			idc = 2402;
			text = "";
			sizeEx = 0.030;
			//onLBSelChanged = "[2502] execVM 'gear\selection.sqf'";
			x = 0.511041 * safezoneW + safezoneX;
			y = 0.361556 * safezoneH + safezoneY;
			w = 0.112448 * safezoneW;
			h = 0.232852 * safezoneH;
		};
			
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2403;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};

		class PlayersName : Title {
			idc = 601;
			style = 1;
			text = "";
		};
		class quanityshop: life_RscFrame
		{
			idc = 1800;
			x = 0.416667 * safezoneW + safezoneX;
			y = 0.605556 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		class buyEdit : Life_RscEdit 
		{
			idc = 2404;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.416667 * safezoneW + safezoneX;
			y = 0.605556 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
	
		class ButtonAddG : Life_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_virt_buy;";
			
			x = 0.392761 * safezoneW + safezoneX;
			y = 0.641148 * safezoneH + safezoneY;
			w = 0.0803125 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		class inventoryquanty: life_RscFrame
		{
			idc = 1801;
			x = 0.554166 * safezoneW + safezoneX;
			y = 0.60537 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		class sellEdit : Life_RscEdit 
		{
			idc = 2405;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.554166 * safezoneW + safezoneX;
			y = 0.60537 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		class ButtonRemoveG : Life_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_virt_sell";
			
			x = 0.531979 * safezoneW + safezoneX;
			y = 0.641148 * safezoneH + safezoneY;
			w = 0.0803125 * safezoneW;
			h = 0.0272222 * safezoneH;
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
	};
};
