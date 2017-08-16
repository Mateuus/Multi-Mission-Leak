class ES_Clothing {
	idd = 3100;
	name= "ES_Clothing";
	movingEnable = true;
	enableSimulation = 1;
	
	class controlsBackground {
		class Title: ES_RscStructuredText
		{
			idc = 3103;
			text = "Kleidungshandel";
			x = -0.2625;
			y = 0.02;
			w = 0.4625;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};		
		class Background: ES_RscBackground
		{
			idc = -1;
			x = -0.2625;
			y = 0.06;
			w = 0.4625;
			h = 0.836;
			colorBackground[] = {0, 0, 0, 0.7};
		};	
	};
	
	class controls 
	{		
		class FrameBorder: ES_RscFrame
		{
			idc = -1;
			x = -0.25;
			y = 0.08;
			w = 0.4375;
			h = 0.66;
		};		
		class ClothingList : ES_RscListBox 
		{
			idc = 3101;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] call ES_fnc_changeClothes;";
			x = -0.25;
			y = 0.08;
			w = 0.4375;
			h = 0.66;
		};
		
		class PriceTag : ES_RscStructuredText
		{
			idc = 3102;
			text = "";
			sizeEx = 0.035;
			x = -0.25;
			y = 0.76;
			w = 0.2125;
			h = 0.06;
		};
		
		class TotalPrice : ES_RscStructuredText
		{
			idc = 3106;
			text = "";
			sizeEx = 0.035;	
			x = -0.025;
			y = 0.76;
			w = 0.2125;
			h = 0.06;
		};
		
		class FilterList : ES_RscCombo
		{
			idc = 3105;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call ES_fnc_clothingFilter";
			x = -0.25;
			y = 0.832;
			w = 0.4375;
			h = 0.056;
		};
		
		class CloseButtonKey : ES_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.2625;
			y = 0.9;
			w = 0.225;
			h = 0.06;
			class Attributes 
            {
                align = "center";
            };
		};
		
		class BuyButtonKey : ES_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call ES_fnc_buyClothes;";
			x = -0.025;
			y = 0.9;
			w = 0.225;
			h = 0.06;
			class Attributes 
            {
                align = "center";
            };
		};
	};
};
