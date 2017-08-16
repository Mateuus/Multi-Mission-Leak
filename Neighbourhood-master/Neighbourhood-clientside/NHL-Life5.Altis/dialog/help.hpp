class help
{
	idd = 41500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class background: Life_RscText
		{
			idc = -1;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.438281 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Infoheader: Life_RscText
		{
			idc = -1;
			text = "Hilfe ";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.438281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
		};
	};
	
	class controls
	{
		class InfoList: Life_RscListBox
		{
			idc = 2300;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.462 * safezoneH;
			sizeEx = 0.032;
			colorBackground[] = {0,0,0,0.6};
			onLBSelChanged = "[1] spawn life_fnc_help;";
		};
		class headerInfoText: Life_RscText
		{
			idc = 2301;
			text = "empty";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class InfoTextControl: life_RscControlsGroup
		{
			idc = 2303;
			colorBackground[] = {0,0,0,0.7};
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.44 * safezoneH;
			
			class controls {
				class InfoText: life_RscStructuredText
				{
					idc = 2304;
					text = "empty";
					colorBackground[] = {0,0,0,0.7};
					x = 0;
					y = 0;
					w = 0.28875 * safezoneW;
					h = 0.8 * safezoneH;
				};
			};
		};
		
		class ButtonClose: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;";
		};
	};
};