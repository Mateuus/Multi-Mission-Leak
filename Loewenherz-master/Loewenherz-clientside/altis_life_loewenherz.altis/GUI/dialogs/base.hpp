class Basen_menu {
	idd = 2578;
	name= "Basen_menu";
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
			
			class MainBAckground: lhm_RscText
			{
				idc = 1000;
				x = -0.0238638;
				y = 0.037643;
				w = 1.05833;
				h = 0.881145;
				colorBackground[] = {0,0,0,1};
			};
			
			class tablet: lhm_RscPicture
		{
			idc = 1250;
			moving = 1;
			text = "core\textures\misc\radar.paa";
			x = -0.265278;
			y = -0.301683;
			w = 1.55051;
			h = 1.56397;
		};
			
		//	class Header_Background: lhm_RscText
		//	{
		//		idc = 1003;
		//		x = -0.116161;
		//		y = -0.217172;
		//		w = 1.49015;
		//		h = 0.0427608;
		//		colorBackground[] = {0.643,0.643,0.643,1};
		//	};
	};
	
	class controls {
		
		class Camera: lhm_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,0,1)";
			x = 0.293435;
			y = 0.0425589;
			w = 0.746717;
			h = 0.63239;
		};
		class RscListbox_1500: lhm_RscListbox
		{
			idc = 1500;
			onLBDblClick = "[] call lhm_fnc_base_dialog_lb_evh;";
			sizeex = 0.046;
			x = -0.0186868;
			y = 0.049091;
			w = 0.311743;
			h = 0.864377;
		};
		class ProgrammBackground: BA_RscStructuredText
		{
			idc = 1100;
			colorText[] = {0.016,0.706,0.016,1};
			x = 0.293182;
			y = 0.676027;
			w = 0.74899;
			h = 0.23468;
			colorBackground[] = {0,0,0,1};
		};
		//class InfoStrText: lhm_RscStructuredText
		//{
		//	idc = 1101;
		//	x = 1.1928;
		//	y = -0.127744;
		//	w = 0.339899;
		//	h = 1.23636;
		//	colorBackground[] = {0,0,0,1};
		//};
		//class Mapview: lhm_RscMapControl
		//{
		//	idc = 1002;
		//	x = 0.890405;
		//	y = -0.176903;
		//	w = 0.483839;
		//	h = 0.84162;
		//	maxSatelliteAlpha = 0.75;//0.75;
		//	alphaFadeStartScale = 1.15;//0.15;
		//	alphaFadeEndScale = 1.29;//0.29;
		//};

		//class Header: lhm_RscText
		//{
		//	idc = 1004;
		//	text = "Loewenherz  -  Static Base Menu"; //--- ToDo: Localize;
		//	x = 0.522728;
		//	y = -0.215488;
		//	w = 0.299621;
		//	h = 0.0416835;
		//};
		//class Gang_header: lhm_RscText
		//{
		//	idc = 1005;
		//	text = "";
		//	x = -0.11111;
		//	y = -0.220741;
		//	w = 0.519949;
		//	h = 0.0418855;
		//};
		//class Uhrzeit: lhm_RscText
		//{
		//	idc = 1006;
		//	text = ""; //--- ToDo: Localize;
		//	x = 1.30808;
		//	y = -0.218856;
		//	w = 0.0660355;
		//	h = 0.050101;
		//};
		
	};
};