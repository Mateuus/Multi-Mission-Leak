class life_progress {
	name = "life_progress";
	idd = 38200;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	objects[]={};

	class controlsBackground {
		class background: Life_RscText {
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65;
			h = 0.05;
		};
		class ProgressBar: Life_RscProgress {
			idc = 38201;
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65;
			h = 0.05;
		};

		class ProgressText: Life_RscText {
			idc = 38202;
			text = "Servicing Chopper (50%)...";
			x = 0.386 * safezoneW + safezoneX;
			y = 0.0635 * safezoneH + safezoneY;
			w = 0.65;
			h = (1 / 25);
		};
	};
};

class life_timer {
	name = "life_timer";
	idd = 38300;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_timer',_this select 0]";
	objects[] = {};

	class controlsBackground {
		class TimerIcon: life_RscPicture {
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText: Life_RscText {
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

class SpawnBack
{
	name="SpawnBack";
	idd=99099;
	fadeIn = 1;		
	duration = 99999999999;
	fadeout = 1;
	movingEnable=0;
	onLoad="uiNamespace setVariable ['SpawnBack',_this select 0];";
	objects[] = {};
	
	class controlsBackground 
	{
		class SpawnLB_HG: life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,1)"; //"MINEFACTORY\textures\LadeBild.paa";
			x = -0.0331559 * safezoneW + safezoneX;
			y = -0.0016 * safezoneH + safezoneY;
			w = 1.06628 * safezoneW;
			h = 1.012 * safezoneH;
		};
		class SpaawnLB_Pic: life_RscPicture
		{
			idc = -1;
			text = "MINEFACTORY\textures\Schrift.paa";
			x = 0.12153 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.792002 * safezoneW;
			h = 0.0682 * safezoneH;
		};
	};
	
	class controls
	{
		class SpawnLB_InfoText: life_RscText
		{
			idc = 99100;
			colorBackground[] = {0,0,0,0};
			style = ST_CENTER;
			x = 0.00786171 * safezoneW + safezoneX;
			y = 0.939872 * safezoneH + safezoneY;
			w = 0.984405 * safezoneW;
			h = 0.0241931 * safezoneH;
		};
		class SpawnLB_Forschritt: Life_RscProgress
		{
			idc = 99101;
			texture = "";
			textureExt = "";
			colorBar[] = {0,0.51,0.04,1};
			colorExtBar[] = {1,1,1,1};
			colorFrame[] = {1,1,1,1};
			x = 0.00706247 * safezoneW + safezoneX;
			y = 0.968598 * safezoneH + safezoneY;
			w = 0.984843 * safezoneW;
			h = 0.0198 * safezoneH;
		};
	};   
};

class Nachricht
{
	idd=80500;
	movingEnable=0;
	duration=1e+011;
	name="Nachricht_a";
	onLoad="uiNamespace setVariable ['Nachricht',_this select 0]; [] spawn life_fnc_nachrichtonload;";
	objects[]={};
		
	class controlsBackground 
	{
		class Nachricht_pic: life_RscPicture
		{
			idc = 80511;
			text = "MINEFACTORY\textures\nachricht.paa";
			x = -0.0579882 * safezoneW + safezoneX;
			y = -0.039 * safezoneH + safezoneY;
			w = 1.10876 * safezoneW;
			h = 0.121 * safezoneH;
		};
	};
	
	class controls
	{
		class Nachricht_text: life_RscStructuredText
		{
			idc = 80501;
			text = ""; //--- ToDo: ;
			x = 0.0895022 * safezoneW + safezoneX;
			y = 0.00720002 * safezoneH + safezoneY;
			w = 0.838137 * safezoneW;
			h = 0.0263957 * safezoneH;
			size = 0.055;
		};			
	};   
};