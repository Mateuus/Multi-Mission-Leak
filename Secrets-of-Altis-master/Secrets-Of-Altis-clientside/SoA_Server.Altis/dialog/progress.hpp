class life_progress
{
	name = "life_progress";
	idd = 38200;
	//fadein=1;
	duration = 99999999999;
	//fadeout=1;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		class loadingpic: Life_RscPicture
		{
			idc = 38201;
			text = "images\hud\exp.paa";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.209 * safezoneH;
		};

		class ProgressBar: Life_RscProgress
		{
			idc = 38202;
			colorText[] = {0,0,0,0};
			x = 0.332343 * safezoneW + safezoneX;
			y = 0.914074 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ProgressText: Life_RscText
		{
			idc = 38203;
			text = "";
			colorText[] = {0,0,0,0};
			sizeEx = 0.03;
			x = 0.577343 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ProgressPercent: Life_RscText
		{
			idc = 38204;
			style = 2;
			text = "";
			colorText[] = {0,0,0,0};
			x = 0.335 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

class life_timer
{
	name = "life_timer";
	idd = 38300;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_timer',_this select 0]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : life_RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText : life_RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38301;
			text = "";
			x = 0.0204688 * safezoneW + safezoneX;
			y = 0.2778 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};
