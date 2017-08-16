class life_ausweis
{
	
	idd = 7220;
	movingEnable = false;
	enableSimulation = true;
	name = "life_ausweis";
	fadein = 2;
	duration = 5;
	fadeout = 2;
	onLoad="uiNamespace setVariable ['life_ausweis',_this select 0]";
	
	class controlsBackground {

		class ausweisbackground: Life_RscPicture
		{
			idc = 7221;
			text = "";
			x = 0.726875 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.242 * safezoneH;
		};
		
		class feldnachname: Life_RscText
		{
			idc = 7222;
			text = "";
			sizeEx = 0.032;
			shadow = 0;
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
		};
		
		class feldvorname: Life_RscText
		{
			idc = 7223;
			text = "";
			sizeEx = 0.032;
			shadow = 0;
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
		};
		
		class feldgeburtort: Life_RscText
		{
			idc = 7224;
			text = "";
			sizeEx = 0.032;
			shadow = 0;
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
		};
		
		class feldtag: Life_RscText
		{
			idc = 7225;
			text = "";
			sizeEx = 0.032;
			shadow = 0;
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
		};
		
		class feldmonat: Life_RscText
		{
			idc = 7226;
			text = "";
			sizeEx = 0.032;
			shadow = 0;
			x = 0.87125 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
		};
		
		class feldjahr: Life_RscText
		{
			idc = 7227;
			text = ""; 
			sizeEx = 0.032;
			shadow = 0;
			x = 0.891875 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
		};
		
		class feldnational: Life_RscText
		{
			idc = 7228;
			text = "";
			sizeEx = 0.032;
			shadow = 0;
			x = 0.891875 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
		};
		
		class gangtag: Life_RscText
		{
			idc = 7229;
			text = "";
			sizeEx = 0.032;
			shadow = 0;
			x = 0.891875 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0464062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
		};
	};
};