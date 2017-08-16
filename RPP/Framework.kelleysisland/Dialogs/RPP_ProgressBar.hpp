class RPP_ProgressBar
{
	name = "RPP_ProgressBar";
	idd = 38200;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['RPP_ProgressBar',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		class background : RPP_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65; h = 0.05;
		};
		class ProgressBar : RPP_RscProgress
		{
			idc = 38201;
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65; h = 0.05;
		};
		
		class ProgressText : RPP_RscText
		{
			idc = 38202;
			text = "";
			x = 0.386 * safezoneW + safezoneX;
			y = 0.0635 * safezoneH + safezoneY;
			w = 0.65; h = (1 / 25);
		};
	};
};