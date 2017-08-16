class life_dynmarket_prices {
	idd = 7100;
	name= "life_dynmarket_prices";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {[] call life_fnc_yjkalzbaacbighwnrkiwfmzfbgyawygfskestdcxwpsszdjrnqjj;};";
	
	class controlsBackground {
	};
	
	class controls {
		class RscFrame_1800: Life_RscText
		{
			idc = -1;

			x = 0.276563 * safezoneW + safezoneX;
			y = 0.390043 * safezoneH + safezoneY;
			w = 0.446875 * safezoneW;
			h = 0.219914 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscListbox_1500: Life_RscListBox
		{
			idc = 7055;
			onLBSelChanged = "[] spawn {[] call life_fnc_wieivfjppqbrfurvweeaitnpdpzsqlosubeblbmkmclaxydcimyqy;};";

			x = 0.282292 * safezoneW + safezoneX;
			y = 0.398839 * safezoneH + safezoneY;
			w = 0.211979 * safezoneW;
			h = 0.202321 * safezoneH;
			sizeEx = 0.0260;
		};
		class RscText_1000: Life_RscText
		{
			idc = -1;

			text = "Försäljningspris"; 
			x = 0.5 * safezoneW + safezoneX;
			y = 0.401039 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class RscText_1001: Life_RscText
		{
			idc = 7056;

			text = "Please select an Item"; 
			x = 0.5 * safezoneW + safezoneX;
			y = 0.420831 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0549786 * safezoneH;
			sizeEx = 0.060;
		};
		class RscText_1002: Life_RscText
		{
			idc = 7098;

			text = "Amout of Items sold by You"; 
			x = 0.5 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class RscText_1003: Life_RscText
		{
			idc = 7057;

			text = "0"; 
			x = 0.5 * safezoneW + safezoneX;
			y = 0.513195 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0549786 * safezoneH;
			sizeEx = 0.060;
		};
		class OilBankStatus : Life_RscProgress
		{
			idc = 7099;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.523195 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0349786 * safezoneH;
			colorBar[] = {0,0.52,0.03,0.7};
			colorFrame[] = {0,0.52,0.03,1};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1006;
			text = "OKAY"; 
			x = 0.5 * safezoneW + safezoneX;
			y = 0.57697 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,0.7};
		};
		class RscText_1007: Life_RscStructuredText
		{
			idc = 7058;

			text = ""; 
			x = 0.5 * safezoneW + safezoneX;
			
			y = 0.460221 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorText[] = {0.33,0.33,0.33,1};
		};
	};
};