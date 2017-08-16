class LHM_fuelstations
{
	idd = 8955;
	name = "LHM_fuelstations";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class MainBackground: lhm_RscText
		{
			idc = 1001;
			x = 0.121717;
			y = 0.208215;
			w = 0.673232;
			h = 0.743098;
			colorBackground[] = {0,0,0,0.7};
};
		class RscStructuredText_1100: lhm_RscStructuredText
		{
			idc = 1100;
			x = 0.558081;
			y = 0.429293;
			w = 0.231313;
			h = 0.165657;
		};
		class Main_header: lhm_RscText
		{
			idc = 1002;
			text = "Loewenherz Mod Tankstellen"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.121212;
			y = 0.164175;
			w = 0.673232;
			h = 0.046128;
			
		};
		class Mein_tankstellen_header: lhm_RscText
		{
			idc = 1000;
			text = "Meine Tankstellen:"; //--- ToDo: Localize;
			x = 0.125;
			y = 0.218519;
			w = 0.427778;
			h = 0.04;
			
		};
	};
	
	class controls
	{
		class RscListbox_1500: lhm_RscListbox
		{
			idc = 1500;
			onLBSelChanged = "[] call lhm_fnc_LHM_stations_station_Menu_listbox_eventhandler;";
			sizeEx = 0.040;
			x = 0.125;
			y = 0.26;
			w = 0.425;
			h = 0.68;
		};

		class BTN_setPrice: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Preis setzen"; //--- ToDo: Localize;
			onButtonClick = "[] call lhm_fnc_LHM_stations_station_Menu_setPrice_BTN;";
			x = 0.566414;
			y = 0.223367;
			w = 0.2125;
			h = 0.0484175;
		};
		class BTN_tankstelle_verkaufen: lhm_RscButtonMenu
		{
			idc = 2401;
			text = "Verkaufen"; //--- ToDo: Localize;
			onButtonClick = "[] call lhm_fnc_LHM_stations_station_Menu_sell_Station;";
			x = 0.568182;
			y = 0.287879;
			w = 0.2125;
			h = 0.0484175;
		};
		class Close_BTN: lhm_RscButtonMenu
		{
			idc = 2402;
			text = "Close"; //--- ToDo: Localize;
			OnButtonClick = "CloseDialog 0;";
			x = 0.561869;
			y = 0.890573;
			w = 0.2125;
			h = 0.0484175;
		};

		class RscSlider_1900: lhm_RscXSliderH
		{
			onSliderPosChanged = "[] call lhm_fnc_LHM_stations_station_Menu_slider_eventhandler";
			idc = 1900;
			x = 0.567803;
			y = 0.356498;
			w = 0.207702;
			h = 0.06;
		};
	};
};
