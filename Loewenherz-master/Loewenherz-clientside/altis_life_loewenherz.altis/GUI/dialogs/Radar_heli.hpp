class Radar_heli
{
	idd = 5488;
	name = "Radar_heli";
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{
	
		class tablet: lhm_RscPicture
		{
			idc = 1200;
			moving = 1;
			text = "core\textures\misc\radar.paa";
			x = -0.18649;
			y = -0.234545;
			w = 1.39735;
			h = 1.3398;
		};
		
		
		class Background_rsctext: lhm_RscText
		{
			idc = 1000;
			x = 0.545833;
			y = 0.0621549;
			w = 0.447222;
			h = 0.748149;
			colorBackground[] = {0,0,0,1};
		};
	
	};
	
	class controls
	{	
		class BTN_littleRadar: lhm_RscButtonMenu
		{
			idc = 2402;
			text = "Radar Small ON"; //--- ToDo: Localize;
			onButtonClick = "[] spawn lhm_fsm_fnc_radar_small_open;";
			x = 0.647979;
			y = 0.75367;
			w = 0.240152;
			h = 0.0410776;
		};
		class MapView : lhm_RscMapControl 
		{
			idc = 38502;
			x = 0.0366162;
			y = 0.0606062;
			w = 0.507829;
			h = 0.748148;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
		class RscListbox_1500: lhm_RscListbox
		{
			idc = 1500;
			sizeex = 0.045;
			onLBselChanged = "[] call lhm_fnc_cop_Radar_Lbox_eventhandler;";
			x = 0.551262;
			y = 0.0663299;
			w = 0.436237;
			h = 0.685522;
		};
		class Scan_BTN: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Scan"; //--- ToDo: Localize;
			onButtonClick = "[] spawn lhm_fnc_cop_Radar_scan;";
			x = 0.891414;
			y = 0.753468;
			w = 0.096212;
			h = 0.0410774;
		};
		class Close_BTN: lhm_RscButtonMenu
		{
			idc = 2401;
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "CloseDialog 0;";
			x = 0.549242;
			y = 0.754208;
			w = 0.0949496;
			h = 0.0427608;
		};
		
	};
};