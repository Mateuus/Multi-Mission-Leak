class Chop_Shop
{
	idd = 39400;
	movingEnabled = false;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class RscTitleBackground : ES_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1; y = 0.2;
			w = 0.32; h = (1 / 25);
		};
		
		class MainBackGround : ES_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1; y = 0.2 + (11 / 250);
			w = 0.32; h = 0.6 - (22 / 250);
		};
		
		class Title : ES_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_ChopShop_Title";
			x = 0.1; y = 0.2;
			w = 0.32; h = (1 / 25);
		};
		
		class priceInfo : ES_RscStructuredText
		{
			idc = 39401;
			text = "";
			sizeEx = 0.035;
			x = 0.11; y = 0.68;
			w = 0.2; h = 0.2;
		};
	};
	
	class controls
	{
		class vehicleList : ES_RscListBox
		{
			idc = 39402;
			onLBSelChanged = "_this call ES_fnc_chopShopSelection";
			sizeEx = 0.04;
			x = 0.11; y = 0.25;
			w = 0.3; h = 0.38;
		};
		
		class BtnSell : ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Sell";
			onButtonclick = "[] spawn ES_fnc_chopShopSell;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BtnClose : ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};