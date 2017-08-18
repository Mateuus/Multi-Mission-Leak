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
	};
		
	class controls
	{
		class Health_ICON: Life_RscPicture
		{
			idc = 5100;

			text = "icons\health.paa";
			x = 0.912603 * safezoneW + safezoneX;
			y = 0.902 * safezoneH + safezoneY;
			w = 0.013 * safezoneW;
			h = 0.0229999 * safezoneH;
		};
		class Health: Life_RscProgress
		{
			idc = 5101;
			colorBar[] = {0.95,0.26,0.21,1};

			x = 0.928076 * safezoneW + safezoneX;
			y = 0.902 * safezoneH + safezoneY;
			w = 0.067048 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
		};
		class Hunger_ICON: Life_RscPicture
		{
			idc = 5102;

			text = "icons\food.paa";
			x = 0.912603 * safezoneW + safezoneX;
			y = 0.935 * safezoneH + safezoneY;
			w = 0.013 * safezoneW;
			h = 0.0229999 * safezoneH;
		};
		class Hunger: Life_RscProgress
		{
			idc = 5103;
			colorBar[] = {0.29,0.68,0.31,1};

			x = 0.928076 * safezoneW + safezoneX;
			y = 0.935 * safezoneH + safezoneY;
			w = 0.067048 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
		};
		class Thirst_ICON: Life_RscPicture
		{
			idc = 5104;

			text = "icons\water.paa";
			x = 0.912603 * safezoneW + safezoneX;
			y = 0.968 * safezoneH + safezoneY;
			w = 0.013 * safezoneW;
			h = 0.0229999 * safezoneH;
		};
		class Thirst: Life_RscProgress
		{
			idc = 5105;
			colorBar[] = {0.01,0.66,0.95,1};

			x = 0.928076 * safezoneW + safezoneX;
			y = 0.968 * safezoneH + safezoneY;
			w = 0.067048 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
		};
		
        /*class watermark : life_RscPicture
        {
            idc = -1;
            text = "icons\watermark.paa";
            x = safezoneX + safezoneW + 0.485;
            y = -1.85 * safezoneH + safezoneY;
            w = 0.12 * safezoneW;
            h = 0.128 * safezoneH;
        };*/
	};
}; 