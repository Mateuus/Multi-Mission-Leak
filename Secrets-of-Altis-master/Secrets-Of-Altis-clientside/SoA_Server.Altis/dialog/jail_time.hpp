class jail_time
{
	idd = 26500;
	name = "jail_time";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4,0,0,0.5};
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
			text = "Ins Gefängnis";
			x = 0.3;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class InfoMsg : Life_RscText
		{
			idc = 2601;
			text = "Zeit in Monaten:";
			x = 0.3;
			y = 0.163 + (11 / 250);
			w = 0.45; 
			h = 0.12;
		};
		
		class textEdit : Life_RscEdit {
			idc = 1400;
			text = "15";
			sizeEx = 0.0250;
			x = 0.40; y = 0.30;
			w = 0.25; h = 0.025;
		};
		
		class payTicket: Life_RscButtonMenu {
			idc = 2402;
			text = "Ok";
			colorBackground[] = {0.4,0,0,0.5};
			onButtonClick="[] spawn life_fnc_arrestDialog_Arrest;";
			x = 0.45;
			y = 0.35;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonClose : life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.71 * safezoneW + safezoneX;
			y = 0.045 * safezoneH - safezoneY;
			w = 0.025 * safezoneW;
			h = 0.05 * safezoneH;
			tooltip = "Schliessen";

			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
	};
};