class tanke {

	idd = 4200;
	fadein=1;
	duration = 5;
	fadeout=1;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['life_tanke',_this select 0]";

	class controlsBackground {
			
		class tankepic: Life_RscPicture
		{
			idc = -1;
			text = "images\tanke.paa";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.902 * safezoneH;
			colorText[] = {1,1,1,1};
		};
	};

	class controls {
		class dieseltext: Life_RscText
		{
			idc = 4201;
			text = "";
			sizeEx = 0.06;
			style = 2;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.066 * safezoneH;
		};
		
		class superplustext: Life_RscText
		{
			idc = 4202;
			text = "";
			sizeEx = 0.06;
			style = 2;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.066 * safezoneH;
		};
		
		class supertext: Life_RscText
		{
			idc = 4203;
			text = "";
			sizeEx = 0.06;
			style = 2;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.066 * safezoneH;
		};
		
		class kerosintext: Life_RscText
		{
			idc = 4204;
			text = "";
			sizeEx = 0.06;
			style = 2;
			x = 0.69427 * safezoneW + safezoneX;
			y = 0.594445 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};
};