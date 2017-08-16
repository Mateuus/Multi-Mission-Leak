class life_post {

	idd = 600;
	EnableSimulation = 1;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_post',_this select 0]";

	class controlsBackground {
	
		class maintitle: Life_RscText
		{
			idc = 601;
			text = "";
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls {

		class pakettext: Life_RscText
		{
			idc = 602;
			text = "";
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};
};