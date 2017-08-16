class TTM_GUI_RscTitleExperienceAdded
{
	idd = -1;
	movingEnable = 0;
	enableSimulation = 1;
	fadeout = 0.2;
	fadein = 0.2;
	duration = 6;
	onLoad = "uiNamespace setVariable ['TTM_GUI_RscTitleExperienceAdded',_this select 0];";

	class controls
	{
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {1,1,1,0.35};
		};
		class textExpInfo: Life_RscStructuredText
		{
			idc = 3;
			text = ""; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class textActionText: Life_RscStructuredText
		{
			idc = 4;
			text = ""; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class progressLevelProgress: Life_RscProgress
		{
			idc = 5;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.011 * safezoneH;
			colorFrame[] = {0,0,0,0};
    		colorBackground[] = {0,0,0,0};
   	 		colorBar[] = {0.96,0.65,0.12,0.8};
		};
	};
};