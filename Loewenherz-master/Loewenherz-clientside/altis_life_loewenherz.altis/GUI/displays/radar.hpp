#define INFINITE 999999999999999999999999999999

class lhm_radar 
{

	idd=-255;
	movingEnable=1;
	fadein=0.5;
	duration = INFINITE;
	fadeout=0.5;
	name="lhm_radar";
	onLoad="uiNamespace setVariable ['lhm_radar',_this select 0]; ";
	onUnload = "uiNamespace setVariable ['lhm_radar',displayNull];";
	objects[]={};
	enableSimulation = true;
	
	class controlsBackground
	{
	
		class ATLAS : lhm_RscPicture
		{
	
			idc = -1;
			text = "core\textures\misc\radar.paa";
			moving = 1;
			x = 0.00177085 * safezoneW + safezoneX;
			y = 0.393148 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class scan: lhm_RscStructuredText
		{
			idc = 1110;
			text = "";

			x = 0.0386977 * safezoneW + safezoneX;
			y = 0.462259 * safezoneH + safezoneY;
			w = 0.15375 * safezoneW;
			h = 0.169815 * safezoneH;
		};
		class RscText_1000: lhm_RscText
		{
			idc = -1;
			text = "";
			x = 0.0381772 * safezoneW + safezoneX;
			y = 0.460519 * safezoneH + safezoneY;
			w = 0.155627 * safezoneW;
			h = 0.173445 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};
	class controls
	{

	};

};
	
	
	
	
	
	
	