class Life_input_dialog
{
	idd = 3650;
	name = "life_input_dialog";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.365916 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.088 * safezoneH;
		};
	};
	
	class controls 
	{
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3651;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.365916 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class primaryMessage : Life_RscStructuredText
		{
			idc = 3654;
			text = ""; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class inputBox : Life_RscEdit 
		{
			idc = 3652;
			
			text = "";
			sizeEx = 0.030;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class submitButton: Life_RscButtonMenu {
			idc = 3653;
			text = "OK";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "life_input_response = ctrlText 3652;closeDialog 0;";
			x = 0.540469 * safezoneW + safezoneX;
			y = 0.481472 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class cancelButton : Life_RscButtonMenu {
			idc = -1;
			text = "Cancel";
			colorBackground[] = { 0.5, 0, 0, 0.5 };
			onButtonClick = "life_input_response = "";closeDialog 0;";
			x = 0.482187 * safezoneW + safezoneX;
			y = 0.481472 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};