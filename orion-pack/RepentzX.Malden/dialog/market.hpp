//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class marketView
{
	idd = 39500;
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class imagebackground: Life_RscPictureKeepAspect
        {
            idc = -1;
            //moving = 1;
            text = "images\Textures\Phone\phoneBlank.paa";
            x = -0.0625;
            y = -0.3;
            w = 1.1375;
            h = 1.5;
        };
		class lblResourceName: RscText
		{
			idc = 1000;
			text = "Resource"; //--- ToDo: Localize;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class lblResourcePrice: RscText
		{
			idc = 1001;
			text = "XXXXXXXXXXXXX$"; //--- ToDo: Localize;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class picTrendGlobal: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class picTrendLocal: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Long Time"; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "Short Time"; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class lblTrendGlobal: RscText
		{
			idc = 1004;
			text = "xxxxxxxx$"; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class lblTrendLocal: RscText
		{
			idc = 1005;
			text = "xxxxxxxx$"; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
	
	class controls
	{
		class Life_RscButtonInvisible_5555: Life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "closeDialog 0; createDialog ""smartphone"";";
			tooltip = "Previous Menu";
			x = 0.40294 * safezoneW + safezoneX;
			y = 0.733 * safezoneH + safezoneY;
			w = 0.059 * safezoneW;
			h = 0.049 * safezoneH;
		};
		class listResources: RscListbox
		{
			idc = 1500;
			colorBackground[] = {0,0,0,0};
			x = 13.6 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
			onLBSelChanged = "[] spawn life_fnc_refreshMarketView";
		};
	};
};

