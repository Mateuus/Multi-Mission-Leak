class injection
{
	idd = 2541;
	name="injection";
	movingEnabled = 0;
	enableSimulation = 1;
	

	class controlsBackground
	{
		class MainBackground: lhm_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.7};
			x = 0.134091;
			y = 0.186599;
			w = 0.529672;
			h = 0.635151;
		};
		
		class Main_header: lhm_RscText
		{
			idc = 1002;
			text = "Loewenherz - Tuning Werkstatt"; //--- ToDo: Localize;
			x = 0.133586;
			y = 0.141886;
			w = 0.528409;
			h = 0.0448485;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Fahrzeuge_header: lhm_RscText
		{
			idc = 1001;
			text = "Fahrzeuge:"; //--- ToDo: Localize;
			x = 0.140152;
			y = 0.193468;
			w = 0.513258;
			h = 0.0246465;
	
		};
	};

	class controls
	{
		class Fahrzeug_listbox: lhm_RscListbox
		{
			idc = 1500;
			sizeEx = 0.040;
			x = 0.14175;
			y = 0.2312;
			w = 0.5125;
			h = 0.58;
		};
		class Aufruesten_btn: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Aufruesten (50.000$)"; //--- ToDo: Localize;
			x = 0.395329;
			y = 0.826733;
			w = 0.268686;
			h = 0.0431651;
		};
		class Close_BTN: lhm_RscButtonMenu
		{
			idc = 2401;
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "CloseDialog 0;";
			x = 0.133839;
			y = 0.824917;
			w = 0.13106;
			h = 0.0448485;
		};
	};
};