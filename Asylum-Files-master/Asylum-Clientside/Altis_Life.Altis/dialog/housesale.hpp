class Life_housesale_menu {
	idd = 7700;
	name= "life_housesale_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_houseSaleMenu";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0.05, 0.05, 0.7};
			idc = -1;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.3729 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.165 * safezoneH;
		};
	};
	
	class controls {
		
		class moneyEdit : Life_RscEdit
		{
			idc = 7702;
			text = "1";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class MarketButton : life_RscButtonMenu 
		{
			idc = -1;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[false] call life_fnc_sellHouse;";
			text = "List Market"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CloseButton : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.5693 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class SellBankButton : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[true] call life_fnc_sellHouse;";
			text = "Sell to Bank"; //--- ToDo: Localize;
			x = 0.437733 * safezoneW + safezoneX;
			y = 0.568778 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class InfoText : Life_RscStructuredText
		{
			idc = 7701;
			text = ""; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.11 * safezoneH;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "House Sale";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.3729 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};