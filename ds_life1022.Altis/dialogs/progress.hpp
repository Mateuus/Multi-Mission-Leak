class DS_progress
{
	name = "DS_progress";
	idd = 38200;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['DS_progress',_this select 0]";
	objects[]={};

	class controlsBackground
	{
		class background : DS_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65;
			h = 0.05;
		};
		class ProgressBar : DS_RscProgress
		{
			idc = 38201;
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65;
			h = 0.05;
		};

		class ProgressText : DS_RscText
		{
			idc = 38202;
			text = "Servicing Chopper (50%)...";
			x = 0.386 * safezoneW + safezoneX;
			y = 0.0635 * safezoneH + safezoneY;
			w = 0.65;
			h = (1 / 25);
		};
	};
};