class maverick_dialog_tuning_leaveentertransition
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	fadeout=4;
	fadein=4;
	duration = 0.5;

	class controlsBackground {};

	class controls
	{
		class blackbackground: Life_RscText
		{
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0,0,0,2};
		};
	};
};

class maverick_dialog_tuning_text
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	fadeout=0.2;
	fadein=0.2;
	duration = 6;
	onLoad = "uiNamespace setVariable ['maverick_dialog_tuning_text',_this select 0];"

	class controlsBackground {};

	class controls
	{
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 0;
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.598125 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};