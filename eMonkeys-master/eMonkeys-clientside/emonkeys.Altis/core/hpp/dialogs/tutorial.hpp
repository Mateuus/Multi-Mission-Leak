class EMonkeys_tutorialDialog
{
	name = "EMonkeys_tutorialDialog";
	idd = 11000;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	objects[]={};

	class controlsBackground 
	{
		class map_background : EMonkeys_RscPicture
		{
			idc = 1000;
			text = "core\textures\menu_background\bg_tutorialMap.paa";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.623906 * safezoneW;
			h = 0.968 * safezoneH;
		};

		class map : EMonkeys_RscMapControl
		{
			idc = 1002;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.352 * safezoneH;
		};
			
		class titel : EMonkeys_RscStructuredText
		{
			idc = 1003;
			shadow = 1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		
		class infobox : EMonkeys_RscStructuredText
		{
			idc = 1004;
			colorText[] = {1,1,1,1};
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.55 * safezoneH;
		};
	};
};