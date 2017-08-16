class esg_ausweis {
	idd = 2778;
  name= "esg_ausweis";
	fadein=0;
  duration = 99999999999;
  fadeout=0;
  movingEnable = 0;
  onLoad="uiNamespace setVariable ['esg_ausweis',_this select 0]";
  objects[]={};
	class controlsBackground {
		class bg: Life_RscPicture
		{
			idc = -1;
			text = "icons\ausweis.paa";
			x = 0.0307812 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.495 * safezoneH;
		};
	};
	class controls {

		class name: Life_RscText
		{
			idc = 1000;
			text = "";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class anschrift: Life_RscText
		{
			idc = 1001;
			text = "";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.5186 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class date: Life_RscText
		{
			idc = 1002;
			text = "";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.5682 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class staat: Life_RscText
		{
			idc = 1003;
			text = "";
			x = 0.267169 * safezoneW + safezoneX;
			y = 0.5682 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class g_ort: Life_RscText
		{
			idc = 1004;
			text = "";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.6012 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class rank: Life_RscText
		{
			idc = 1005;
			text = "";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0,0,0,1};
		};
	};
};
