class playerHUD
{
	idd=-1;
	movingEnable=0;
	fadein=1;
	duration = 9999999999999;
	fadeout=1;
	name="playerHUD";
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		
		class hudbackgroundright: Life_RscPicture
		{
			idc = 25;
			text = "images\hud\hudbackground.paa";
			shadow=1;
			x = 0.917656 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.473 * safezoneH;
		};
		
		class expbackground: Life_RscPicture
		{
			idc = 30;
			text = "images\hud\exp.paa";
			shadow=1;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.546562 * safezoneW;
			h = 0.22 * safezoneH;
		};
		
		class mailicon: Life_RscPicture
		{
			idc = 50;
			text = "icons\mail.paa";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
				
		class phoneicon: Life_RscPicture
		{
			idc = 60;
			text = "icons\phone.paa";
			x = 0.933125 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class waterpic: Life_RscPicture
		{
			idc = -1;
			text = "icons\water.paa";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class toiletpic: Life_RscPicture
		{
			idc = -1;
			text = "icons\toilet.paa";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class healthpic: Life_RscPicture
		{
			idc = -1;
			text = "icons\health.paa";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class muellpic: Life_RscPicture
		{
			idc = -1;
			text = "icons\muell.paa";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class bargeldpic: Life_RscPicture
		{
			idc = -1;
			text = "icons\bargeld.paa";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class foodpic: Life_RscPicture
		{
			idc = -1;
			text = "icons\food.paa";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class batterypic: Life_RscPicture
		{
			idc = -1;
			text = "icons\battery.paa";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls
	{
		class level: Life_RscText
		{
			type=0;
			idc=23540;
			style=2;
			shadow=1;
			text = ""; 
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorText[] = {1,1,1,0.7};
		};
		class food: Life_RscText
		{
			type=0;
			idc=23500;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class water: Life_RscText
		{
			type=0;
			idc=23510;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class health: Life_RscText
		{
			type=0;
			idc=23515;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class toilet: Life_RscText
		{
			idc = 23565;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class zustand: Life_RscText
		{
			type=0;
			idc=23520;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class battery: Life_RscText
		{
			type=0;
			idc=23525;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class muell: Life_RscText
		{
			type=0;
			idc=23530;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class bargeld: Life_RscText
		{
			type=0;
			idc=23535;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class zivi: Life_RscText
		{
			type=0;
			idc=23545;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class poli: Life_RscText
		{
			type=0;
			idc=23550;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class sani: Life_RscText
		{
			type=0;
			idc=23555;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class adac: Life_RscText
		{
			type=0;
			idc=23560;
			style=0;
			shadow=1;
			text = ""; 
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
		class expleisteProgress: Life_RscProgress
		{
			idc=23575;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.3,0.3,0.3,0.85};
			colorBar[] = {0.1,0.1,0.1,0.85};
		};
		class expleiste: Life_RscText
		{
			type=0;
			idc=23570;
			style=2;
			shadow=1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorText[] = {1,1,1,0.7};
		};

		class gmlist: Life_RscText
		{
			idc = 23580;
			text = "";
			x = 0.948594 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
		};
	};
};