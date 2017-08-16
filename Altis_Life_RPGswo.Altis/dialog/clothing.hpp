class DWEV_Clothing {
	idd = 3100;
	name= "DWEV_Clothing";
	movingEnable = 1;
    enableSimulation = 1;

	class controlsBackground {
		class DWEV_RscTitleBackground:DWEV_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;	
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0;
			w = 0.318;
			h = (1 / 25);
		};

		class MainBackground:DWEV_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;		
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0 + (11 / 250);
			w = 0.318;
			h = 0.5 - (22 / 250);
		};
	};

	class controls
	{
		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3103;
			text = "";
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0;
			w = 0.6;
			h = (1 / 25);
		};

		class ClothingList : DWEV_RscListBox
		{
			idc = 3101;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] call DWEV_fnc_changeClothes;";
			x = 0.01 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.05;
			w = 0.3;
			h = 0.35;
		};

		class PriceTag : DWEV_RscStructuredText
		{
			idc = 3102;
			text = "";
			sizeEx = 0.035;

			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0.45 - (1 / 25);
			w = 0.2;
			h = 0.2;
		};

		class TotalPrice : DWEV_RscStructuredText
		{
			idc = 3106;
			text = "";
			sizeEx = 0.035;

			x = 0.15 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.45 - (1 / 25);
			w = 0.2;
			h = 0.2;
		};

		class FilterList : DWEV_RscCombo
		{
			idc = 3105;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call DWEV_fnc_clothingFilter";
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = 0.318; 		
			h = 0.035;
		};

		class CloseButtonKey : DWEV_RscButtonMenu
		{
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.161 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.54 - (1 / 25); 		
			w = (6.25 / 40); 		
			h = (1 / 25);
		};

		class BuyButtonKey : DWEV_RscButtonMenu
		{
			idc = -1;
			text = "Kaufen";
			onButtonClick = "[] call DWEV_fnc_buyClothes;";
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0.54 - (1 / 25);
			w = (6.25 / 40);		
			h = (1 / 25);
		};
		
		class viewAngle: DWEV_RscXSliderH {
            color[] = {1, 1, 1, 0.45};
            colorActive[] = {1, 1, 1, 0.65};
            idc = 3107;
            text = "";
            onSliderPosChanged = "player setDir (360 - (_this select 1));";
            tooltip = "";
            x = 0.25 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
            w = 0.5 * safezoneW;
            h = 0.02 * safezoneH;
        };
	};
};
