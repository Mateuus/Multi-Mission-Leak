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
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
	
		class TabletBCKGRND: lhm_RscPicture 
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;
			
		};
		class RscStructuredText_1100: lhm_RscText
		{
			idc = 1100;
			text = "LH Marktsystem"; //--- ToDo: Localize;
			x = 0.117551;
			y = 0.205253;
			w = 0.262374;
			h = 0.0284175;
		};
		//class IGUIBack_2200: IGUIBack
		//{
		//	idc = 2200;
		//	x = 5 * GUI_GRID_W + GUI_GRID_X;
		//	y = 2 * GUI_GRID_H + GUI_GRID_Y;
		///	w = 30 * GUI_GRID_W;
		//	h = 21 * GUI_GRID_H;
		//};
		class lblResourceName: lhm_RscText
		{
			idc = 1000;
			text = "Resource"; //--- ToDo: Localize;
			x = 0.430555;
			y = 0.248013;
			w = 0.475;
			h = 0.0515825;
		};
		//class IGUIBack_2201: IGUIBack
		//{
		//	idc = 2201;
		//	x = 17 * GUI_GRID_W + GUI_GRID_X;
		//	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
		//	w = 17 * GUI_GRID_W;
		//	h = 2.5 * GUI_GRID_H;
		//};
		class lblResourcePrice: RscText
		{
			idc = 1001;
			text = "XXXXXXXXXXXXX$"; //--- ToDo: Localize;
			x = 0.430808;
			y = 0.325051;
			w = 0.35;
			h = 0.04;
		};
		//class IGUIBack_2202: IGUIBack
	//	{
		//	idc = 2202;
		//	x = 17 * GUI_GRID_W + GUI_GRID_X;
		//	y = 10 * GUI_GRID_H + GUI_GRID_Y;
		//	w = 17 * GUI_GRID_W;
		//	h = 12 * GUI_GRID_H;
		//};
		class RscStructuredText_1101: lhm_RscText
		{
			idc = 1101;
			text = "Entwicklung"; //--- ToDo: Localize;
			x = 0.431313;
			y = 0.381683;
			w = 0.1375;
			h = 0.04;
		};
		class picTrendGlobal: lhm_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.426768;
			y = 0.441078;
			w = 0.0875;
			h = 0.1;
		};
		class picTrendLocal: lhm_RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.42803;
			y = 0.643098;
			w = 0.0875;
			h = 0.1;
		};
		class RscText_1002: lhm_RscText
		{
			idc = 1002;
			text = "Seit Serverstart"; //--- ToDo: Localize;
			x = 0.522727;
			y = 0.429495;
			w = 0.175;
			h = 0.06;
		};
		class RscText_1003: lhm_RscText
		{
			idc = 1003;
			text = "Vor kurzem"; //--- ToDo: Localize;
			x = 0.52399;
			y = 0.636364;
			w = 0.178788;
			h = 0.0484175;
		};
		class lblTrendGlobal: lhm_RscText
		{
			idc = 1004;
			text = "xxxxxxxx$"; //--- ToDo: Localize;
			x = 0.521465;
			y = 0.484848;
			w = 0.175;
			h = 0.06;
		};
		class lblTrendLocal: lhm_RscText
		{
			idc = 1005;
			text = "xxxxxxxx$"; //--- ToDo: Localize;
			x = 0.525253;
			y = 0.686869;
			w = 0.175;
			h = 0.06;
		};
		class PictureClose: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.123737;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
	};
	
	class controls
	{
		class ButtonClose : lhm_RscButtonSilent {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call lhm_fnc_p_updateMenu;";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};
		class TimeText: lhm_RscText
		{
			idc = 7858;
			SizeEx = 0.027;
			text = "";
			x = 0.930556;
			y = 0.127946;
			w = 0.0534085;
			h = 0.033266;
		};
		class listResources: lhm_RscListbox
		{
			idc = 1500;
			sizeEx = 0.03;
			x = 0.125253;
			y = 0.238317;
			w = 0.272475;
			h = 0.503165;
			onLBSelChanged = "[] spawn lhm_fnc_refreshMarketView";
		};
	};
};

