	//#define IDC_LIFE_BAR_SeatBelt 4203

    class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			//-- Something mission?
		};
		
	class controls
	{
		//-- Health Border & Icon
		class Health_ICON: Life_RscPicture
		{
			idc = 5100;
			text = "icons\health.paa";
			x = 0.912603 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.013 * safezoneW;
			h = 0.0229999 * safezoneH;
		};
	class Health: Life_RscProgress
		{
			idc = 5101;
			colorBar[] = {0.92,0,0,1};
			x = 0.928076 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.067048 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
		};
	//-- Hunger Border & Icon
	class Hunger_ICON: Life_RscPicture
		{
			idc = 5102;
			text = "icons\food.paa";
			x = 0.912603 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.013 * safezoneW;
			h = 0.0229999 * safezoneH;
		};
	class Hunger: Life_RscProgress
		{
			idc = 5103;
			colorBar[] = {0.97,0.75,0,1};
			x = 0.928076 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.067048 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
		};
	//-- Thirst Border & Icon
	class Thirst_ICON: Life_RscPicture
		{
			idc = 5104;
			text = "icons\water.paa";
			x = 0.912603 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.013 * safezoneW;
			h = 0.0229999 * safezoneH;
		};
	class Thirst: Life_RscProgress
		{
			idc = 5105;
			colorBar[] = {0.05,0.28,0.68,1};

			x = 0.928076 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.067048 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
		};
	//-- Weight Border & Icon
	class Weight: Life_RscProgress
		{
			idc = 5106;
			colorBar[] = {1,1,1,1};
			x = 0.928076 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.067048 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
		};
	class Weight_ICON: Life_RscPicture
		{
			idc = 5107;
			text = "icons\weight.paa";
			x = 0.912603 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.013 * safezoneW;
			h = 0.0229999 * safezoneH;
		};
	};   
 };