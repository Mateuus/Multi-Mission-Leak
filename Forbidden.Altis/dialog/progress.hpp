class life_progress
{
	name = "life_progress";
	idd = 38200;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		class background : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65; h = 0.05;
		};
		class ProgressBar : Life_RscProgress
		{
			idc = 38201;
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65; h = 0.05;
		};
		
		class ProgressText : Life_RscText
		{
			idc = 38202;
			text = "Servicing Chopper (50%)...";
			x = 0.386 * safezoneW + safezoneX;
			y = 0.0635 * safezoneH + safezoneY;
			w = 0.65; h = (1 / 25);
		};
	};
};

class life_timer
{
	name = "life_timer";
	idd = 38300;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_timer',_this select 0]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : life_RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText : life_RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38301;
			text = "";
			x = 0.0204688 * safezoneW + safezoneX;
			y = 0.2778 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};

class life_nlrtimer
{
    name = "life_nlrtimer";
    idd = 38300;
    fadeIn = 1;
    duration = 99999999999;
    fadeout = 1;
    movingEnable = 0;
    onLoad = "uiNamespace setVariable['life_nlrtimer',_this select 0]";
    objects[] = {};
 
    class controlsBackground
    {
        class TimerIcon : life_RscPicture
        {
            idc = -1;
            text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
            
			
			x = safeZoneX+safeZoneW-0.22;
			y = safeZoneY+safeZoneH-0.57;
            w = 0.04;
            h = 0.045;
        };
 
        class TimerText : life_RscText
        {
            colorBackground[] = {0,0,0,0};
            idc = 38301;
            text = "";
            
            
			x = safeZoneX+safeZoneW-0.184;
			y = safeZoneY+safeZoneH-0.59;
            w = 0.09125 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
};

class life_stopwatch
{
    name = "life_stopwatch";
    idd = 38800;
    fadeIn = 1;
    duration = 99999999999;
    fadeout = 1;
    movingEnable = 0;
    onLoad = "uiNamespace setVariable['life_stopwatch',_this select 0]";
    objects[] = {};
 
    class controlsBackground
    {
		
        class TimerIcon : life_RscPicture
        {
            idc = 38302;
            text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
            
            
			x = safeZoneX+safeZoneW-0.18;
			y = safeZoneY+safeZoneH-0.50;
            w = 0.04;
            h = 0.045;
        };
		
		
		
 
		
        class TimerText : life_RscText
        {
            colorBackground[] = {0,0,0,0};
            idc = 38301;
            text = "";
            
            
			x = safeZoneX+safeZoneW-0.134;
			y = safeZoneY+safeZoneH-0.52;
            w = 0.09125 * safezoneW;
            h = 0.055 * safezoneH;
        };
		
    };
};

class no_communication
{
    name = "no_communication";
    idd = 38300;
    fadeIn = 1;
    duration = 99999999999;
    fadeout = 1;
    movingEnable = 0;
    onLoad = "uiNamespace setVariable['no_communication',_this select 0]";
    objects[] = {};
 
    class controlsBackground
    {
        class TimerIcon : life_RscPicture
        {
            idc = -1;
            text = "textures\cellphone_50.paa";
			colorBackground[] = {1,0,0,1};
			colorText[] = {1,1,1,1}; 
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.51 * safezoneH + safezoneY;
            w = 0.15;
            h = 0.15;
        };
    };
};

class exp_progress
{
	name = "exp_progress";
	idd = 38407;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['exp_progress',_this select 0]";
	onUnload = "uiNamespace setVariable ['exp_progress', objNull]";
	onDestroy = "uiNamespace setVariable ['exp_progress', objNull]";
	objects[]={};

	class controlsBackground 
	{
		class background : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.3214 * safezoneW + safezoneX;
			y = 0.991 * safezoneH + safezoneY;
			w = 0.348 * safezoneW; h = 0.015;
		};
		class ProgressBar : Life_RscProgress
		{
			idc = 38201;
			x = 0.3214 * safezoneW + safezoneX;
			y = 0.991 * safezoneH + safezoneY;
			w = 0.348 * safezoneW; h = 0.015;
		};
	};
};

class koth_status {
	idd = -1;
	onLoad = "uiNamespace setVariable ['koth_status', _this select 0]";
	onUnload = "uiNamespace setVariable ['koth_status', objNull]";
	onDestroy = "uiNamespace setVariable ['koth_status', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 55554;
			x = 0.3214 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.348 * safezoneW;
			h = 0.20;
			shadow = 0;
			
			font = "PuristaSemibold";
			size = 0.04;
			type = 13;
			style = 2;
			text="";
			class Attributes {
				align="center";
				color = "#ffffff";
			};
		};
		
		class img1 : statusBarText {
			idc = 55555;
			x = 0.3214 * safezoneW + safezoneX - 0.07 * safezoneW;
		};
		
		class img2 : statusBarText {
			idc = 55556;
			
		};
		
		class img3 : statusBarText {
			idc = 55557;
			x = 0.3214 * safezoneW + safezoneX + 0.07 * safezoneW;
		};
		
		class text1 : statusBarText {
			idc = 55558;
			x = 0.3214 * safezoneW + safezoneX - 0.07 * safezoneW;
			y = 0.845 * safezoneH + safezoneY;
		};
		
		class text2 : statusBarText {
			idc = 55559;
			y = 0.845 * safezoneH + safezoneY;
		};
		
		class text3 : statusBarText {
			idc = 55560;
			x = 0.3214 * safezoneW + safezoneX + 0.07 * safezoneW;
			y = 0.845 * safezoneH + safezoneY;
		};
	};
}; 

