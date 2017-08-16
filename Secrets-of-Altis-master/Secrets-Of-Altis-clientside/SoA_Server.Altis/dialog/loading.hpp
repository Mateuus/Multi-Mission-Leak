class preloadscreen {
	idd = 70500;
	movingEnable = 0;
	enableSimulation = 0;
	fadein=0;
	duration = 99999;
	fadeout=0;

	class controlsBackground {
		
		class lowerbackground : Life_RscPicture {
			idc = -1;
			text = "#(argb,8,8,3)color(0.6,0.6,0.6,1)";
			x = -0.015625 * safezoneW + safezoneX;
			y = -0.05 * safezoneH + safezoneY;
			w = 1.03125 * safezoneW;
			h = 1.1 * safezoneH;
		};
	};

	class controls {};
};

class loadscreen {

	idd = 70640;
	movingEnable = 0;
	enableSimulation = 0;
	fadein=0;
	duration = 99999;
	fadeout=0;
	onLoad="uiNamespace setVariable ['ladescreen',_this select 0]";
	
	class controlsBackground {

		class background : Life_RscPicture {
			idc = 70641;
			text = "";
			x = -0.015625 * safezoneW + safezoneX;
			y = -0.05 * safezoneH + safezoneY;
			w = 1.03125 * safezoneW;
			h = 1.1 * safezoneH;
		};
		
		class rage: Life_RscPicture
		{
			idc = 1201;
			text = "images\loading\rageworks.paa";
			x = 0.850624 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.121 * safezoneH;
		};
		
		class pi: Life_RscPicture
		{
			idc = -1;
			text = "images\loading\playerindex.paa";
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.099 * safezoneH;
		};
		
		class soa: Life_RscPicture
		{
			idc = -1;
			text = "images\loading\soa.paa";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class usk: Life_RscPicture
		{
			idc = -1;
			text = "images\loading\usk.paa";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.132 * safezoneH;
			colorText[] = {1,1,1,0.75};
		};
		
		class bohemia: Life_RscPicture
		{
			idc = -1;
			text = "images\loading\bohemia.paa";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.121 * safezoneH;
		};

		class loadpic : Life_RscPicture {
			idc = 70642;
			text = "images\loading\tipps\1.paa";
			x = 0.995 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.561 * safezoneH;
		};
	};
	
	class controls {

		class loadingtext: Life_RscText
		{
			idc = 70643;
			text = "";
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.077 * safezoneH;
			sizeEx = 2 * GUI_GRID_H;
		};
	};
};