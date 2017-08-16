class maverick_dialog_introcam_status {
    idd = 19350;
    movingEnable = 0;
    enableSimulation = 1;
    duration = 999999;
    onLoad = "uiNamespace setVariable ['maverick_introcam_statuslabel',_this select 0]";
    class controls {
    	class lblStatus: life_RscText
		{
			idc = 0;
			text = "Please wait"; //--- ToDo: Localize;
			x = 0.01099997 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.99 * safezoneW;
			h = 0.055 * safezoneH;
			shadow = 2;
		};
    };
};
/*
class Default
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 0;
};
*/

class maverick_dialog_introcam_blackin
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	fadeout=5;
	fadein=0;
	duration = 1;

	class controlsBackground {};

	class controls
	{
		class blackbackground: life_RscText
		{
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0,0,0,2};
		};
	};
};

class maverick_dialog_introcam_blackout
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	fadeout=0;
	fadein=5;
	duration = 1;

	class controlsBackground {};

	class controls
	{
		class blackbackground: life_RscText
		{
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0,0,0,2};
		};
	};
};

class maverick_dialog_introcam_transition
{
	idd = -1;
	movingEnable = true;
	enableSimulation = true;
	fadeout=4;
	fadein=4;
	duration = 0.5;

	class controlsBackground {};

	class controls
	{
		class blackbackground: life_RscText
		{
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0,0,0,2};
		};
	};
};