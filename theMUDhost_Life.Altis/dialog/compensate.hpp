class Adjustment_ui
{
	idd = -1;
	name = "Adjustment_ui";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2651;
			text = "$STR_Comp_Title";
			x = 0.3;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class DefaultText : Life_RscEdit 
		{
			idc = 7331;
			text = "$STR_Comp_Value";
			sizeEx = 0.030;
			x = 0.40; y = 0.30;
			w = 0.25; h = 0.03;
		};
		
		class ReasonText : Life_RscEdit 
		{
			idc = 7332;
			text = "$STR_Comp_Reason";
			sizeEx = 0.030;
			x = 0.40; y = 0.34;
			w = 0.25; h = 0.03;
		};

		class MoneyEdit: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Comp_SendCash";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0] call life_fnc_adminCompRequest";
			x = 0.45;
			y = 0.39;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Adjust: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Comp_DeductCash";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[1] call life_fnc_adminCompRequest";
			x = 0.61;
			y = 0.39;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};