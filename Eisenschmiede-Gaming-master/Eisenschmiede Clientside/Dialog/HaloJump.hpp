class ES_ALTITUDE_SELECT 
{
	idd = 2900;
	name= "Altitudeselect";
	movingEnable = true;
	enableSimulation = 1;
	
	class controlsBackground {
		class ATM_RscTitleBackground:ES_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.52;
			h = (1 / 25);
		};
		
		class MainBackground : ES_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.52;
			h = 0.4 - (12 / 67);
		};
		
		class Altitude : ES_RscText
		{
			idc = -1;
			text = "Hoehe:";
			
			x = 0.32; y = 0.258;
			w = 0.275; h = 0.04;
		};

	};
	
	class controls 
	{
		class atmTitle : ES_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Bitte hier die Hoehe einstellen!";
			x = 0.38;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class Alt_slider : ES_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[_this select 1] call fnc_alt_onsliderchange";
			tooltip = "Ihr gewuenschte Hoehe";
			x = 0.42;
			y = 0.30 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class ALT_value : ES_RscText
		{
			idc = 2902;
			text = "";
			
			x = 0.70; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class KEY_value : ES_RscText
		{
			idc = 2904;
			text = "";
			
			x = 0.70; y = 0.258;
			w = 0.275; h = 0.04;
		};

		
		class ES_ButtonClose : ES_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";
			x = 0.48;
			y = 0.6 - (2 / 15);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
